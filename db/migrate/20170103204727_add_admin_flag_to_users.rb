class AddAdminFlagToUsers < ActiveRecord::Migration[5.0]
  # make sure it defaults to false and that it can’t be nil, just to..
  #..ensure it won’t give us incorrect return values when we check for the flag
  def change
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
