Apipie.configure do |config|
  config.app_name                = "LaVaca"
  config.api_base_url            = ""
  config.doc_base_url            = "/apidoc"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/{[!*/]**/*,*}.rb"
  config.translate = false
end
