class MoonModal {
  String? firstName;
  int? age;
  int? id;
  String? message;

  MoonModal({this.firstName, this.age, this.id});

  MoonModal.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    age = json['age'];
    id = json['id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    return {"firstName": firstName, "age": age, "message": message};
  }
}
