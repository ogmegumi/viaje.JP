class PlansController < ApplicationController
  
  def index
    @plans = Plan.all
  end
  
  def new
    @plan = Plan.new
  end
  
  def edit
  end
  
  def create
    @plan = Plan.new(plan_params)
  end
  
  def update
  end
  
  def destroy
  end
  
end
