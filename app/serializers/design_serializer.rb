class DesignSerializer < ActiveModel::Serializer
  attributes :id, :title, :image
  belongs_to :event
  belongs_to :user

  def event
    {category: self.object.event.category}
  end

  def user
    {
      id: self.object.user.id,
      first_name: self.object.user.first_name,
      last_name: self.object.user.last_name
    }
  end
end
