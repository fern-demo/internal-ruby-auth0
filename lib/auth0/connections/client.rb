# frozen_string_literal: true

module Auth0
  module Connections
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieves detailed list of all <a href="https://auth0.com/docs/authenticate/identity-providers">connections</a>
      # that match the specified strategy. If no strategy is provided, all connections within your tenant are retrieved.
      # This action can accept a list of fields to include or exclude from the resulting list of connections.
      #
      # This endpoint supports two types of pagination:
      # <ul>
      # <li>Offset pagination</li>
      # <li>Checkpoint pagination</li>
      # </ul>
      #
      # Checkpoint pagination must be used if you need to retrieve more than 1000 connections.
      #
      # <h2>Checkpoint Pagination</h2>
      #
      # To search by checkpoint, use the following parameters:
      # <ul>
      # <li><code>from</code>: Optional id from which to start selection.</li>
      # <li><code>take</code>: The total amount of entries to retrieve when using the from parameter. Defaults to
      # 50.</li>
      # </ul>
      #
      # <b>Note</b>: The first time you call this endpoint using checkpoint pagination, omit the <code>from</code>
      # parameter. If there are more results, a <code>next</code> value is included in the response. You can use this
      # for subsequent API calls. When <code>next</code> is no longer included in the response, no pages are remaining.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :from
      # @option params [Integer, nil] :take
      # @option params [Auth0::Types::ConnectionStrategyEnum, nil] :strategy
      # @option params [String, nil] :name
      # @option params [String, nil] :fields
      # @option params [Boolean, nil] :include_fields
      #
      # @example
      #   client.connections.list(
      #     from: "from",
      #     take: 1,
      #     strategy: ["ad"],
      #     name: "name",
      #     fields: "fields",
      #     include_fields: true
      #   )
      #
      # @return [Auth0::Types::ListConnectionsCheckpointPaginatedResponseContent]
      def list(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["from"] = params[:from] if params.key?(:from)
        query_params["take"] = params.fetch(:take, 50)
        query_params["strategy"] = params[:strategy] if params.key?(:strategy)
        query_params["name"] = params[:name] if params.key?(:name)
        query_params["fields"] = params[:fields] if params.key?(:fields)
        query_params["include_fields"] = params.fetch(:include_fields, true)

        Auth0::Internal::CursorItemIterator.new(
          cursor_field: :next_,
          item_field: :connections,
          initial_cursor: query_params["from"]
        ) do |next_cursor|
          query_params["from"] = next_cursor
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "connections",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            parsed_response = Auth0::Types::ListConnectionsCheckpointPaginatedResponseContent.load(response.body)
            [parsed_response, response]
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Creates a new connection according to the JSON object received in <code>body</code>.<br/>
      #
      # @param request_options [Hash]
      # @param params [Auth0::Types::CreateConnectionRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.connections.create
      #
      # @return [Auth0::Types::ConnectionResponseContent]
      def create(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "connections",
          body: Auth0::Types::CreateConnectionRequestContent.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::ConnectionResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve details for a specified <a href="https://auth0.com/docs/authenticate/identity-providers">connection</a>
      # along with options that can be used for identity provider configuration.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String, nil] :fields
      # @option params [Boolean, nil] :include_fields
      #
      # @example
      #   client.connections.get(
      #     id: "id",
      #     fields: "fields",
      #     include_fields: true
      #   )
      #
      # @return [Auth0::Types::ConnectionResponseContent]
      def get(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["fields"] = params[:fields] if params.key?(:fields)
        query_params["include_fields"] = params.fetch(:include_fields, true)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "connections/#{URI.encode_uri_component(params[:id].to_s)}",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::ConnectionResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Removes a specific <a href="https://auth0.com/docs/authenticate/identity-providers">connection</a> from your
      # tenant. This action cannot be undone. Once removed, users can no longer use this connection to authenticate.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.connections.delete(id: "id")
      #
      # @return [untyped]
      def delete(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "connections/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Update details for a specific <a href="https://auth0.com/docs/authenticate/identity-providers">connection</a>,
      # including option properties for identity provider configuration.
      #
      # <b>Note</b>: If you use the <code>options</code> parameter, the entire <code>options</code> object is overriden.
      # To avoid partial data or other issues, ensure all parameters are present when using this option.
      #
      # @param request_options [Hash]
      # @param params [Auth0::Types::UpdateConnectionRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.connections.update(
      #     id: "id",
      #     request: {}
      #   )
      #
      # @return [Auth0::Types::ConnectionResponseContent]
      def update(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "connections/#{URI.encode_uri_component(params[:id].to_s)}",
          body: Auth0::Types::UpdateConnectionRequestContent.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::ConnectionResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves the status of an ad/ldap connection referenced by its <code>ID</code>. <code>200 OK</code> http status
      # code response is returned  when the connection is online, otherwise a <code>404</code> status code is returned
      # along with an error message
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @example
      #   client.connections.check_status(id: "id")
      #
      # @return [untyped]
      def check_status(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "connections/#{URI.encode_uri_component(params[:id].to_s)}/status",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # @return [Auth0::DirectoryProvisioning::Client]
      def directory_provisioning
        @directory_provisioning ||= Auth0::Connections::DirectoryProvisioning::Client.new(client: @client)
      end

      # @return [Auth0::SCIMConfiguration::Client]
      def scim_configuration
        @scim_configuration ||= Auth0::Connections::SCIMConfiguration::Client.new(client: @client)
      end

      # @return [Auth0::Clients::Client]
      def clients
        @clients ||= Auth0::Connections::Clients::Client.new(client: @client)
      end

      # @return [Auth0::Keys::Client]
      def keys
        @keys ||= Auth0::Connections::Keys::Client.new(client: @client)
      end

      # @return [Auth0::Users::Client]
      def users
        @users ||= Auth0::Connections::Users::Client.new(client: @client)
      end
    end
  end
end
