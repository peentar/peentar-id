require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class PeentarID < OmniAuth::Strategies::OAuth2
      option :name, 'peentar_id'

      option :client_options, {
        site:           ::PeentarID.auth_site,
        authorize_url:  ::PeentarID.auth_url,
        token_url:      ::PeentarID.token_url,
        redirect_uri:   ::PeentarID.redirect_uri,
        auth_scheme:    :basic_auth,
      }

      def raw_info
        return @raw_info unless @raw_info.nil?


        user_info = ::PeentarID.user_info_url

        @raw_info = access_token.get(user_info).parsed
        @raw_info
      end

      uid do
        raw_info['sub']
      end

      info do
        {
          name: raw_info['name'],
          email: raw_info['email'],
          sub: raw_info['sub'],
          uid: raw_info['uid'],
          email_verified: raw_info['email_verified'],
          phone_number: raw_info['phone_number'],
          phone_number_verified: raw_info['phone_number_verified'],
          address: raw_info['address']
        }
      end
    end
  end
end

OmniAuth.config.add_camelization "peentar_id", "PeentarID"
