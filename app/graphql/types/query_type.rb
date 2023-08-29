module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # INCIDENTS: all incidents
    field :incidents, [Types::IncidentType], null: false

    # this is called a resolver method.
    def incidents
      # TWO APPROACH:

      # 1. Fetch all incidents from on demand:
      # - tradeoff: asks for more more http requests
      FetchIncidentsService.call
      Incident.all


      #  FOR SCALABILITY (if storage was less important):
      # 2. Fetch all incident periodically & through cache: 
      #  - tradeoff: takes storage on our side on some potential in data staleness
      #  - benefit: if data change infrequently, this option works better can be done 
      #    by settting background job like Sidekiq to fetch incidents
      #    periodically and update the database

  end
end
