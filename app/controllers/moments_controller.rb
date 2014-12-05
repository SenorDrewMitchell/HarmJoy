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
    associate_tags_by_id_array(@moment)
    redirect_to moments_path
  end

  def update
    if @moment.update(moment_params)    
      associate_tags_by_id_array(@moment)
    
      redirect_to moments_path, :alert => "Moment succesfully updated"
    else  
      render action: 'edit'  
    end
    
  end

  def destroy
    @moment.destroy
    respond_with(@moment)
  end

  private
  
    def associate_tags_by_id_array(moment)
      tags = []
      if params.has_key?(:comma_seperated_tag_string)
        tags = Tag.build_tag_id_array_from_comma_seperated_string(params[:comma_seperated_tag_string])
      end
      if params[:moment].has_key?(:tag_ids)
        tags = params[:moment][:tag_ids] + tags
      end
      moment.associate_tags_by_id_array(tags)
    end
  
    def set_moment
      @moment = Moment.find(params[:id])
    end

    def moment_params
      params.require(:moment).permit(:name, :description, :source, :lat, :long, :tag_ids,:race_day_id, :active)
    end
end
