import 'package:fast8_techtest/models/product_model.dart';
import 'package:fast8_techtest/services/db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreWellnessCubit extends Cubit<ExploreWellnessState> {
  final DatabaseLocal _db = DatabaseLocal();

  ExploreWellnessCubit() : super(ExploreWellnessState(listProduct: [])) {
    _db.createDummyProduct();
    getProduct();
  }

  getProduct() async {
    List data = await _db.getData("products");
    if (data.isNotEmpty) {
      emit(ExploreWellnessState(
          listProduct: List.from(data.map((e) => ProductModel.fromJson(e)))));
    }
  }
}

class ExploreWellnessState {
  List<ProductModel> listProduct;
  ExploreWellnessState({required this.listProduct});
}
