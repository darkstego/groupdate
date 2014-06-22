require "active_support/time"
require "groupdate/version"

module Groupdate
  FIELDS = [:second, :minute, :hour, :day, :week, :month, :year, :day_of_week, :hour_of_day]
  METHODS = FIELDS.map{|v| :"group_by_#{v}" }

  mattr_accessor :week_start, :day_start, :time_zone
  self.week_start = :sun
  self.day_start = 0
end

require "groupdate/magic"
begin
  require "active_record"
rescue LoadError
  # do nothing
end
require "groupdate/active_record" if defined?(ActiveRecord)
require "groupdate/enumerable"
