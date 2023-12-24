import 'dart:io';
import 'package:flutter/material.dart';
import 'package:suitmedia_assignment/data/model/userlist.dart';
import 'package:suitmedia_assignment/utils/result_state.dart';
import '../data/api/api_service.dart';
import 'package:http/http.dart' as http;

class UserListProvider extends ChangeNotifier {
  final ApiService apiService;

  UserListProvider({required this.apiService}) {
    fetchUser();
    refresh();
  }

  late ListUser _user;
  late ResultState _state;
  String _message = '';
  int _currentPage = 1;
  bool hasMore = true;

  String get message => _message;

  ListUser get result => _user;

  ResultState get state => _state;

  Future<dynamic> fetchUser() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      ListUser user = await apiService.listAPI(http.Client(), _currentPage);
      if (user.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Data is Empty';
      } else {
        if (_currentPage == user.totalPage) {
          hasMore = false;
        }
        _currentPage++;
        _state = ResultState.hasData;
        notifyListeners();
        return _user = user;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "No Internet Connection";
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }

  Future refresh() async {
    _currentPage = 1;
    hasMore = true;
    await fetchUser();
    notifyListeners();
  }
}
