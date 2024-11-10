class CreateClaimStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :claim_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
