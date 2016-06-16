class CommentPromptsController < ApplicationController
  before_action :set_comment_prompt, only: [:show, :edit, :update, :destroy]

  # GET /comment_prompts
  # GET /comment_prompts.json
  def index
    @comment_prompts = CommentPrompt.all
  end

  # GET /comment_prompts/1
  # GET /comment_prompts/1.json
  def show
  end

  # GET /comment_prompts/new
  def new
    @comment_prompt = CommentPrompt.new
  end

  # GET /comment_prompts/1/edit
  def edit
  end

  # POST /comment_prompts
  # POST /comment_prompts.json
  def create
    @comment_prompt = CommentPrompt.new(comment_prompt_params)

    respond_to do |format|
      if @comment_prompt.save
        format.html { redirect_to @comment_prompt, notice: 'Comment prompt was successfully created.' }
        format.json { render :show, status: :created, location: @comment_prompt }
      else
        format.html { render :new }
        format.json { render json: @comment_prompt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_prompts/1
  # PATCH/PUT /comment_prompts/1.json
  def update
    respond_to do |format|
      if @comment_prompt.update(comment_prompt_params)
        format.html { redirect_to @comment_prompt, notice: 'Comment prompt was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_prompt }
      else
        format.html { render :edit }
        format.json { render json: @comment_prompt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_prompts/1
  # DELETE /comment_prompts/1.json
  def destroy
    @comment_prompt.destroy
    respond_to do |format|
      format.html { redirect_to comment_prompts_url, notice: 'Comment prompt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_prompt
      @comment_prompt = CommentPrompt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_prompt_params
      params[:comment_prompt]
    end
end
