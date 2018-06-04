class HomeController < ApplicationController

  def index
  end

  def calculate
    render :index if params[:input].nil?
    @result = Calculation.new(params[:input]).result
    render :index
  end
end
