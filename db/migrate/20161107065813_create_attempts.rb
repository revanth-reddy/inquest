class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
    	t.text :attempt
      t.references :user, foreign_key: true
      t.references :level, foreign_key: true
      t.timestamps null: false
    end
  end
end
