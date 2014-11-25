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
  ['Scrutineering - Day 1', Date.new(2015,1,1) , dakar2015.id],
  ['Scrutineering - Day 2', Date.new(2015,1,2) , dakar2015.id],
  ['Scrutineering/Start Ceremony - Day 3', Date.new(2015,1,3) , dakar2015.id],
  ['Stage - 1', Date.new(2015,1,4) , dakar2015.id],
  ['Stage - 2', Date.new(2015,1,5) , dakar2015.id],
  ['Stage - 3', Date.new(2015,1,6) , dakar2015.id],
  ['Stage - 4', Date.new(2015,1,7) , dakar2015.id],
  ['Stage - 5', Date.new(2015,1,8) , dakar2015.id],
  ['Stage - 6', Date.new(2015,1,9) , dakar2015.id],
  ['Moto/Quad Rest Day : Car/Truck ???', Date.new(2015,1,10) , dakar2015.id],
  ['???', Date.new(2015,1,11) , dakar2015.id],
  ['Moto/Quad ??? : Car/Truck Rest Day', Date.new(2015,1,12) , dakar2015.id],
  ['Stage - 7', Date.new(2015,1,13) , dakar2015.id],
  ['Stage - 8', Date.new(2015,1,14) , dakar2015.id],
  ['Stage - 9', Date.new(2015,1,15) , dakar2015.id],
  ['Stage - 10', Date.new(2015,1,16) , dakar2015.id],
  ['Stage - 11/Finish', Date.new(2015,1,17) , dakar2015.id],
]