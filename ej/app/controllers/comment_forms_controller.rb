class CommentFormsController < ApplicationController
  before_action :set_comment_form, only: [:show, :edit, :update, :destroy]

  # GET /comment_forms
  # GET /comment_forms.json
  def index
    @comment_forms = CommentForm.all
  end

  # GET /comment_forms/1
  # GET /comment_forms/1.json
  def show
  end

  # GET /comment_forms/new
  def new
    @comment_form = CommentForm.new
  end

  # GET /comment_forms/1/edit
  def edit
  end

  # POST /comment_forms
  # POST /comment_forms.json
  def create
    @comment_form = CommentForm.new(comment_form_params)

    respond_to do |format|
      if @comment_form.save
        format.html { redirect_to @comment_form, notice: 'Comment form was successfully created.' }
        format.json { render :show, status: :created, location: @comment_form }
      else
        format.html { render :new }
        format.json { render json: @comment_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_forms/1
  # PATCH/PUT /comment_forms/1.json
  def update
    respond_to do |format|
      if @comment_form.update(comment_form_params)
        format.html { redirect_to @comment_form, notice: 'Comment form was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_form }
      else
        format.html { render :edit }
        format.json { render json: @comment_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_forms/1
  # DELETE /comment_forms/1.json
  def destroy
    @comment_form.destroy
    respond_to do |format|
      format.html { redirect_to comment_forms_url, notice: 'Comment form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_form
      @comment_form = CommentForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_form_params
      params.require(:comment_form).permit(:name, :group_number, :assignment_id)
    end
end
