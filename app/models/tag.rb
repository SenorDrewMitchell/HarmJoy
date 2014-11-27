class Tag < ActiveRecord::Base
  has_and_belongs_to_many :moments

  def before_save 
    self.name = Tag.normalize_tag_name(self.name)
  end 
  
  def self.normalize_tag_name(string)
    if !string.nil? 
      return string.to_s.strip.gsub(/[^A-Za-z0-9-\s]+/, "").gsub(/[_\s]+/, '-').downcase
    end
  end
  
end
