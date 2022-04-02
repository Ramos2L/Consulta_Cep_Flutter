part of 'searchcep_cubit.dart';

@immutable
abstract class SearchcepState {}

class SearchcepInitial extends SearchcepState {
  SearchcepInitial();
}

class SearchcepSucess implements SearchcepState {
  final Map data;

  SearchcepSucess(this.data);
}

class SearchcepLoading extends SearchcepState {
  SearchcepLoading();
}

class SearchcepError extends SearchcepState {
  final String message;

  SearchcepError(this.message);
}
