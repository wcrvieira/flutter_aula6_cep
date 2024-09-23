import 'package:flutter/material.dart';
import 'package:viacep_flutter_t11/model/endereco_model.dart';

class HomeController {
  TextEditingController cep = TextEditingController();
  String resultado = "";

  Future<String> buscarCep() async{
    EnderecoModel endereco = EnderecoModel();
    endereco = await EnderecoModel.buscarCep(cep.text);
    return 'Cep: ${endereco.cep} \nLogradouro: ${endereco.logradouro} \nBairro: ${endereco.bairro} \nCidade: ${endereco.localidade} \nUF: ${endereco.uf} \nEstado: ${endereco.estado}';
  }

  Future<String> getCep(String cep) async {
    return '12345-000';
  }
}