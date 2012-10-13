class NoPartItem < ActiveRecord::Base
  attr_accessible :user_id, :item_id, :deleted_at
end
