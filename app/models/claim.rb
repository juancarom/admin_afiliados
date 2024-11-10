class Claim < ApplicationRecord
  belongs_to :person
  belongs_to :claim_type
end
