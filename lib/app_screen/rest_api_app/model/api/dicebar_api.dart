import 'package:dio/dio.dart';

final Dio dio = Dio();

Future<String> fetchImage(String name) async {
  try {
    final Response response =
        await dio.get('https://api.dicebear.com/7.x/initials/svg?seed=$name');
    return response.data;
  } catch (e) {
    rethrow;
  }
}