class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "You have succesfully Sign Up"
      redirect_to root_path
    else
      flash
      render 'new'
    end
  end

  private
    def student_params
      params.require(:student).permit(:name, :email)
    end
end
