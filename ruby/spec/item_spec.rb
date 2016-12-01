require 'spec_helper'
require './item'
# 
#
# before(:each) do
#   item = Item.new('Elixir of the Mongoose', 5, 7)
# end
# let(:name) {stub 'name'}
# let(:sell_in) {stub 'sell_in'}
# let(:quality) {stub 'quality'}
# subject(:item) {described_class.new('Elixir of the Mongoose', 5, 7)}

describe Item do
  context 'Item class is initialised' do
    item = Item.new('Elixir of the Mongoose', 5, 7)
    it 'has a name when initialised' do
      expect(item.name).to eq('Elixir of the Mongoose')
    end
    it 'has a sell in price when initialised' do
      expect(item.sell_in).to eq(5)
    end
    it 'has a quality when initialised' do
      expect(item.quality).to eq(7)
    end
  end
end
