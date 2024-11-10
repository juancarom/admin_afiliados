class CreateFamilyMemberTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :family_member_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
