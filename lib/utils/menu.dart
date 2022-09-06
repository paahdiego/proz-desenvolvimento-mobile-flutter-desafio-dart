import 'dart:io';

import 'package:desafio_dart/utils/app-utils.dart';

class MenuUtils {
  static void showMenu() {
    AppUtils.clearConsole();
    print(
      """
Cadastro de Empresas

1. Cadastrar uma nova empresa;
2. Buscar Empresa cadastrada por CNPJ;
3. Buscar Empresa por CPF/CNPJ do Sócio;
4. Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social);
5. Excluir uma empresa (por ID);

0. Sair.
""",
    );
  }
}
