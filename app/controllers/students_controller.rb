class StudentsController < ApplicationController

  def index
    students = Student.all
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student 
  end
  
  def index
    name_query = params[:name]
    if name_query.blank?
      students = Student.all
    else
      students = Student.where('first_name LIKE :query OR last_name LIKE :query', query: "%#{name_query}%")
    end
    render json: students
  end

end
