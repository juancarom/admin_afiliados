class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :city
      t.string :state
      t.string :postal_code
      t.references :person, null: false, foreign_key: true
      t.references :address_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
