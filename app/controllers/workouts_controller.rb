class WorkoutsController < ApplicationController
    before_action :check_user_login

  def index
    if params[:date]
      @date = params[:date].to_date.in_time_zone
    else
      @date = Time.zone.now
    end
    @workouts = Workout.find_by(date: @date.beginning_of_day..@date.end_of_day)
    if @workouts
      @max_weight = @current_user[(@workouts.major_exercise).to_sym] * 0.95
      @current_week = Week.find(@workouts.week_id)
      session[:workout_id] = @workouts.id
      @assistance_exercises = AssistanceExercise.where(workout_id: session[:workout_id])
      if @workouts.rep_record
        @rep_record = @workouts.rep_record
      end
    end
    @workout_month = Workout.where(date: @date.beginning_of_month..@date.end_of_month).map do |d|
      d.date.to_date
    end
    
  end

  def new
    @workout = Workout.new
    respond_to do |format|
      format.js { render :index }
    end
  end

  def show
    @workout = Workout.find_by(params[:id])
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = session[:user_id]
    @workout.date = params[:date]
    if @workout.save
    respond_to do |format|
      format.js { :create }
    end
    else 
      respond_to do |format|
        format.js { :index }
      end
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
    params.require(:workout).permit(:major_exercise, :rep_record, :week_id, :date)
  end
end
