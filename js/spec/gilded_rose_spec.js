describe("Gilded Rose", function(){

  it("should check the name of any item", function() {
    items = [ new Item("Beer", 10, 20)];
    update_quality();
    expect(items[0].name).toEqual("Beer");
  });

  describe("Regular Items", function(){

    beforeEach(function(){
      items = [ new Item("Soup", 10, 20), new Item("Bread", 10, 0), new Item("Milk", 0, 10) ];
      update_quality();
    });
    it("should reduce the sell_in of a regular item by one", function() {
      expect(items[0].sell_in).toEqual(9);
    });
    it("should reduce the quality of a regular item by one", function() {
      expect(items[0].quality).toEqual(19);
    });
    it("should not let the quality of a regular item be negative", function(){
      expect(items[1].quality).toEqual(0);
    });
    it("should reduce the quality of an item twice as fast once sell_in reaches zero", function(){
      expect(items[2].quality).toEqual(8);
    });
  });

  describe("Aged Brie", function(){

    beforeEach(function(){
      items = [ new Item("Aged Brie", 10, 20), new Item("Aged Brie", 10, 50), new Item("Aged Brie", 0, 10) ];
      update_quality();
    });
    it("should reduce the sell_in of Aged Brie by one", function() {
      expect(items[0].sell_in).toEqual(9);
    });
    it("should increase the quality of Aged Brie by one", function() {
      expect(items[0].quality).toEqual(21);
    });
    it("should not let the quality of Aged Brie exceed 50", function(){
      expect(items[1].quality).toEqual(50);
    });
    it("should increase the quality of an item twice as fast once sell_in reaches zero", function(){
      expect(items[2].quality).toEqual(12);
    });
  });

  describe("Sulfuras, Hand of Ragnaros", function(){

    beforeEach(function(){
      items = [ new Item("Sulfuras, Hand of Ragnaros", 10, 20), new Item("Sulfuras, Hand of Ragnaros", 10, 50), new Item("Sulfuras, Hand of Ragnaros", 0, 10) ];
      update_quality();
    });
    it("should keep the sell_in the same", function() {
      expect(items[0].sell_in).toEqual(10);
    });
    it("should keep the quality of Sulfuras the same", function() {
      expect(items[0].quality).toEqual(20);
    });
  });
  describe("Backstage passes to a TAFKAL80ETC concert", function(){

    beforeEach(function(){
      items = [ new Item("Backstage passes to a TAFKAL80ETC concert", 15, 20), new Item("Backstage passes to a TAFKAL80ETC concert", 10, 50), new Item("Backstage passes to a TAFKAL80ETC concert", 10, 10),new Item("Backstage passes to a TAFKAL80ETC concert", 5, 10),new Item("Backstage passes to a TAFKAL80ETC concert", -1, 23) ];
      update_quality();
    });
    it("should reduce the sell_in of Backstage passes by one", function() {
      expect(items[0].sell_in).toEqual(14);
    });
    it("should increase the quality by one", function(){
      expect(items[0].quality).toEqual(21);
    });
    it("should not let the quality exceed fifty", function(){
      expect(items[1].quality).toEqual(50);
    });
    it("should increase the quality by two when sell in is 10 or lower", function(){
      expect(items[2].quality).toEqual(12);
    });
    it("should increase the quality by three when sell_in is 5 or lower", function(){
      expect(items[3].quality).toEqual(13);
    });
    it("should reduce the quality to zero when sell_in is less than zero", function(){
      expect(items[4].quality).toEqual(0);
    });
    it("should not reduce the quality below zero", function(){
      update_quality();
      expect(items[4].quality).toEqual(0);
    });
  });
});
