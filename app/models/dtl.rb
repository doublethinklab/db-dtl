class Dtl < ApplicationRecord
  validates :url, uniqueness: true, presence: true

  before_create :set_uuid
  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
