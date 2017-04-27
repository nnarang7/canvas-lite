class SubmissionsController < ApplicationController
  def index
  	@submissions = Submission.where(assignment_id: params[:assignment_id])
  	@assignment_id = params[:assignment_id]
  	p @assignment_id
  end

  def new
  	@submission = Submission.new
  	@assignment = Assignment.find(params[:assignment_id])
  	@student = User.find(session[:user_id])
  end

  def edit
    @submission = Submission.find(params[:id])
    @assignment = Assignment.find(params[:assignment_id])
    @student = User.find(params[:user_id])
  end

  def create
    @submission = Submission.new(submission_params)
  
  	if @submission.save
     redirect_to my_assignments_path, notice: "The submission #{@submission.name} has been uploaded."
  	else
     render "new"
  	end	
  end

  def update
    @submission = Submission.find(params[:id])
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to submissions_path(:assignment_id => submission_params[:assignment_id]), notice: 'Score was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end    
  end

  def destroy
     @submission = Submission.find(params[:id])
     @submission.destroy  	
     redirect_to my_assignments_path, notice:  "The submission #{@submission.name} has been deleted."
  end

   private
      def submission_params
      params.require(:submission).permit(:name, :attachment, :user_id, :assignment_id, :score)
   end

end
