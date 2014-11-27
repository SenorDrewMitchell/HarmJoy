class Moment < ActiveRecord::Base
  has_and_belongs_to_many :tags
  
  belongs_to :race_date
  
  def self.associate_tags_via_comma_seperated_string(string) 
     string.split(',').each do |tag_name|
       tag = Tag.find_or_initialize_by(:name => tag_name.strip)
     end
  end
end
