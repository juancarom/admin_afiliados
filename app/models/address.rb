class Address < ApplicationRecord
  belongs_to :person
  belongs_to :address_type
end
