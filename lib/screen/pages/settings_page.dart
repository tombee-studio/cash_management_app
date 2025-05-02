import 'package:cash_management_app/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viewmodel/bases/view_model_widget.dart';

class SettingsPage extends ViewModelWidget<HomeScreenViewModel> {
  const SettingsPage({super.key, required super.parentViewModel});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Settings Page"));
  }
}
