class InviteSerializer < ActiveModel::Serializer
  attributes :id, :name, :host, :date, :time, :phone_number, :location, :address, :message
  belongs_to :event
  belongs_to :user
  belongs_to :design

  def user
    {
      id: self.object.user.id,
      first_name: self.object.user.first_name,
      last_name: self.object.user.last_name
    }
  end

  def design
    {image: self.object.design.image}
  end

  def event
    {category: self.object.event.category}
  end

  
end
