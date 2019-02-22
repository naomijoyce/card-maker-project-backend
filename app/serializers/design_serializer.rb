class DesignSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :event, :artist

  def event
    {event_name: self.object.event.name}
  end

  def artist
    {artist_first_name: self.object.user.first_name,
     artist_last_name: self.object.user.last_name}
  end
end
