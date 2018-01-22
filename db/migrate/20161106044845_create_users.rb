class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :college
      t.integer :Contact_number
      t.timestamps null: false
    end
  end
end
