class RemovePhoneNumberFromInvites < ActiveRecord::Migration[5.2]
  def change
    remove_column :invites, :phone_number, :integer
  end
end
