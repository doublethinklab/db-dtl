class Dtl < ApplicationRecord
  validates :url, uniqueness: true

  before_save :set_uuid 
  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
