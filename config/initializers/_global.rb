# Load configuration files held in the config/global directory.
Global.configure do |config|
  config.environment = Rails.env.to_s
  config.config_directory = Rails.root.join('config/global').to_s
end

# Verify presence of ENV vars
Global.env.hash.keys.each do |env_key|
  is_var_present = Global.env.public_send(env_key.to_sym).present?

  raise "Could not find value for required ENV var \"#{env_key}\"" unless is_var_present
end
