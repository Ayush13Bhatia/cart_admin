import 'package:flutter/cupertino.dart';

class DashboardProvider with ChangeNotifier {
  bool _isDrawerExpanded = true;

  bool get drawerExpanded => _isDrawerExpanded;

  void toggleExpansion({bool? value}) {
    _isDrawerExpanded = value ?? !_isDrawerExpanded;
    notifyListeners();
  }
}
