class AddPasswordResetTokenToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :password_reset_token, :string
    add_index :users, :password_reset_token
    add_column :users, :password_reset_token_sent_at, :datetime
  end
end
