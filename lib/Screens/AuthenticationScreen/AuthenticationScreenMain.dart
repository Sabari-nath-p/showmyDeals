import 'package:flutter/material.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/Views/AuthenticationView.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: AuthenticationView()));
  }
}
