function Item(name, sell_in, quality) {
  this.name = name;
  this.sell_in = sell_in;
  this.quality = quality;
}

var items = [];

function update_quality() {
  for (var i = 0; i < items.length; i++) {
    //if not aged brie or backstage
    if (items[i].name != 'Aged Brie' && items[i].name != 'Backstage passes to a TAFKAL80ETC concert') {
      //and the quality is greater than 0
      if (items[i].quality > 0) {
        //and not sulfuras
        if (items[i].name != 'Sulfuras, Hand of Ragnaros') {
          //item quality should reduce by 1
          items[i].quality = items[i].quality - 1;
        }
      }
    } else {
      // else if item's quality is less than 50
      if (items[i].quality < 50) {
        // quality increases by 1
        items[i].quality = items[i].quality + 1;
        //and if the item is back stage
        if (items[i].name == 'Backstage passes to a TAFKAL80ETC concert') {
          // and there is less than 11 days to sell
          if (items[i].sell_in < 11) {
            //and the quality is less than 50
            if (items[i].quality < 50) {
              // the quality increases by 1
              items[i].quality = items[i].quality + 1;
            }
          }
          if (items[i].sell_in < 6) {
            if (items[i].quality < 50) {
              items[i].quality = items[i].quality + 1;
            }
          }
        }
      }
    }
    if (items[i].name != 'Sulfuras, Hand of Ragnaros') {
      items[i].sell_in = items[i].sell_in - 1;
    }
    if (items[i].sell_in < 0) {
      if (items[i].name != 'Aged Brie') {
        if (items[i].name != 'Backstage passes to a TAFKAL80ETC concert') {
          if (items[i].quality > 0) {
            if (items[i].name != 'Sulfuras, Hand of Ragnaros') {
              items[i].quality = items[i].quality - 1;
            }
          }
        } else {
          items[i].quality = items[i].quality - items[i].quality;
        }
      } else {
        if (items[i].quality < 50) {
          items[i].quality = items[i].quality + 1;
        }
      }
    }
  }
}
