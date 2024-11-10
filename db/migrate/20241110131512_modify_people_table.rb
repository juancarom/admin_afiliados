class ModifyPeopleTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :people, :first_name, :string
    remove_column :people, :last_name, :string
    add_column :people, :name, :string, after: :id
  end
end
