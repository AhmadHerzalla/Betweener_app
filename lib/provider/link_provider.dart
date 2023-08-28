import 'package:flutter/foundation.dart';
import 'package:tt9_betweener_challenge/controllers/link_controller.dart';
import 'package:tt9_betweener_challenge/core/helper/api_respons.dart';
import 'package:tt9_betweener_challenge/models/link_respons_model.dart';

class LinkProvider extends ChangeNotifier {
  //late List<Link> _links;
  late LinkRepository _linkRepository;
  late ApiResponse<List<Link>> _links;
  LinkProvider() {
    _linkRepository = LinkRepository();
    _fetchLinks();
  }

  ApiResponse<List<Link>> get links => _links;

  void _fetchLinks() async {
    _links = ApiResponse.loading('Loading');
    notifyListeners();

    try {
      final response = await _linkRepository.fetchLinks();
      _links = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      _links = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  void addLinks(Map<String, String> body) async {
    // _links = ApiResponse.loading('Loading');

    // notifyListeners();

    try {
      //final response =
      await _linkRepository.addLinks(body);
      _fetchLinks();

      // _links = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      _links = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  void editLinks(Map<String, String> body, int id) async {
    // _links = ApiResponse.loading('Loading');
    // notifyListeners();

    try {
      //final response =
      await _linkRepository.editLinks(body, id);

      _fetchLinks();
      // _links = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      _links = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  void deleteLinks(int id) async {
    // _links = ApiResponse.loading('Loading');
    // notifyListeners();

    try {
      //final response =

      await _linkRepository.deleteLinks(id);
      _fetchLinks();
      // _links = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      _links = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
