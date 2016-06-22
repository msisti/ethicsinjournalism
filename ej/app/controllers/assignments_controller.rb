class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
    # 1.times { @assignment.positions.build}
    @assignment.comment_forms.build

    @all_comment_forms = CommentForm.all
    # params[assignment:[:comment_forms]]
    # params[:comment_forms]
    # 1.times { @assignment.comment_forms.build }

  end

  def is2group=(some_value)
    @is2group=some_value #real assignment! no more fooling
  end

  # GET /assignments/1/edit
  def edit
    @all_comment_forms = CommentForm.all
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(params[:assignment].permit(:title, :description, :draft_deadline, :final_deadline, :comment_deadline, :description2,
        :is2group, positions_attributes:[:id, :title, :_destroy],
        comment_forms_attributes:[:id, :name, :group_number, :question1, :question2, :question3, :question4, :hint1, :hint2, :hint3, :hint4]))

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to assignments_path, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(params[:assignment].permit(:title, :description, :draft_deadline, :final_deadline, :comment_deadline, :description2,
          :is2group, positions_attributes:[:id, :title, :_destroy],
          comment_forms_attributes:[:id, :name, :group_number, :question1, :question2, :question3, :question4, :hint1, :hint2, :hint3, :hint4]))
        format.html { redirect_to assignments_path, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:title, :description, :draft_deadline, :final_deadline, :comment_deadline, :description2, :is2group,
          positions_attributes: [:id, :title],
          comment_forms_attributes:[:id, :name, :group_number, :question1, :question2, :question3, :question4, :hint1, :hint2, :hint3, :hint4])
    end
end
