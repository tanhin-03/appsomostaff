class Customer {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? roomID;
  DateTime? dateIn;
  DateTime? dateOut;

  Customer({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.roomID,
    this.dateIn,
    this.dateOut
  });

  Customer.fromJson(Map<String, dynamic> json)
      : this.firstName = json['firstName'],
        this.lastName = json['lastName'],
        this.email = json['email'],
        this.phone = json['phone'],
        this.roomID = json['roomID'],
        this.dateIn = DateTime.parse(json['dateIn']),
        this.dateOut = DateTime.parse(json['dateOut']);


}

class CustomerList {
  List<Customer>? customers;

  CustomerList({this.customers});

  CustomerList.fromJson(Map<String, dynamic> json)
      : this.customers = json['customers'] != null
      ? (json['customers'] as List)
      .map((customerJson) => Customer.fromJson(customerJson))
      .toList()
      : null;
}



