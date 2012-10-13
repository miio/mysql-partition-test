class PartTwoItem < ActiveRecord::Base
  attr_accessible :user_id, :item_id, :is_deleted
  self.primary_key = :id
#  self.primary_keys =  :id, :is_deleted
end
