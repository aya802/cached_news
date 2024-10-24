import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../constant.dart';
import '../models/news_model.dart';
import '../screens/news_screen.dart';
import '../services/api_service.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  ApiService apiService = ApiService();
  int selectedIndex = 0;

  List<String> categories = ['technology', 'business', 'sports'];
  NewsCubit() : super(NewsLoadingState());

  void onTapScreen(int index) {
    selectedIndex = index;
    getHeadLines(category: categories[selectedIndex]);
    emit(BottomStates());
  }

  List<Widget> screens = [
    const NewsScreen(),
    const Text('Category'),
    const Text('Ccebter'),
  ];
  static NewsCubit get(context) => BlocProvider.of(context);
  Future<void> getHeadLines({required String category}) async {
    emit(NewsLoadingState());

    try {
      List<ArticleModel> articles = await apiService.getHeadLines(
          data: {'category': category, 'apiKey': apiKey},
          path: 'top-headlines');
      if (articles.isEmpty) {
        emit(NewsFailureState(errorMsg: 'No articles found'));
      } else {
        emit(NewsLoadedState(articleModel: articles));
      }
    } catch (e) {
      emit(NewsFailureState(errorMsg: 'Failed to load data'));
    }
  }
}
