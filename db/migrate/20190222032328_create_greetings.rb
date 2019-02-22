class CreateGreetings < ActiveRecord::Migration[5.2]
  def change
    create_table :greetings do |t|
      t.string :sender
      t.string :message
      t.references :user, foreign_key: true
      t.references :design, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
