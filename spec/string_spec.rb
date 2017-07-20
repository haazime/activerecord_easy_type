require 'spec_helper'

RSpec.describe Customer do
  describe 'String <=> CustomType' do
    let(:person_name) { PersonName.new('Hazime', 'Sueyoshi') }

    it 'should return custom type object' do
      obj = Customer.new(name: person_name)
      expect(obj.name).to eq(person_name)
    end

    it 'should return custom type object from DB' do
      Customer.create!(name: person_name)
      db = Customer.last
      expect(db.name).to eq(person_name)
    end

    it 'should find by custom type attribute' do
      Customer.create!(name: person_name)
      expect(Customer.where(name: person_name)).to_not be_nil
    end

    it 'should NOT find by custom type attribute' do
      other_person_name = PersonName.new('Other', 'Person')
      Customer.create!(name: other_person_name)
      expect(Customer.where(name: person_name)).to be_empty
    end

    it 'should validate custom type attribute' do
      aggregate_failures do
        obj = Customer.new
        expect(obj.valid?(:name)).to be_falsey

        obj.name = person_name
        expect(obj.valid?(:name)).to be_truthy
      end
    end
  end
end
