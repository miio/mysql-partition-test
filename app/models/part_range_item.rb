class PartRangeItem < ActiveRecord::Base
  attr_accessible :user_id, :item_id, :deleted_at
  self.primary_key = :id
  #  self.primary_keys = :id, :deleted_at
end
