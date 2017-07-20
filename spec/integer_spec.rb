require 'spec_helper'

RSpec.describe Customer do
  describe 'Integer <=> CustomType' do
    let(:height) { Height.new(183) }

    it 'should return custom type object' do
      obj = Customer.new(height: height)
      expect(obj.height).to eq(height)
    end

    it 'should return custom type object from DB' do
      Customer.create!(height: height)
      db = Customer.last
      expect(db.height).to eq(height)
    end

    it 'should find by custom type attribute' do
      Customer.create!(height: height)
      expect(Customer.where(height: height)).to_not be_nil
    end

    it 'should NOT find by custom type attribute' do
      other_height = Height.new(190)
      Customer.create!(height: other_height)
      expect(Customer.where(height: height)).to be_empty
    end

    it 'should validate custom type attribute' do
      aggregate_failures do
        obj = Customer.new
        expect(obj.valid?(:height)).to be_falsey

        obj.height = height
        expect(obj.valid?(:height)).to be_truthy
      end
    end
  end
end
