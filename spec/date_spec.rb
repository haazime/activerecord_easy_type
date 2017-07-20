require 'spec_helper'

RSpec.describe Customer do
  describe 'Date <=> CustomType' do
    let(:age) { Age.from_birth(Date.new(2001, 1, 23)) }

    it 'should return custom type object' do
      obj = Customer.new(age: age)
      expect(obj.age).to eq(age)
    end

    it 'should return custom type object from DB' do
      Customer.create!(age: age)
      db = Customer.last
      expect(db.age).to eq(age)
    end

    it 'should find by custom type attribute' do
      Customer.create!(age: age)
      expect(Customer.where(age: age)).to_not be_nil
    end

    it 'should NOT find by custom type attribute' do
      other_age = Age.from_birth(Date.new(1993, 7, 11))
      Customer.create!(age: other_age)
      expect(Customer.where(age: age)).to be_empty
    end

    it 'should validate custom type attribute' do
      aggregate_failures do
        obj = Customer.new
        expect(obj.valid?(:age)).to be_falsey

        obj.age = age
        expect(obj.valid?(:age)).to be_truthy
      end
    end
  end
end
