class InviteSerializer < ActiveModel::Serializer
  attributes :id, :name, :host, :date, :time, :phone_number, key: :telephone, :location, :address, :message, :user, :design, :event

  def design
    {design_image: self.object.design.image}
  end

  def event
    {event_name: self.object.event.category}
  end

  
end
