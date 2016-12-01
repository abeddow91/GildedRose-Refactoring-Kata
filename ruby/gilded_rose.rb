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
    @regular_items.push(item)
  end
end


def update_regular_items_quality
  @regular_items.each do |item|

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
