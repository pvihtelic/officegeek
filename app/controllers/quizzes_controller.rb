class QuizzesController < ApplicationController
  # GET /quizzes
  # GET /quizzes.json

  # private
  # def authenticate_owner!
  #   if user_signed_in? && current_user.id == params[:id] # or something similar
  #     return true
  #   end
  #   redirect_to root_url,
  #     :notice => "You must have permission to access this category."
  #   return false
  # end

  before_filter :authenticate_user!

  def index
    @quizzes = current_user.quizzes.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quizzes }
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    
    @quiz = Quiz.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quiz }
    end
  end

  # GET /quizzes/new
  # GET /quizzes/new.json
  def new
    @quiz = Quiz.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quiz }
    end
  end

  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @user = current_user
    @quiz = Quiz.new(params[:quiz])
    if !params[:quiz][:title].nil?
      if params[:quiz][:title].include? "Scratch"
        @quiz.tutorial_id = 1
        @quiz.blank_quiz_id = 1
      elsif params[:quiz][:title].include? "Worksheets"
        @quiz.tutorial_id = 2
        @quiz.blank_quiz_id = 2
      elsif params[:quiz][:title].include? "Intro to Formulas"
        @quiz.tutorial_id = 3
        @quiz.blank_quiz_id = 3
      elsif params[:quiz][:title].include? "Intro to Formatting"
        @quiz.tutorial_id = 4
        @quiz.blank_quiz_id = 4
      elsif params[:quiz][:title].include? "Charts"
        @quiz.tutorial_id = 5
        @quiz.blank_quiz_id = 5
      elsif params[:quiz][:title].include? "Sorting and Filtering"
        @quiz.tutorial_id = 6
        @quiz.blank_quiz_id = 6
      elsif params[:quiz][:title].include? "Pivot Tables"
        @quiz.tutorial_id = 7
        @quiz.blank_quiz_id = 7
      elsif params[:quiz][:title].include? "Printing"
        @quiz.tutorial_id = 8
        @quiz.blank_quiz_id = 8
      end
    end

    @quiz.status = 1

    @quiz.save

    respond_to do |format|
      if @quiz.save
        UserMailer.upload_notification_email(@user).deliver
        AdminMailer.admin_upload_notification_email(@quiz, @user).deliver

        format.html { redirect_to @user, notice: 'Your Skill Assessment was successfully uploaded.  We will review your responses and follow up with an email.' }
        format.json { render json: @user, status: :created, location: @quiz }
      elsif @quiz.errors.any?
        flash[:error] = 'Please make sure that you selected a file that ends in ".xlsx" and that is under 50 KB in size. Also please check that you selected a topic.'
        return(redirect_to :back)
      else  
        format.html { redirect_to @user, notice: 'No file was selected.  Please back and choose "Select Your Answer File" before submitting.' }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quizzes/1
  # PUT /quizzes/1.json
  def update
    @quiz = Quiz.find_or_initialize_by_id(params[:quiz][:id])
    @quiz.update_attributes(params[:quiz])


    @user = current_user

    respond_to do |format|
      if @quiz.update_attributes(params[:quiz])
        UserMailer.user_update_quiz_notification_email(@user).deliver
        AdminMailer.admin_update_quiz_notification_email(@quiz, @user).deliver

        format.html { redirect_to @user, notice: 'Your quiz was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy

    @user = current_user

    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end
  end

  def destroy_multiple
    Quiz.destroy(params[:quiz])

    respond_to do |format|
      format.html { redirect_to "/users/#{current_user.id}" }
      format.json { head :no_content }
    end
  end

end
