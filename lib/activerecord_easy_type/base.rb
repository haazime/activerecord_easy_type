require 'active_record'

module ActiverecordEasyType
  class Base < ActiveRecord::Type::Value

    def initialize(class_name:)
      @custom_type_class = class_name.to_s.constantize
    end

    def deserialize(value)
      return super unless value
      deserialize_value(value)
    end

    private
      attr_reader :custom_type_class
  end
end
