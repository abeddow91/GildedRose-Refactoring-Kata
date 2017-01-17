describe("Gilded Rose", function(){
  describe("Regular Items", function(){
    beforeEach(function(){
      items = [ new Item("Soup", 20, 20) ];
    });
  //example test
   it("should check the name of a regular item", function() {
      update_quality();
      expect(items[0].name).toEqual("Soup");
    });

    it("should reduce the quality of a regular item by one", function() {
      items = [ new Item("foo", 0, 0) ];
      update_quality();
      expect(items[0].name).toEqual("foo");
    });   
  });
});
