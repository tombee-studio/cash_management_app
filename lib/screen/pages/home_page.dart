import 'package:flutter/material.dart';
import 'package:flutter_viewmodel/bases/view_model_widget.dart';
import 'package:cash_management_app/view_model/home_screen_view_model.dart';

class HomePage extends ViewModelWidget<HomeScreenViewModel> {
  const HomePage({super.key, required super.parentViewModel});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 240,
          child: Card(child: parentViewModel.getTransactionChart(context)))
    ]);
  }
}
