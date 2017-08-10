require 'active_record'
require_relative 'activerecord_easy_type/version'
require_relative 'activerecord_easy_type/base'

module ActiverecordEasyType
  autoload :String, 'activerecord_easy_type/string'
  autoload :Integer, 'activerecord_easy_type/integer'
  autoload :Date, 'activerecord_easy_type/date'
  autoload :DateTime, 'activerecord_easy_type/date_time'
end
