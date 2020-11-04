class Day < ApplicationRecord
  validates :domain, uniqueness: true, presence: true
  validates :date, presence: true
  validates :num, presence: true
end
