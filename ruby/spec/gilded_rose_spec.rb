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
    @item_11 = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 30)
    @item_12 = Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 30)
    @item_array = [@item_1, @item_2, @item_3, @item_4, @item_5, @item_6, @item_7, @item_8, @item_9, @item_10, @item_11, @item_12]
    @gilded_rose = GildedRose.new(@item_array)
  end

  context 'initilizing the class' do
    it 'store items in the tavern on initialize' do
      expect(@gilded_rose.items).to eq([@item_1, @item_2, @item_3, @item_4, @item_5, @item_6, @item_7, @item_8, @item_9, @item_10, @item_11, @item_12])
    end
  end

  context 'updating the quality of items'do
    # before(:each) do
    #     @gilded_rose.update_quality
    # end
    context 'Regular items'do
      it 'the quality decreases by one each day'do
        expect{@gilded_rose.update_quality}.to change{@item_1.quality}.by(-1)
      end
      it 'won\'t deduct one from quality rating if rating is below 0' do
        expect{@gilded_rose.update_quality}.not_to change{@item_9.quality}
      end
      it 'deducts 1 day from sell_in count' do
        expect{@gilded_rose.update_quality}.to change{@item_1.sell_in}.by(-1)
      end
      it 'quality decreases by 2 each day if sell_in is 0' do
        10.times{@gilded_rose.update_quality}
        expect{@gilded_rose.update_quality}.to change{@item_1.quality}.by(-2)
      end
    end
    context 'Aged Brie' do
      it 'the quality increases by one each day' do
        expect{@gilded_rose.update_quality}.to change{@item_2.quality}.by(1)
      end
      it 'the quality cannot exceed 50' do
        expect{@gilded_rose.update_quality}.not_to change{@item_10.quality}
      end
      it 'deducts 1 day from sell_in count' do
        expect{@gilded_rose.update_quality}.to change{@item_2.sell_in}.by(-1)
      end
    end
    context 'Backstage Passes' do
      it 'the quality increases by one each day until it has 11 days shelf life' do
        expect{@gilded_rose.update_quality}.to change{@item_5.quality}.by(1)
      end
      it 'the quality increases by two each day once sell_in is less than 11' do
        expect{@gilded_rose.update_quality}.to change{@item_11.quality}.by(2)
      end
      it 'the quality increases by three each day once sell_in is less than 6' do
        expect{@gilded_rose.update_quality}.to change{@item_12.quality}.by(3)
      end
      it 'the quality cannot exceed 50' do
        expect{@gilded_rose.update_quality}.to change{@item_6.quality}.by(1)
      end
      it 'deducts 1 day from sell_in count' do
        expect{@gilded_rose.update_quality}.to change{@item_5.sell_in}.by(-1)
      end
    end
  end
end
