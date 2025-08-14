keycloak = Rails.application.credentials.keycloak

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid,
           keycloak[:client_id],
           keycloak[:client_secret],
           client_options: {
             site: "#{keycloak[:host]}:#{keycloak[:port]}/realms/#{keycloak[:realm]}",
             realm: keycloak[:realm],
             base_url: "",
             redirect_uri: keycloak[:redirect_uri]
           },
           name: "keycloak"
end
