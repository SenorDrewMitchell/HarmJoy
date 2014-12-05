class PagesController < ApplicationController
  before_filter :authenticate_contributor!, :except => [:main]
  
  def main  

    @tags = Tag.active_tags_with_moments_ordered
    
    #create moment map feature by tag
    gon.jbuilder "app/views/moments/moments_collection_geo_json.json.jbuilder", as: "moments"
  end
  
  def dashboard
  end
end
