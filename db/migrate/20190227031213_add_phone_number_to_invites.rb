class AddPhoneNumberToInvites < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :phone_number, :string
  end
end
