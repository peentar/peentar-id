module PeentarID
  def set_config(name, default)
    name_string = name.to_s
    PeentarID.module_eval <<-EVAL
      def self.#{name_string}
        @@__#{name_string}
      end

      def self.#{name_string}=(val)
        @@__#{name_string} = val
      end
EVAL

    class_variable_set("@@__#{name}".to_sym, default)
  end

  PeentarID.set_config :auth_site, 'https://auth.peentar.id/'
  PeentarID.set_config :auth_url, 'https://sso.peentar.id/oauth2/auth'
  PeentarID.set_config :token_url, 'https://sso.peentar.id/oauth2/token'
  PeentarID.set_config :redirect_uri, nil
  PeentarID.set_config :user_info_url, 'https://auth.peentar.id/api/v1/user/info.json'

  require 'omni_auth/strategies/peentar_id'

end
