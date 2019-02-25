class RemovePwDigestFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :pw_digest, :string
  end
end
