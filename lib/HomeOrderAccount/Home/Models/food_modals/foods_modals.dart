class FoodModel {
  static const CATEGORY = 'category';
  static const COUNT = 'count';
  static const DISTCOUNTPRICE = 'discountprice';
  static const FEATURED = 'featured';
  static const ISDELIVERABLE = 'isdeliverable';
  static const NAME = 'name';
  static const ONDISCOUNT = 'ondiscount';
  static const PHOTOURL = 'photo_url';
  static const PRICE = 'price';
  static const UNIT = 'unit';
  static const WEIGHT = 'weight';
  static const RESTAURANTID = 'restaurantName';

  var category;
  var count;
  var discountprice;
  var featured;
  var isdeliverable;
  var name;
  var ondiscount;
  var photourl;
  var docID;
  var restaurantId;
  var price;
  var unit;
  var weight;
  FoodModel(
      {this.category,
        this.count,
        this.discountprice,
        this.featured,
        this.isdeliverable,
        this.name,
        this.ondiscount,
        this.photourl,
        this.price,
        this.unit,
        this.docID,
        this.restaurantId,
        this.weight});
  FoodModel.fromMap(Map<String, dynamic> data,String documentid) {
    category = data[CATEGORY];
    count = data[COUNT];
    discountprice = data[DISTCOUNTPRICE];
    featured = data[FEATURED];
    isdeliverable = data[ISDELIVERABLE];
    name = data[NAME];
    ondiscount = data[ONDISCOUNT];
    photourl = data[PHOTOURL];
    price = data[PRICE];
    unit = data[UNIT];
    weight = data[WEIGHT];
    restaurantId = data[RESTAURANTID];
    docID = documentid;
  }

  Map<String, dynamic> toJson() => {
    CATEGORY: category,
    COUNT: count,
    DISTCOUNTPRICE: discountprice,
    FEATURED: featured,
    ISDELIVERABLE: isdeliverable,
    NAME: name,
    ONDISCOUNT: ondiscount,
    PHOTOURL: photourl,
    PRICE: price,
    UNIT: unit,
    WEIGHT: weight,
  };
}