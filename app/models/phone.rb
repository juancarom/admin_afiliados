class Phone < ApplicationRecord
  belongs_to :person
  belongs_to :phone_type
end
