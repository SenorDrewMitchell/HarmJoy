class Moment < ActiveRecord::Base
  has_and_belongs_to_many :tags
  
  belongs_to :race_day
  
  def associate_tags_by_id_array(tag_id_array)
    self.tags = []
    tag_id_array.select{|a| a != ""}.each do |tag_id|
      self.tags << Tag.find_by(:id => tag_id) unless self.tags.include?(Tag.find_by(:id => tag_id))
    end
  end
end
