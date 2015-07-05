class TrainingPlansController < ApplicationController
  def new
    @training_plan = TrainingPlan.new
  end

  def create
    @training_plan = TrainingPlan.new(training_plan_params)
    if @training_plan.save
      redirect_to @training_plan
    else
      render :new
    end
  end

  def show
    @training_plan = TrainingPlan.find(params[:id])
  end

  def index
    @training_plans = TrainingPlan.all
  end

  private
  def training_plan_params
    params.require(:training_plan).permit(:name, :distance)
  end
end
