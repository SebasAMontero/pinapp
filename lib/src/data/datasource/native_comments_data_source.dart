import 'package:flutter/services.dart';

class NativeCommentsDataSource {
  static const platform = MethodChannel('com.pinapp.comments');

  Future<List<Map<String, dynamic>>> getComments(int postId) async {
    try {
      final result = await platform.invokeMethod('getComments', {
        'postId': postId,
      });

      final List<Map<String, dynamic>> comments = (result as List)
          .map((item) => Map<String, dynamic>.from(item as Map))
          .toList();

      return comments;
    } on PlatformException catch (e) {
      print('Error fetching comments: ${e.message}');
      return [];
    }
  }
}
