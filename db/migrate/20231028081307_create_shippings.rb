class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.string    :zip,   null: false
      t.integer :prefecture_id,   null: false
      t.string    :city,   null: false
      t.string :street,    null: false
      t.string    :building   
      t.string :phone,    null: false
      t.references    :purchase_record,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
