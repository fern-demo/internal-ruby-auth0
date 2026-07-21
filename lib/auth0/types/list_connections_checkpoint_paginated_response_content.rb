# frozen_string_literal: true

module Auth0
  module Types
    # Checkpoint paginated list of connections
    class ListConnectionsCheckpointPaginatedResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"

      field :connections, -> { Internal::Types::Array[Auth0::Types::ConnectionResponseContent] }, optional: false, nullable: false
    end
  end
end
