require 'date'

module ActiverecordEasyType
  class DateTime < Base

    def serialize(obj)
      return super unless obj
      obj.to_datetime
    end

    def deserialize_value(value)
      datetime = ::DateTime.parse(value)
      custom_type_class.from_datetime(datetime)
    end
  end
end
