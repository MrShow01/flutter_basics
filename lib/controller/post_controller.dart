import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/auto_model.dart';

class PostController extends ChangeNotifier {
  List<Comment> dataList = [];
  final dio = Dio();
  fetchApi() async {
    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //       onRequest: (options, handler) {
    //         options.headers['Content-Type'] = 'application/json';
    //         return handler.next(options);
    //       },
    //       onError: (error, handler) => handler.next(error),
    //       onResponse: (response, handler) => handler.next(response)),
    // );
    // dio.interceptors.add(
    //   PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: false,
    //     error: true,
    //     compact: true,
    //     maxWidth: 90,
    //   ),

    //   // InterceptorsWrapper(
    //   //   onResponse: (response, handler) {
    //   //     // Log the response data
    //   //     log('Response [${response.statusCode}]: ${response.data}');
    //   //     return handler.next(response);
    //   //   },
    //   //   onError: (DioError e, handler) {
    //   //     // Log the error
    //   //     log('Error: ${e.message}');
    //   //     return handler.next(e);
    //   //   },
    //   //   onRequest: (options, handler) {
    //   //     options.headers['Content-Type'] = 'application/json';
    //   //     // Add a custom header to the request
    //   //     //options.headers['Authorization'] = 'Bearer my_token';
    //   //     log('Request: ${options.method} ${options.path}');

    //   //     return handler.next(options);
    //   //   },
    //   // ),
    // );

    // final response =
    //     await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    // log(response.body.toString());
    // log(response.statusCode.toString());

    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      for (var item in response.data as List) {
        Comment data = Comment.fromJson((item));
        dataList.add(data);
      }
      log(dataList.length.toString());
    }
    notifyListeners();
  }

  addPost() async {
    final response = await dio.post(
      'https://jsonplaceholder.typicode.com/posts',
      data: {
        'title': 'foo',
        'body': 'bar',
        'userId': 1,
      },
      options: Options(
        headers: {'Content-type': 'application/json; charset=UTF-8'},
      ),
    );
    log(response.statusCode.toString());
    log(response.data.toString());

    notifyListeners();
  }

  updatePost() async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      body: jsonEncode({
        'id': 1,
        'title': 'foooooo',
        'body': 'barrr',
        'userId': 1,
      }),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );
    log(response.body.toString());
    log(response.statusCode.toString());
    notifyListeners();
  }

  patchPost() async {
    final response = await http.patch(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      body: jsonEncode({
        "userId": 10,
        'body': 'barrdsfdfr',
      }),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );
    log(response.body.toString());
    notifyListeners();
  }

  deletePost() async {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    );
    log(response.body.toString());
    notifyListeners();
  }
}
