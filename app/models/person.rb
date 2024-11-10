class Person < ApplicationRecord
  belongs_to :gender
  belongs_to :marital_status
  belongs_to :document_type
  belongs_to :organization
end
