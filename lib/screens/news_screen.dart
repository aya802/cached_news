

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/widgets/news_item.dart';

import '../cubit/news_cubit.dart';
import '../cubit/news_state.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsLoadedState) {
          return ListView.separated(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return NewsItem(articleModel: state.articleModel[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8,
              );
            },
            itemCount: state.articleModel.length,
          );
        } else if (state is NewsFailureState) {
          return Text(state.errorMsg);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
