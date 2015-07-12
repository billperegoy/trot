class WorkoutsController < ApplicationController
  def new
    @day = Day.find(params[:day_id])
    @week = @day.week
    @training_plan = @week.training_plan

    @workout = Workout.new
  end

  def create
    @day = Day.find(params[:day_id])
    @week = @day.week
    @training_plan = @week.training_plan

    @workout = @day.workouts.new(workout_params)
    if @workout.save
      redirect_to training_plan_path(@training_plan)
    else
      render :new
    end

  end

  private 
  def workout_params
    params.require(:workout).permit(:distance)
  end
end
