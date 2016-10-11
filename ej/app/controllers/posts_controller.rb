class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @assignment = Assignment.find(params[:assignment_id])
    @posts = Post.where(assignment_id: @assignment.id)
    if Time.zone.now > @assignment.final_deadline #final deadline has passed
      @posts.each do |p|
        if p.draft2.nil? # student did not submit a final draft
          if !p.draft1.nil? && p.draft1.length > 0 # student never pressed submit - we must update submit to display the post
            p.submitted = true
            p.save
          end
        end
      end
    end
    if @assignment.is2group
      @twoGroupCount = @assignment.twoGroupCount(@assignment)
    end
    if !current_user.admin?
      @post =  Post.where(assignment_id: @assignment.id, user_id: current_user.id).first
      ahoy.track "Visited Assignments Page"
    end
  end

  def inclass
    @posts = Post.where(bookmarked: true)
  end

  def myposts
    if current_user.admin
      @user = User.find(params[:user_id])
      @posts = Post.where(user_id: @user.id)
    else
      @posts = Post.where(user_id: current_user.id)
      ahoy.track "Visited My Post Page"
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    # finds the proper comment form for the group the author was assigned to for this assignment
    @form = @post.assignment.comment_forms[0]
    if @post.assignment.is2group
      @twoGroupCount = @post.assignment.twoGroupCount(@post.assignment)
      if @post.user.assigned_groups[@twoGroupCount.to_i - 1] == "2"
        @form = @post.assignment.comment_forms[1]
      end
    end
  end

  # GET /posts/new
  def new
    @assignment = Assignment.find(params[:assignment_id])
    # ensures that user is assigned to proper number of groups for the number of 2-group assignments that exist
    current_user.assignToGroups(current_user, @assignment)
    @twoGroupCount = @assignment.twoGroupCount(@assignment)
    current_user.save
    @post = Post.new(assignment_id: @assignment.id)
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @assignment = Assignment.find(@post.assignment_id)
    @form = @post.assignment.comment_forms[0]
    if @assignment.is2group # need to assign user to a new group number, either 1 or 2
      @twoGroupCount = @assignment.twoGroupCount(@assignment)
      if @post.user.assigned_groups[@twoGroupCount.to_i - 1] == "2"
        @form = @post.assignment.comment_forms[1]
      end
    end

    ahoy.track "Edited Post", post_id: @post.id
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if params[:commit] == 'Submit Post To Class'
      @post.submitted = true
      #@post.draft2 = @post.draft1
      @post.draft2 = ""
    elsif params[:commit] == 'Save Post'
      if @post.draft1.nil?
        @post.draft1 = ""
        @post.submitted = true
      end
    else
      @post.submitted = false
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to edit_post_path(@post), notice: 'Post was successfully created.' }
        format.json { render :edit, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

    if params[:commit] == 'Submit Post To Class'
      @post.submitted = true
      #@post.draft2 = @post.draft1
      @post.draft2 = ""
    end


    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to edit_post_path(@post), notice: 'Post was successfully updated.' }
        format.json { render :edit, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def flop
    post = Post.find(params[:id])
    if !post.bookmarked
      UserMailer.notification_email(post.user).deliver_now
    end
    post.bookmarked = !post.bookmarked # flop the status
    post.save

    redirect_to post_path(post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
        params.require(:post).permit(:headline, :draft1, :draft2, :bookmarked, :user_id, :assignment_id, :position_id, :assigned_groups)
    end
end
