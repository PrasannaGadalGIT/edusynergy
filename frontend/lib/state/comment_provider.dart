import 'package:flutter/foundation.dart';

class CommentProvider with ChangeNotifier {
  String? _comment;

  String? get comment => _comment;


  void setComment(String comment) {
    _comment = comment;

    notifyListeners();
  }

  void clearComment() {
    _comment = null;
    notifyListeners();
  }
}
