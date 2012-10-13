#!/usr/bin/env ruby
# This command will automatically be run when you run "rails" with Rails 3 gems installed from the root of your application.

#APP_PATH = File.expand_path('../../config/application',  __FILE__)
require File.expand_path('../../config/boot',  __FILE__)
require 'rails/commands'
require 'date'
require 'benchmark'

Benchmark.bm do |x|
  x.report('OneItemMoveTwoItemsNoPartition') do
    t = NoPartItem.where(deleted_at: nil).first
    t.update_attributes!(deleted_at: '2012-03-01 00:00:00')
  end
  x.report('OneItemMoveTwoItemsPartition') do
    t = PartTwoItem.where(is_deleted: false).first
    t.update_attributes!(is_deleted: true)
  end
  x.report('DeleteOneNoPartition') do
    t = NoPartItem.where(deleted_at: nil).first
    t.destroy
  end
  x.report('DeleteOneTwoItemsPartition') do
    t = PartTwoItem.where(is_deleted: false).first
    t.destroy
  end
  x.report('DeleteOnRange') do
    # Delete Test
    # Delete an range
    NoPartItem.delete_all(deleted_at: nil)
  end
  x.report('TwoItemsMovePartition') do
    # MovePartitionTest
    # Update
    PartTwoItem.update_all('is_deleted =  true', 'is_deleted = false')
  end
  x.report('TwoItemsOnPartition') do
    # MovePartitionTest
    # Update
    PartTwoItem.update_all('is_deleted =  true', 'is_deleted = true')
  end
end

PartTwoItem.delete_all
NoPartItem.delete_all
PartRangeItem.delete_all

