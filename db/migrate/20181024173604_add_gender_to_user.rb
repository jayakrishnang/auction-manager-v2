class AddGenderToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :integer, limit: 1
  end
end
