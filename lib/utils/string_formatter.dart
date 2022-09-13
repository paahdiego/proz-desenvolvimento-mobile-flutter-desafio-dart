class StringFormatter {
  String formatCPF(String cpf) {
    cpf = cpf.replaceAll(RegExp(r"\D"), "").trim();

    return "${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9, 11)}  ";
  }

  String formatCNPJ(String cnpj) {
    cnpj = cnpj.replaceAll(RegExp(r"\D"), "").trim();

    return "${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12)}  ";
  }
}
