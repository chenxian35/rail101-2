class CreateGroups < ActiveRecord::Migration[5.0]

  def change
      drop_table :groups
    create_table :groups do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
