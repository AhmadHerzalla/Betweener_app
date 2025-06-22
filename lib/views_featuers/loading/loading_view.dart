import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt9_betweener_challenge/views_featuers/auth/login_view.dart';
import 'package:tt9_betweener_challenge/views_featuers/main_app_view.dart';

class LoadingView extends StatefulWidget {
  static const id = '/loadingView';
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  void checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('user') && mounted) {
      // ignore: avoid_print
      print('navigate to main');
      Navigator.pushNamed(context, MainAppView.id);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(  context, LoginView.id);
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
