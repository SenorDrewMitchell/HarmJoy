class PagesController < ApplicationController
  before_filter :authenticate_contributor!, :except => [:main]
  
  def main  
    @tags = Tag.where(:active => true)
  end
  
  def dashboard
  end
end
