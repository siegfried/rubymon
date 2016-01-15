secrets = Rails.application.secrets

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, secrets.facebook_id, secrets.facebook_secret
end
