class ChangeIntegerToString < ActiveRecord::Migration
  def change
  	change_column :users, :Contact_number, :string
  end
end
