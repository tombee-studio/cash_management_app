import 'package:cash_management_app/data/home_screen_state.dart';
import 'package:cash_management_app/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viewmodel/bases/view_model_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenViewModelState();
}

class _HomeScreenViewModelState
    extends ViewModelState<HomeScreen, HomeScreenViewModel> {
  @override
  HomeScreenViewModel createViewModel() => HomeScreenViewModel(this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          foregroundColor: Theme.of(context).colorScheme.primary,
          title: const Text('収支管理アプリ'),
        ),
        body: viewModel.body,
        floatingActionButton: viewModel.floatingActionButton(context),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            currentIndex:
                HomeScreenState.values.indexOf(viewModel.currentState),
            onTap: onTap,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: '収支管理'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定')
            ]));
  }

  void onTap(int index) {
    viewModel.currentState = HomeScreenState.values[index];
    viewModel.load();
  }
}
