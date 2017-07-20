module ActiverecordEasyType
  class Integer < Base

    def serialize(obj)
      obj.to_i
    end

    def deserialize_value(value)
      custom_type_class.from_integer(value)
    end
  end
end
