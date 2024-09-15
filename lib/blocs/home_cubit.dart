import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(selectedFilter: "Terpopuler"));

  setFilterWellness(String filter) {
    print(filter);
    emit(HomeState(selectedFilter: filter));
    print(state.selectedFilter);
  }
}

class HomeState {
  final String selectedFilter;
  HomeState({required this.selectedFilter});
}
