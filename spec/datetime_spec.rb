require 'spec_helper'

RSpec.describe Customer do
  describe 'DateTime <=> CustomType' do
    let(:rank) { Rank.from_joined_at(DateTime.now) }

    it 'should return custom type object' do
      obj = Customer.new(rank: rank)
      expect(obj.rank).to eq(rank)
    end

    it 'should return custom type object from DB' do
      Customer.create!(rank: rank)
      db = Customer.last
      expect(db.rank).to eq(rank)
    end

    it 'should find by custom type attribute' do
      Customer.create!(rank: rank)
      expect(Customer.where(rank: rank)).to_not be_nil
    end

    it 'should NOT find by custom type attribute' do
      other_rank = Rank.from_joined_at(rank.to_datetime - 1)
      Customer.create!(rank: other_rank)
      expect(Customer.where(rank: rank)).to be_empty
    end

    it 'should validate custom type attribute' do
      aggregate_failures do
        obj = Customer.new
        expect(obj.valid?(:rank)).to be_falsey

        obj.rank = rank
        expect(obj.valid?(:rank)).to be_truthy
      end
    end
  end
end
