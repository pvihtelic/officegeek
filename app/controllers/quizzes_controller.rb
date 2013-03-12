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
    @quiz = @user.quizzes.create(params[:quiz])

    respond_to do |format|
      if @quiz.save
        # email = ReservationMailer.confirm(@reservation)
        # email.deliver

        format.html { redirect_to @user, notice: 'Quiz was successfully created.' }
        format.json { render json: @user, status: :created, location: @quiz }
      else
        format.html { render action: "new" }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quizzes/1
  # PUT /quizzes/1.json
  def update
    @quiz = Quiz.find(params[:id])
    @quiz = Quiz.update_attr(params)
    @user = current_user

    respond_to do |format|
      if @quiz.update_attributes(params[:quiz])
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
end
