import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_cep_cubit/pages/cubit/searchcep_cubit.dart';

class Home extends StatelessWidget {
  Home({ Key? key }) : super(key: key);

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qual seu cep?',),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(  
        //height: double.infinity,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Center(  
          child: Column(  
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Digite seu cep para consultar os dados: ', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400), ),
              const Padding(padding: EdgeInsets.all(10)),
              TextField(  
                controller: textController,
                decoration: const InputDecoration(  
                  border: OutlineInputBorder(),
                  labelText: 'cep'
                ),
              ),
              const SizedBox( height: 10,),
              ElevatedButton(
                onPressed: () {
                  final search = context.read<SearchcepCubit>();
                  search.searchCep(textController.text);
                }, 
                child: const Text('Pesquisar'),
                style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,
              ),
              ),
              const SizedBox( height: 20,),
              const Resposta(),
            ],
          ),
        ),
      ),
    );
  }
}

class Resposta extends StatelessWidget {
  const Resposta({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchcepCubit, SearchcepState>(
      builder: (context, state) {
        if ( state is SearchcepError ){
          return Text(state.message, style: TextStyle( color: Colors.primaries[Random().nextInt(Colors.primaries.length)],),);
        }  
        if ( state is SearchcepLoading ){
          return const Expanded(child: Center(child: CircularProgressIndicator.adaptive(),),);
        }
        if ( state is SearchcepSucess ){
          return Text('Cidade ${state.data['localidade']}/${state.data['uf']}', style: TextStyle( color: Colors.primaries[Random().nextInt(Colors.primaries.length)],),);
        }
        return const Text('...');
      }
    );
  }
}