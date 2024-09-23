import 'package:dialog_alert/dialog_alert.dart';
import 'package:flutter/material.dart';
import 'package:masked_text_field/masked_text_field.dart';
import 'package:viacep_flutter_t11/controller/home_controller.dart';
import 'package:viacep_flutter_t11/view/components/espacamento_h.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta CEP'),
        backgroundColor: Colors.amber[200],
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const EspacamentoH(h: 150),
                Image.asset(
                  'assets/images/busca_cep.png',
                  width: 200,
                ),
                const EspacamentoH(h: 150),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: MaskedTextField(
                    keyboardType: TextInputType.number,
                    mask: "xxxxx-xxx",
                    textFieldController: controller.cep,
                    maxLength: 9,
                    onChange: (value) async {
                      if (controller.cep.text.length == 9) {
                        controller.resultado = await controller.buscarCep();
                        setState(() {
                          showDialogAlert(
                            context: context,
                            title: 'Consulta de CEP',
                            message: controller.resultado,
                            actionButtonTitle: 'OK',
                          );
                        });
                      }
                    },
                    inputDecoration: InputDecoration(
                        hintText: "12345-000",
                        label: const Text('cep'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black),
                        )),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
