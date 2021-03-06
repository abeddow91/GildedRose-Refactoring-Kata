require_relative 'item'
class GildedRose

attr_reader :items

  def initialize(items)
    @items = items
    @regular_items = []
    @backstage_items = []
    @aged_items = []
    @legendary_items = []
    @conjured_items = []

  end

def organize_items_by_status(items)
  @items.each do |item|
    @legendary_items.push(item) if item.name == "Sulfuras, Hand of Ragnaros"
    @backstage_items.push(item) if item.name == "Backstage passes to a TAFKAL80ETC concert"
    @aged_items.push(item) if item.name == "Aged Brie"
    @conjured_items.push(item) if item.name == "Conjured Mana Cake"
    @regular_items.push(item) if item.name == '+5 Dexterity Vest'
  end
end


def deduct_day(item, number_of_days)
  item.sell_in -= number_of_days
end

def deduct_quality(item, amount_to_deduct)
  item.quality -= amount_to_deduct
end

def add_quality(item, amount_to_add)
  item.quality += amount_to_add
end

def update_regular_items
  @regular_items.each do |item|
    deduct_day(item, 1)
    deduct_quality(item, 1) if item.quality > 0 && item.sell_in > 0
    deduct_quality(item, 2) if (item.quality-2) >= 0 && item.sell_in <= 0
  end
end

def update_aged_items
  @aged_items.each do |item|
    deduct_day(item, 1)
    add_quality(item, 1) if item.quality < 50
    add_quality(item, 1) if (item.quality+1) <= 50 && item.sell_in <= 0
  end
end

def update_backstage_passes
  @backstage_items.each do |item|
    deduct_day(item, 1)
    add_quality(item, 1) if item.quality < 50
    add_quality(item, 1) if (item.quality+1) <= 50 && item.sell_in.between?(6, 10)
    add_quality(item, 2) if (item.quality+2) <= 50 && item.sell_in.between?(1, 5)
    deduct_quality(item, item.quality) if item.quality <= 50 && item.sell_in < 0
  end
end

  def update_quality()
    @items.each do |item|
      #if it's not a backstage item
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
          #and the quality is above 0
        if item.quality > 0
            #and it's not a legendary item
          if item.name != "Sulfuras, Hand of Ragnaros"
            #then deduct 1 from the quality
            item.quality = item.quality - 1
          end
        end
      else
        #if item quality is less 50
        if item.quality < 50
          #then add 1 to the quality each day
          item.quality = item.quality + 1
            #and if the item is a backstage item
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            #and the item has less than 11 day to be sold
            if item.sell_in < 11
              #and the quality is less than 50
              if item.quality < 50
                #then add another 1 to quality
                item.quality = item.quality + 1
              end
            end
            #if backstage passes have less than 6 days  to be sold
            if item.sell_in < 6
              #and the quality is less than 50
              if item.quality < 50
                #then add another 1 to quality
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      #if the item is not legendary
      if item.name != "Sulfuras, Hand of Ragnaros"
        #deduct 1 from sell_in days
        item.sell_in = item.sell_in - 1
      end
      #if the item has less than 0 days to sell in
      if item.sell_in < 0
        #and is not aged brie
        if item.name != "Aged Brie"
          #and is not backstage pass
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            #and the quality is greater than 0
            if item.quality > 0
              #and it's not legendary
              if item.name != "Sulfuras, Hand of Ragnaros"
                #the deduct quality by another 1
                item.quality = item.quality - 1
              end
            end
          else
            #if Backstage hits zero runs out of days zero drop quality to zero
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
