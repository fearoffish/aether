App.configure do
  # Settings specified here will take precedence over those in config/app.rb

  config.knife_config_file = File.expand_path(
    File.join("#{Rails.root}", "spec", "fixtures", "chef", "knife.rb")
  )
end