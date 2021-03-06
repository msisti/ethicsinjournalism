class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @comment.comment_answers.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment].permit(:content, :user_id, :post_id, :comment_form_id, :answer1, :answer2, :answer3, :answer4,
    comment_answers_attributes:[:id, :content, :user_id, :comment_prompt_id]))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to Post.where(id: @comment.post_id).first, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(params[:comment].permit(:content, :user_id, :post_id, :answer1, :answer2, :answer3, :answer4,
        comment_answers_attributes:[:id, :content, :user_id]))
        format.html { redirect_to Post.where(id: @comment.post_id).first, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to Post.where(id: @comment.post_id).first, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
        params.require(:comment).permit(:content, :post_id, :user_id, :answer1, :answer2, :answer3, :answer4, :comment_form_id,
        comment_answers_attributes: [:id, :content, :user_id, :comment_prompt_id])
    end
end
