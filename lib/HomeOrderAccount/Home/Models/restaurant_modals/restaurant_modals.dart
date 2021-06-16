class RestaurantModel {
  static const ADDRESS = 'address';
  static const CLOSED = 'closed';
  static const RANGE = 'deliveryrange';
  static const LATITUDE = 'latitude';
  static const PHOTOURL = 'photo_url';
  static const LONGITUDE = 'longitude';
  static const NAME = 'name';
  static const PHONE = 'phone';
  static const TAX = 'tax';
  static const USERNAME = 'username';

  static const restaurantID = 'restaurantID';
  static const restaurantPIN = 'restaurantPinCodes';

  // List<Product> productList = [];
  var address;
  var image;
  var closed;
  var range;
  var latitude;
  var longitude;
  var name;
  var phone;
  var tax;
  var username;
  var restaurantId;
  var restaurantPin;

  RestaurantModel(
      {this.address,
        this.closed,
        this.range,
        this.latitude,
        this.longitude,
        this.name,
        this.phone,
        this.tax,
        this.username,
        this.image,
        this.restaurantId,
        this.restaurantPin,
      });


  RestaurantModel.fromMap(Map<String, dynamic> data) {
    address = data[ADDRESS];
    closed = data[CLOSED];
    range = data[RANGE];
    latitude = data[LATITUDE];
    longitude = data[LONGITUDE];
    name = data[NAME];
    phone = data[PHONE];
    tax = data[TAX];
    username = data[USERNAME];
    image = data[PHOTOURL];
    restaurantId = data[restaurantID];
    restaurantPin = data[restaurantPIN];
  }
}