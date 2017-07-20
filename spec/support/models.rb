require 'active_record'

ActiveRecord::Schema.define(verion: 0) do
  create_table :customers, force: true do |t|
    t.string :name
    t.integer :height
    t.date :age
  end
end

ActiveRecord::Type.register(:compatible_with_string, ActiverecordEasyType::String)
ActiveRecord::Type.register(:compatible_with_integer, ActiverecordEasyType::Integer)
ActiveRecord::Type.register(:compatible_with_date, ActiverecordEasyType::Date)

class Customer < ActiveRecord::Base
  attribute :name, :compatible_with_string, class_name: :PersonName
  attribute :height, :compatible_with_integer, class_name: :Height
  attribute :age, :compatible_with_date, class_name: :Age

  validates :name, presence: true, on: :name
  validates :height, presence: true, on: :height
  validates :age, presence: true, on: :age
end
