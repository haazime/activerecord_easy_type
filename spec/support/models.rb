require 'active_record'

ActiveRecord::Schema.define(verion: 0) do
  create_table :customers do |t|
    t.string :name
    t.integer :height
  end
end

ActiveRecord::Type.register(:compatible_with_string, ActiverecordEasyType::String)
ActiveRecord::Type.register(:compatible_with_integer, ActiverecordEasyType::Integer)

class Customer < ActiveRecord::Base
  attribute :name, :compatible_with_string, class_name: :PersonName
  attribute :height, :compatible_with_integer, class_name: :Height

  validates :name, presence: true, on: :name
  validates :height, presence: true, on: :height
end
