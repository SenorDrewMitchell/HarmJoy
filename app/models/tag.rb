class Tag < ActiveRecord::Base
  has_and_belongs_to_many :moments

  before_save do
    self.name = Tag.normalize_tag_name(self.name)
  end 
  
  scope :active_tags_with_moments_ordered, -> {where(:active => true).where(:id => Tag.select(:id).joins(:moments).group('tags.id') ).order(name: :asc)}
  
  
  def self.normalize_tag_name(string)
    if !string.nil? 
      return string.to_s.strip.gsub(/[^A-Za-z0-9-\s]+/, "").gsub(/[_\s]+/, '_').downcase
    end
  end
  
  def self.build_tag_id_array_from_comma_seperated_string(string) 
    tags = []
     string.split(',').each do |tag_name|
       tag = Tag.find_or_initialize_by(:name => Tag.normalize_tag_name(tag_name.strip))
       tag.save
       tags << tag.id
     end
     
     return tags
  end
end
