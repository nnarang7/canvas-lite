class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    p "in show"
    @student = User.find(session[:user_id])
    @courses_enrolled = @student.courses
    p @courses_enrolled   
  end

  # GET /courses/1
  # GET /courses/1.json
  def show

  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  def individual_view
    @student = User.find(session[:user_id])
    @courses = @student.courses
    render :student_courses
  end

  def enroll
    @course = Course.find(params[:id])
    @student = User.find(session[:user_id])
    @course.users.push(@student)
    @student.courses.push(@course)
    @course.save
    @student.save

    redirect_to dashboard_path
  end

  def unenroll
    @course = Course.find(params[:id])
    @student = User.find(session[:user_id])
    @course.users.delete(@student)
    @student.courses.delete(@course)
    @course.save
    @student.save

    redirect_to dashboard_path

  end

  # POST /courses
  # POST /courses.json
  def create
    p course_params
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :professor, :location, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :starting_time, :ending_time)
    end
end
