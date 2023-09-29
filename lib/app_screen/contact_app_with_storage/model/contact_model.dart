class ContactModel {
  int? id;
  late String name;
  late String number;

  ContactModel({
    this.id,
    required this.name,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }

  ContactModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    number = map['number'];
  }
}
