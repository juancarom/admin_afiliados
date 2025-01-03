class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.string :number
      t.references :person, null: false, foreign_key: true
      t.references :phone_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
