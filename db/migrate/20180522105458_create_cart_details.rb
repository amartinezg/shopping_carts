class CreateCartDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_details do |t|
      t.integer :cart_id
      t.integer :item_id

      t.timestamps
    end

    add_index :cart_details, [:cart_id, :item_id]
  end
end
