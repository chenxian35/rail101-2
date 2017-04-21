class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :group_id
      t.string :integer
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
