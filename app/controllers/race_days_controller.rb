class RaceDaysController < ApplicationController
  before_action :set_race_day, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @race_days = RaceDay.all
    respond_with(@race_days)
  end

  def show
    respond_with(@race_day)
  end

  def new
    @race_day = RaceDay.new
    respond_with(@race_day)
  end

  def edit
  end

  def create
    @race_day = RaceDay.new(race_day_params)
    @race_day.save
    respond_with(@race_day)
  end

  def update
    @race_day.update(race_day_params)
    respond_with(@race_day)
  end

  def destroy
    @race_day.destroy
    respond_with(@race_day)
  end

  private
    def set_race_day
      @race_day = RaceDay.find(params[:id])
    end

    def race_day_params
      params.require(:race_day).permit(:name, :race_date, :race_id)
    end
end
