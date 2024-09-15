import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState(isDetail: false, activeIdx: 0)) {
    bottomSheetController.addListener(() {
      if (bottomSheetController.size >= 0.44) {
        if (state.isDetail == false) {
          emit(BottomNavState(isDetail: true, activeIdx: state.activeIdx));
        }
      } else if (bottomSheetController.size <= 0.15) {
        if (state.isDetail == true) {
          emit(BottomNavState(isDetail: false, activeIdx: state.activeIdx));
        }
      }
    });
  }

  final DraggableScrollableController bottomSheetController =
      DraggableScrollableController();

  void toggleDetail() {
    print(state.isDetail);
    double position = 0.44;
    if (state.isDetail) {
      position = 0.14;
    }
    bottomSheetController.animateTo(position,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInCubic);
    emit(BottomNavState(isDetail: !state.isDetail, activeIdx: state.activeIdx));
  }

  void goTo(int index) {
    emit(BottomNavState(isDetail: state.isDetail, activeIdx: index));
  }
}

class BottomNavState {
  final bool isDetail;
  final int activeIdx;
  BottomNavState({required this.isDetail, required this.activeIdx});
}
