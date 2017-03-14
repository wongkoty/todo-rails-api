class List < ApplicationRecord
  has_many :todo, dependent: :destroy
end
