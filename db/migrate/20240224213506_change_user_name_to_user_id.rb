class ChangeUserNameToUserId < ActiveRecord::Migration[7.1]
  def change
    add_column :encounters, :user_id, :integer
    remove_column :encounters, :user_name
  end
end
