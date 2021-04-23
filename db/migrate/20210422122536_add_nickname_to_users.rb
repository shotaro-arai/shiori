class AddNicknameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :nickname, unique: true
  end
end
