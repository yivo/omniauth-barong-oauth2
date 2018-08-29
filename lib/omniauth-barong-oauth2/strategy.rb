# encoding: UTF-8
# frozen_string_literal: true

require "omniauth-oauth2"
require "uri"

module OmniAuth::Strategies
  class BarongOAuth2 < OAuth2
    option :name, "barong-oauth2"
    option :authorize_path, "/oauth/authorize"
    option :resource_path, "/oauth/account"
    args %i[ root_url client_id client_secret ]

    def client
      options.client_options.site          = root_url
      options.client_options.authorize_url = URI.join(root_url, options.authorize_path)
      options.client_options.redirect_uri  = full_host + script_name + callback_path
      super
    end

    def root_url
      @root_url ||= URI.parse(options.root_url)
    end

    uid { resource.fetch("uid") }

    info { puts resource; resource }

    def resource
      @resource ||= access_token.get(URI.join(root_url, options.resource_path)).parsed
    end
  end
end
