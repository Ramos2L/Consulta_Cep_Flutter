import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'searchcep_state.dart';

class SearchcepCubit extends Cubit<SearchcepState> {
  SearchcepCubit() : super(SearchcepInitial());

  Future<void> searchCep(String cep) async {
    try {
      final response = await Dio().get('https://viacep.com.br/ws/$cep/json');
      emit(SearchcepSucess(response.data));
    } catch (e) {
      emit(SearchcepError('Erro ao consultar cep'));
    }
  }
}
