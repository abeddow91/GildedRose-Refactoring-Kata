require 'spec_helper'
require './item'
#

describe Item do

  let(:name) {stub 'name'}
  let(:sell_in) {stub 'sell_in'}
  let(:quality) {stub 'quality'}
  subject(:item) {described_class.new('name', 'sell_in', 'quality')}


  context 'Item class is initialised' do
    it 'has a name when initialised' do
      expect(item.name).to eq('name')
    end
    it 'has a sell in price when initialised' do
      expect(item.sell_in).to eq('sell_in')
    end
    it 'has a quality when initialised' do
      expect(item.quality).to eq('quality')
    end
  end
  context 'Item details can be displayed' do
    it 'prints all three details in a string' do
      expect(item.to_s).to eq("name, sell_in, quality")
    end
  end
end
