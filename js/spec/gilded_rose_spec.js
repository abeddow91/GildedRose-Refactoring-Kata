describe("Gilded Rose", function(){

  describe("Regular Items", function(){

    beforeEach(function(){
      items = [ new Item("Soup", 10, 20), new Item("Bread", 10, 0), new Item("Milk", 0, 10) ];
    });
    it("should check the name of a regular item", function() {
      update_quality();
      expect(items[0].name).toEqual("Soup");
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
    it("should reduce the quality of an item twice as fast one sell_in reaches zero", function(){
      update_quality();
      expect(items[2].quality).toEqual(8);
    });
  });

});
