class DropAhoyEventsTable < ActiveRecord::Migration
  def change
  	drop_table :ahoy_events
  	drop_table :visits
  end
end
