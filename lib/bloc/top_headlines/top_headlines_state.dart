part of 'top_headlines_bloc.dart';

abstract class TopHeadlinesState extends Equatable {
  const TopHeadlinesState();

  @override
  List<Object> get props => [];
}

class TopHeadlinesInitialState extends TopHeadlinesState {}

class TopHeadlinesFetchingState extends TopHeadlinesState {}

class TopHeadlinesFetchedState extends TopHeadlinesState {
  final List<Articles> articles;
  const TopHeadlinesFetchedState(this.articles);
  @override
  List<Object> get props => [articles];
}

class TopHeadlinesEmptyState extends TopHeadlinesState {}
