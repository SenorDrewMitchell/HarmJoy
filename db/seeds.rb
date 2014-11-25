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