require 'active_record'

ActiveRecord::Type.register(:custom_type, ActiverecordEasyType::String)

class Customer < ActiveRecord::Base
  attribute :name, :custom_type, class_name: :PersonName

  validates :name, presence: true, on: :name
end
