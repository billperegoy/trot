class WeeksController < ApplicationController
  def new
    @training_plan = TrainingPlan.find(params[:training_plan_id])
    @week = @training_plan.weeks.new
  end

  def create
    @training_plan = TrainingPlan.find(params[:training_plan_id])
    @week = @training_plan.weeks.new(week_params)
    if @week.save
      redirect_to @training_plan
    else
      render :new
    end
  end

  private
  def week_params
    params.require(:week).permit(:number)
  end
end
