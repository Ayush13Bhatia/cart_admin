import 'package:flutter/cupertino.dart';

class DashboardProvider with ChangeNotifier {
  bool _isDrawerExpanded = true;

  int _activeDrawer = 1;
  int _activeHoverDrawer = 0;

  bool get drawerExpanded => _isDrawerExpanded;

  int get activeDrawerIndex => _activeDrawer;
  int get activeHoverDrawer => _activeHoverDrawer;

  void toggleExpansion({bool? value}) {
    _isDrawerExpanded = value ?? !_isDrawerExpanded;
    notifyListeners();
  }

  void setActiveDrawer(value) {
    _activeDrawer = value;
    notifyListeners();
  }

  void setActiveHoverDrawer(value) {
    _activeHoverDrawer = value;
    notifyListeners();
  }
}
