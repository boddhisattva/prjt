class ProjectSerializer
  include JSONAPI::Serializer
  attributes :name, :owner_id, :status, :progress
end
