class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.string :name
      t.string :host
      t.date :date
      t.time :time
      t.integer :phone_number
      t.string :location
      t.string :address
      t.string :message
      t.references :user, foreign_key: true
      t.references :design, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
