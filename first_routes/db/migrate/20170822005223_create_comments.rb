class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id
      t.integer :artwork_id
      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :artwork_id
  end
end
