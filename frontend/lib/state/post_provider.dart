import 'package:flutter/foundation.dart';

class PostProvider with ChangeNotifier {

  String? _postId;
  String? _content;

  String? get postId => _postId;
  String? get content => _content;

  void setPostData( String postId, String content) {
    _content = content;
    _postId = postId;
    notifyListeners();
  }

  void clearAuthData() {
    _postId = null;
    notifyListeners();
  }
}
