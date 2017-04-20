require 'omniauth-oauth2'
require 'base64'

module OmniAuth
  module Strategies
    class PolarOauth2 < OmniAuth::Strategies::OAuth2
      option :name, 'polar_oauth2'

      option :client_options,
        {
          :site           => '',
          :authorize_url  => 'https://flow.polar.com/oauth2/authorization',
          :token_url      => 'https://polarremote.com/v2/oauth2/token'

        }

      option :authorize_option, [:response_type, :scope, :state]
      option :response_type, 'code'

      def build_access_token
        options.token_params.merge!(:headers =>
          {'Authorization' => basic_auth_header})
        super
      end

      def basic_auth_header
        'Basic ' + Base64.encode64(options[:client_id] + ':' + options[:client_secret]).gsub("\n", '')
      end


      def query_string
        ''
      end


      uid do
        row_info['member-id']
      end

      info do
        {
          :name       => row_info['first-name'] + row_info['last-name']
        }
      end

      extra do
        {
          :row_info => row_info
        }
      end

      def row_info
        @row_info ||= access_token.request('post', '/v3/users', {'member-id': uid}).parsed
      end
    end
  end
end

