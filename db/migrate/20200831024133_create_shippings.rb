class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.integer    :prefecture,   null:false
      t.string     :postal_code,  null:false
      t.string     :city,         null:false
      t.string     :address,      null:false
      t.string     :building,     default: ""
      t.string     :phone_number, null:false
      t.references :order
      t.timestamps
    end
  end
end
