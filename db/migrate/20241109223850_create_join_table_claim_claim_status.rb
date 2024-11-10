class CreateJoinTableClaimClaimStatus < ActiveRecord::Migration[7.0]
  def change
    create_join_table :claims, :claim_statuses do |t|
      # t.index [:claim_id, :claim_status_id]
      # t.index [:claim_status_id, :claim_id]
    end
  end
end
