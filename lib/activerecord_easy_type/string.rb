module ActiverecordEasyType
  class String < Base

    def serialize(obj)
      obj.to_s
    end

    def deserialize_value(value)
      custom_type_class.from_string(value)
    end
  end
end
