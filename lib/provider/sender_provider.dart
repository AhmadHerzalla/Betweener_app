import 'package:flutter/foundation.dart';
import 'package:tt9_betweener_challenge/controllers/active_sharing.dart';
import 'package:tt9_betweener_challenge/core/helper/api_respons.dart';
import 'package:tt9_betweener_challenge/models/sender.dart';

class SenderProvider extends ChangeNotifier {
  late ActiveCotroller _activeCotroller;
  late ApiResponse<Sender> _sender;
  SenderProvider() {
    _activeCotroller = ActiveCotroller();
    _fetchactiveSender();
  }

  void update() {
    _fetchactiveSender();
  }

  ApiResponse<Sender> get links => _sender;

  void _fetchactiveSender() async {
    _sender = ApiResponse.loading('Loading');
    notifyListeners();

    try {
      final response = await _activeCotroller.getsenderinfo();
      _sender = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      _sender = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
