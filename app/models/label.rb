class Label < ApplicationRecord
  before_save :set_uuid 
  def set_uuid
    self.uuid = SecureRandom.uuid
  end  
end