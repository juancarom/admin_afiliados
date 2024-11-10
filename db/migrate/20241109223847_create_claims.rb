class CreateClaims < ActiveRecord::Migration[7.0]
  def change
    create_table :claims do |t|
      t.text :description
      t.references :person, null: false, foreign_key: true
      t.references :claim_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
