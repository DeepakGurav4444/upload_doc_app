import 'package:flutter/material.dart';
import 'package:upload_doc_app/closed_page.dart';
import 'package:upload_doc_app/live_page.dart';
import 'package:upload_doc_app/upcoming_page.dart';

class BottomNavModel extends ChangeNotifier {
  int _currentTab = 0;
  List<Widget> _pages = [ClosedPage(), LivePage(), UpComingPage()];

  set currentTab(int tab) {
    this._currentTab = tab;
    notifyListeners();
  }

  get currentTab => this._currentTab;
  get currentPage => this._pages[this._currentTab];
}
