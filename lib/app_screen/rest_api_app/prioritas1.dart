// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

// Membuat class Contact untuk mapping JSON
class Contact {
  int? id;
  String? name;
  String? phone;

  Contact({this.id, this.name, this.phone});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}

Dio dio = Dio();
void main() async {
  postReq();
  jsonTo();
  putReq();
}

Future<void> postReq() async {
  try {
    Response response = await dio.post(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts', 
      data: {
        'name': 'John Doe',
        'phone': '0823563243',
      },
    );
    print(response.data);
  } catch (e) {
    print(e);
  }
}

Future<void> jsonTo() async {
  try {
    Response response = await dio.get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2');
    Contact contact = Contact.fromJson(response.data);
    print('ID: ${contact.id}, Name: ${contact.name}, Phone: ${contact.phone}');
  } catch (e) {
    print(e);
  }
}

Future<void> putReq() async {
  try {
    Response response = await dio.put(
      'https://jsonplaceholder.typicode.com/posts/1',
      data: {
        'id': 1,
        'title': 'foo',
        'body': 'bar',
        'userId': 1,
      },
    );
    print(response.data);
  } catch (e) {
    print(e);
  }
}
