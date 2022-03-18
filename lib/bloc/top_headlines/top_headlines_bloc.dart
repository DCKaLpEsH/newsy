import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newsy/data/models/articles_model.dart';
import 'package:newsy/data/repository/articles_repository.dart';

part 'top_headlines_event.dart';
part 'top_headlines_state.dart';

class TopHeadlinesBloc extends Bloc<TopHeadlinesEvent, TopHeadlinesState> {
  final ArticlesRepository articlesRepository;
  TopHeadlinesBloc({required this.articlesRepository})
      : super(TopHeadlinesInitialState()) {
    on<TopHeadlinesEvent>(getArticles);
  }
  Future getArticles(
      TopHeadlinesEvent event, Emitter<TopHeadlinesState> emit) async {
    List<Articles> articles = [];
    if (event is TopHeadlinesFetchingEvent) {
      emit(
        TopHeadlinesFetchingState(),
      );
      articles = await articlesRepository.getTopHeadlines(event.category);
      if (articles.isEmpty) {
        emit(
          TopHeadlinesEmptyState(),
        );
      } else {
        emit(
          TopHeadlinesFetchedState(articles),
        );
      }
      // if (event is TopHeadlinesErrorEvent) {
      //   emit(TopHeadlinesErrorState());
      // }
    }
  }
}
