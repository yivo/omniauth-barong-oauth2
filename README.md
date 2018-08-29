# OmniAuth strategy for Barong OAuth2

## Usage

`config/initializers/omniauth.rb`:

```ruby
# encoding: UTF-8
# frozen_string_literal: true

Rails.logger.warn { "Enabling Barong OAuth2." }
require "omniauth-barong-oauth2"
Rails.application.config.middleware.use OmniAuth::Builder do
provider :barong,
          ENV.fetch("BARONG_ROOT_URL"),
          ENV.fetch("BARONG_CLIENT_ID"),
          ENV.fetch("BARONG_CLIENT_SECRET"),
          authorize_path: "/oauth/authorize", # Optional.
          account_path:   "/oauth/account"  # Optional.
end
```
