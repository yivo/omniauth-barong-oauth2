# encoding: UTF-8
# frozen_string_literal: true

require "omniauth-oauth2"
require "uri"
require "active_support/core_ext/object/deep_dup"

module OmniAuth::Strategies
  class Barong < OAuth2
    option :name, "barong"
    option :authorize_path, "/oauth/authorize"
    option :account_path, "/oauth/account"
    args %i[ root_url client_id client_secret ]

    def client
      options.client_options.site           = root_url
      options.client_options.authorize_path = options.authorize_path
      super
    end

    def root_url
      @root_url ||= URI.parse(options.root_url).to_s
    end

    uid { account.fetch("uid") }

    info { account.deep_dup }

    def account
      @account ||= access_token.get(URI.join(root_url, options.account_path).to_s).parsed
    end

    # See https://github.com/omniauth/omniauth-oauth2/issues/81
    def callback_url
      full_host + script_name + callback_path
    end
  end
end
