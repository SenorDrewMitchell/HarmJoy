class MomentTypesController < ApplicationController
  before_action :set_moment_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @moment_types = MomentType.all
    respond_with(@moment_types)
  end

  def show
    respond_with(@moment_type)
  end

  def new
    @moment_type = MomentType.new
    respond_with(@moment_type)
  end

  def edit
  end

  def create
    @moment_type = MomentType.new(moment_type_params)
    @moment_type.save
    respond_with(@moment_type)
  end

  def update
    @moment_type.update(moment_type_params)
    respond_with(@moment_type)
  end

  def destroy
    @moment_type.destroy
    respond_with(@moment_type)
  end

  private
    def set_moment_type
      @moment_type = MomentType.find(params[:id])
    end

    def moment_type_params
      params.require(:moment_type).permit(:name, :description)
    end
end
