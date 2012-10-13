#!/usr/bin/env ruby
# This command will automatically be run when you run "rails" with Rails 3 gems installed from the root of your application.

#APP_PATH = File.expand_path('../../config/application',  __FILE__)
require File.expand_path('../../config/boot',  __FILE__)
require 'rails/commands'
require 'date'

def rand_date(d_from,d_to)
  from = Date.parse(d_from)
  to = Date.parse(d_to)
  days = to - from + 1
  return from + rand(days)
end

def my_suffle(ary)
  return ary[rand(ary.length)]
end

DATA_RANGE = (0..100000)
DUMMY_USER = (0..10).to_a
DUMMY_ITEM = (1..50).to_a

# WTF I has bugs created data was only deleted.
#=======================
t = []
DATA_RANGE.each do |d|
if my_suffle([true, false])
  deleted_at = rand_date('2012-01-01', '2012-12-31')
else 
  deleted_at = nil
end
  t << NoPartItem.new(user_id: my_suffle(DUMMY_USER), item_id: my_suffle(DUMMY_ITEM), deleted_at: deleted_at)
end
NoPartItem.import t

#=======================
t = []
DATA_RANGE.each do |d|
if my_suffle([true, false])
  deleted_at = rand_date('2012-01-01', '2012-12-31') 
else 
  deleted_at = nil
end
  t << PartRangeItem.new(user_id: my_suffle(DUMMY_USER), item_id: my_suffle(DUMMY_ITEM), deleted_at: deleted_at)
end
PartRangeItem.import t

#=======================
t = []
DATA_RANGE.each do |d|
  t << PartTwoItem.new(user_id: my_suffle(DUMMY_USER), item_id: my_suffle(DUMMY_ITEM), is_deleted: my_suffle([true, false]))
end
PartTwoItem.import t

#=======================
#
#Bench Mark

