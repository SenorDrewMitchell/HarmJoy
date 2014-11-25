class PagesController < ApplicationController
  before_filter :authenticate_contributor!, :except => [:main]
  def main  
  end
  
  def dashboard
  end
end
