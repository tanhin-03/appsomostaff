// class Customer {
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? phone;
//   String? roomID;
//   DateTime? dateIn;
//   DateTime? dateOut;
//
//   Customer({
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.phone,
//     this.roomID,
//     this.dateIn,
//     this.dateOut
//   });
//
//   Customer.fromJson(Map<String, dynamic> json)
//       : this.firstName = json['firstName'],
//         this.lastName = json['lastName'],
//         this.email = json['email'],
//         this.phone = json['phone'],
//         this.roomID = json['roomID'],
//         this.dateIn = DateTime.parse(json['dateIn']),
//         this.dateOut = DateTime.parse(json['dateOut']);
//
//
// }
//
// class CustomerList {
//   List<Customer>? customers;
//
//   CustomerList({this.customers});
//
//   CustomerList.fromJson(Map<String, dynamic> json)
//       : this.customers = json['customers'] != null
//       ? (json['customers'] as List)
//       .map((customerJson) => Customer.fromJson(customerJson))
//       .toList()
//       : null;
// }
//
//
//

class Customer {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String roomID;
  final DateTime dateIn;
  final DateTime dateOut;

  Customer(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.roomID,
      required this.dateIn,
      required this.dateOut});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      roomID: json['roomID'],
      dateIn: DateTime.parse(json['dateIn']),
      dateOut: DateTime.parse(json['dateOut']),
    );
  }
}
