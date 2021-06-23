import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class Utils {
  static Map<String, dynamic> toMap(Object? data) {
    if (data is Map<String, dynamic>) {
      Map<String, dynamic> newMap = data;
      return newMap;
    } else {
      return Map();
    }
  }

  static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<T>>
      transformer<T>(T Function(Map<String, dynamic> json) fromJson) {
    return StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
        List<T>>.fromHandlers(
      handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
        final List<Map<String, dynamic>> snaps =
            data.docs.map((doc) => toMap(doc.data())).toList();
        final objects = snaps.map((json) => fromJson(json)).toList();

        sink.add(objects);
      },
    );
  }
}
