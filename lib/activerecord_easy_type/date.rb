require 'date'

module ActiverecordEasyType
  class Date < Base

    def serialize(obj)
      return super unless obj
      obj.to_date
    end

    def deserialize_value(value)
      date = ::Date.parse(value)
      custom_type_class.from_date(date)
    end
  end
end
