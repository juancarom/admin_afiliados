class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :document
      t.date :birth_date
      t.references :gender, null: false, foreign_key: true
      t.references :marital_status, null: false, foreign_key: true
      t.references :document_type, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
