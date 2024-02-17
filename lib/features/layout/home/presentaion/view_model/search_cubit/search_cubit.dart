import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/layout/home/data/models/food_model/food_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  List<FoodModel> searchList = [];

  search(String value, List<FoodModel> foodModels) {
    searchList.clear();

    for (var element in foodModels) {
      if (element.title.toLowerCase().startsWith(value.toLowerCase())) {
        searchList.add(element);
      }
    }

    if (searchList.isNotEmpty) {
      emit(SearchSucess());
      print(searchList);
    } else {
      emit(SearchNoResults());
      print('No results found for "$value"');
    }
  }
}
