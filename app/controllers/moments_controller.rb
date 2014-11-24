class MomentsController < ApplicationController
  before_action :set_moment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @moments = Moment.all
    respond_with(@moments)
  end

  def show
    respond_with(@moment)
  end

  def new
    @moment = Moment.new
    respond_with(@moment)
  end

  def edit
  end

  def create
    @moment = Moment.new(moment_params)
    @moment.save
    respond_with(@moment)
  end

  def update
    @moment.update(moment_params)
    respond_with(@moment)
  end

  def destroy
    @moment.destroy
    respond_with(@moment)
  end

  private
    def set_moment
      @moment = Moment.find(params[:id])
    end

    def moment_params
      params.require(:moment).permit(:name, :description, :source, :lat, :long, :parent_moment_id, :moment_type_id, :asset_id, :race_date_id, :active)
    end
end
