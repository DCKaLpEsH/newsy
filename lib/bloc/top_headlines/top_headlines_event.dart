part of 'top_headlines_bloc.dart';

abstract class TopHeadlinesEvent extends Equatable {
  const TopHeadlinesEvent();

  @override
  List<Object> get props => [];
}

class TopHeadlinesFetchingEvent extends TopHeadlinesEvent {
  final String category;
  const TopHeadlinesFetchingEvent({required this.category});
}

class TopHeadlinesFetchedEvent extends TopHeadlinesEvent {}

class TopHeadlinesErrorEvent extends TopHeadlinesEvent {}
