class WorkoutsController < ApplicationController
    before_action :check_user_login

  def index
    if params[:date]
      @date = params[:date].to_date.to_time_in_current_zone
    else
      @date = Time.zone.now
    end
    @workouts = Workout.find_by(created_at: @date.beginning_of_day..@date.end_of_day)
    if @workouts
      @max_weight = @current_user[(@workouts.major_exercise).to_sym] * 0.95
      @current_week = Week.find(@workouts.week_id)
    end
    @workout_month = Workout.where(created_at: @date.beginning_of_month..@date.end_of_month).map do |d|
      d.created_at.to_date
    end
    if @workouts.rep_record
      @rep_record = @workouts.rep_record
    end
    session[:workout_id] = @workouts.id
    @assistance_exercises = AssistanceExercise.where(workout_id: session[:workout_id])
  end

  def new
    @workout = Workout.new
    
  end

  def show
    @workout = Workout.find_by(params[:id])
  end

  def create
    @workout = Workout.new workout_params
    @workout.user_id = session[:user_id]
    if @workout.save
    redirect_to workouts_path
    else 
      render :new
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])

    if @workout.update_attributes params[:workout]
       redirect_to workout_path
    else
       render :edit
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
  end

  private

  def workout_params
    params.require(:workout).permit(:major_exercise, :rep_record, :week_id)
  end
end
