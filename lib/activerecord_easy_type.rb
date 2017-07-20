require 'activerecord_easy_type/version'
require 'activerecord_easy_type/base'

module ActiverecordEasyType
  autoload :String, 'activerecord_easy_type/string'
  autoload :Integer, 'activerecord_easy_type/integer'
  autoload :Date, 'activerecord_easy_type/date'
end
