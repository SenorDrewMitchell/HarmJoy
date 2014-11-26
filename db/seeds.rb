#
# We don't want to commit the admin user to version control on an OS project
#
if Rails.env == "development"
  dev_admin = Contributor.find_or_initialize_by(:user_name => "admin")
  dev_admin.email = 'big_whig@harmjoy.com'
  dev_admin.password = "administrator"
  dev_admin.password_confirmation = dev_admin.password
  dev_admin.about = "A pretend admin for dev purposes"
  dev_admin.admin = true  
  dev_admin.save
end

dakar2015 = Race.find_or_initialize_by(:name => 'Dakar 2015')
dakar2015.save

# name, race_date, race_id
dakar_2015_race_days = [
  ['Scrutineering - Day 1', Date.new(2015,1,1) , dakar2015],
  ['Scrutineering - Day 2', Date.new(2015,1,2) , dakar2015],
  ['Scrutineering/Start Ceremony - Day 3', Date.new(2015,1,3) , dakar2015],
  ['Stage - 1', Date.new(2015,1,4) , dakar2015],
  ['Stage - 2', Date.new(2015,1,5) , dakar2015],
  ['Stage - 3', Date.new(2015,1,6) , dakar2015],
  ['Stage - 4', Date.new(2015,1,7) , dakar2015],
  ['Stage - 5', Date.new(2015,1,8) , dakar2015],
  ['Stage - 6', Date.new(2015,1,9) , dakar2015],
  ['Moto/Quad Rest Day : Car/Truck Stage - 7', Date.new(2015,1,10) , dakar2015],
  ['Moto/Quad - Stage 7 : Car/Truck Stage - 8', Date.new(2015,1,11) , dakar2015],
  ['Moto/Quad Stage 8 : Car/Truck Rest Day', Date.new(2015,1,12) , dakar2015],
  ['Stage - 9', Date.new(2015,1,13) , dakar2015],
  ['Stage - 10', Date.new(2015,1,14) , dakar2015],
  ['Stage - 11', Date.new(2015,1,15) , dakar2015],
  ['Stage - 12', Date.new(2015,1,16) , dakar2015],
  ['Stage - 13/Finish', Date.new(2015,1,17) , dakar2015],
]

dakar_2015_race_days.each do |name, date, race|
  race_day = RaceDay.find_or_initialize_by(:name => name)
  race_day.race_date = date
  race_day.race = race
  race_day.save
end

dakar2015.start_day = RaceDay.find_by(:race_date => Date.new(2015,1,1))
dakar2015.end_day = RaceDay.find_by(:race_date => Date.new(2015,1,17))
dakar2015.save

tags = [
  'moto',
  'quad',
  'car',
  'truck',
  'ass',
  'dss',
  'adv-rider',
]

tags.each do |name|
  tag = Tag.find_or_initialize_by(:name => name)
  tag.active = true
  tag.is_default = true
  tag.save
end

tags =[]

moments = [
  ["Beunos Aires"],
  ["Villa Carlos Paz"],
  ["San Juan"],
  ["Chilecito"],
  ["Copalapo"],
  ["Antofagasta"],
  ["Iquique"],
  ["Uyuni"],
  ["Calama"], 
  ["Salta"],
  ["Termas Rio Hondo"],
  ["Rosario"],
  
  
]