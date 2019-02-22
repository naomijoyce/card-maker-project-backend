class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :birthday, :email, :invites, :designs
  
  def designs
    self.object.designs.map do |design|
      {
        title: design.title, 
        image: design.image, 
        event: design.event_id
      }
    end
  end

  def invites
    self.object.invites.map do |invite|
      {
        name: invite.name, 
        host: invite.host, 
        date: invite.date,
        time: invite.time, 
        telephone: invite.phone_number, 
        location: invite.location, 
        address: invite.address, 
        message: invite.message, 
        design: invite.design_id, 
        event: invite.event_id
      }
    end
  end

end
