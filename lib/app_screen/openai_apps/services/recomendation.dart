import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/openai_apps/constants/open_ai.dart';
import 'package:flutter_test_alta1/app_screen/openai_apps/models/open_ai.dart';
import 'package:intl/intl.dart';

class RecomendationServices {
  static Future<GptData> getRecomendation(
      {required String budget,
      required String cameraSensorSize,
      required String storageSize}) async {
    late GptData gpt = GptData(
      warning: "",
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(
        promptTokens: 0,
        completionTokens: 0,
        totalTokens: 0,
      ),
    );

    final Dio dio = Dio();

    try {
      // var url = Uri.parse('https://api.openai.com/v1/completions');

      const url = 'https://api.openai.com/v1/completions';

      Map<String, String> header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'IDR',
        decimalDigits: 0,
      );

      String phoneBudget = formatCurrency.format(int.parse(budget));

      String promptData =
          'You are a smartphone expert. Please recomend me smartphones more than 1 if possible, i have a budget $phoneBudget, i want the camera sensor size $cameraSensorSize mega pixel and i want the storage size $storageSize gigabyte';
      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "temperature": 0.4,
        "max_tokens": 64,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0,
      });

      dio.options.headers['Authorization'] = "Bearer $apiKey";
      final response =
          await dio.post(url, options: Options(headers: header), data: data);
      if (response.statusCode == 200) {
        debugPrint('data : ${response.data.toString()}');
        gpt = gptDataFromJson(response.data);
      }
    } catch (e) {
      throw Exception('Error occured when sending request : ${e.toString()}');
    }

    return gpt;
  }
}
