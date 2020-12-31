class Apiuser < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :mail, uniqueness: true, presence: true

  before_create :set_uuid
  def set_uuid
    self.token = SecureRandom.uuid
  end
end
