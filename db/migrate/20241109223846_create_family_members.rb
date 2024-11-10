class CreateFamilyMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :family_members do |t|
      t.string :first_name
      t.string :last_name
      t.references :person, null: false, foreign_key: true
      t.references :family_member_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
