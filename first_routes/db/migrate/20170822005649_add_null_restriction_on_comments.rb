class AddNullRestrictionOnComments < ActiveRecord::Migration[5.1]
  def change
    change_table :comments do |t|
      t.change :user_id, :integer, null: false
      t.change :artwork_id, :integer, null: false
    end
  end
end
