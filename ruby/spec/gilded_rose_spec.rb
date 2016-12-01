require './gilded_rose'
require './item'

describe GildedRose do
  before(:each) do
    @item_1 = Item.new('+5 Dexterity Vest', 10, 20)
    @item_2 = Item.new('Aged Brie', 2,0)
    @item_3 = Item.new('Sulfuras, Hand of Ragnaros', 0, 80)
    @item_4 = Item.new('Sulfuras, Hand of Ragnaros', 1, 80)
    @item_5 = Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)
    @item_6 = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49)
    @item_7 = Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49)
    @item_8 = Item.new('Conjured Mana Cake', 3, 6)
    @item_9 = Item.new('+5 Dexterity Vest', 10, 0)
    @item_10 = Item.new('Aged Brie', 2, 50)
    @item_array = [@item_1, @item_2, @item_3, @item_4, @item_5, @item_6, @item_7, @item_8, @item_9, @item_10]
    @gilded_rose = GildedRose.new(@item_array)
  end

  context 'initilizing the class' do
    it 'store items in the tavern on initialize' do
      expect(@gilded_rose.items).to eq([@item_1, @item_2, @item_3, @item_4, @item_5, @item_6, @item_7, @item_8, @item_9, @item_10])
    end
  end

  context 'updating the quality'do
    before(:each) do
        @gilded_rose.update_quality
    end
    it 'it deducts one quality each day for a regular item'do
      change{@item_1.quality}.from(20).to(19)
    end
    it 'won\'t deduct quality of a regular item if quality is below 0' do
      expect(@item_9.quality).to eq(0)
    end
    it 'won\'t increase the quality of an aged brie if it is already at 50' do
      expect(@item_10.quality).to eq(50)
    end
  end
end
