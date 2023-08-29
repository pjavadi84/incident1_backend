module Types
  class IncidentType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :link, String, null: true
    field :description, String, null: true
    field :pubDate, String, null: true
  end
end