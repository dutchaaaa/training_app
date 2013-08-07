class AssistanceExercisesController < ApplicationController

  before_action :check_user_login
  
  def new
    @assistance_exercise = AssistanceExercise.new
  end

  def create
    @assistance_exercise = AssistanceExercise.new(assistance_exercise_params)
    @assistance_exercise.workout_id = session[:workout_id]
    @assistance_exercise.save
    redirect_to workouts_path
  end

  def index
    @assistance_exercises = AssistanceExercise.find_all_by(workout_id: session[:workout_id])
  end

  def edit
    @assistance_exercise = AssistanceExercise.find(params[:id])
  end

  def update
    @assistance_exercise = AssistanceExercise.find(params[:id])
    @assistance_exercise.update(assistance_exercise_params)
    redirect_to workouts_path
  end


  private 

  def assistance_exercise_params
    params.require(:assistance_exercise).permit(:name, :reps1, :reps2, :reps3, :weight1, :weight2, :weight3)
  end
end
