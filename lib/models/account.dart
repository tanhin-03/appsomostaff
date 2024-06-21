class Account {
  String? username;
  String? password;
  String? role;

  Account({
    this.username="",
    this.password="",
    this.role=""
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      username: json['username'],
      password: json['password'],
      role: json['role'],
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['role'] = this.role;
    return data;
  }
}


// List<Account>? getUsersWithAdminRole() {
//   return users?.where((user) => user.role == 'admin').toList();
// }