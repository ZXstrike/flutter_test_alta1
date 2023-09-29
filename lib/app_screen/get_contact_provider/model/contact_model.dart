
class ContactModel {
  String name;
  String number;
  ContactModel({
    required this.name,
    required this.number,
  });

  void edit(
    String? name,
    String? number,
  ) {
    if (name != null) {
      this.name = name;
    }
    if (number != null) {
      this.number = number;
    }
  }
}
