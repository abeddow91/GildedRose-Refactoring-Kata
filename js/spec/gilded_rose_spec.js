describe("Gilded Rose", function(){

  beforeEach(function(){
    items = [ new Item("Beer", 10, 20)];
  });

  it("should check the name of any item", function() {
    update_quality();
    expect(items[0].name).toEqual("Beer");
  });

  describe("Regular Items", function(){

    beforeEach(function(){
      items = [ new Item("Soup", 10, 20), new Item("Bread", 10, 0), new Item("Milk", 0, 10) ];
    });
    it("should reduce the sell_in of a regular item by one", function() {
      update_quality();
      expect(items[0].sell_in).toEqual(9);
    });
    it("should reduce the quality of a regular item by one", function() {
      update_quality();
      expect(items[0].quality).toEqual(19);
    });
    it("should not let the quality of a regular item be negative", function(){
      update_quality();
      expect(items[1].quality).toEqual(0);
    });
    it("should reduce the quality of an item twice as fast once sell_in reaches zero", function(){
      update_quality();
      expect(items[2].quality).toEqual(8);
    });
  });

  describe("Aged Brie", function(){

    beforeEach(function(){
      items = [ new Item("Aged Brie", 10, 20), new Item("Aged Brie", 10, 50), new Item("Aged Brie", 0, 10) ];
    });
    it("should reduce the sell_in of Aged Brie by one", function() {
      update_quality();
      expect(items[0].sell_in).toEqual(9);
    });
    it("should increase the quality of Aged Brie by one", function() {
      update_quality();
      expect(items[0].quality).toEqual(21);
    });
    it("should not let the quality of Aged Brie exceed 50", function(){
      update_quality();
      expect(items[1].quality).toEqual(50);
    });
    it("should increase the quality of an item twice as fast once sell_in reaches zero", function(){
      update_quality();
      expect(items[2].quality).toEqual(12);
    });
  });
});
