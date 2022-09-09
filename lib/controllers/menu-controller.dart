import 'package:desafio_dart/controllers/company-controller.dart';
import 'package:desafio_dart/utils/app-utils.dart';
import 'package:desafio_dart/utils/menu.dart';
import 'package:desafio_dart/utils/user-input-getters.dart';

class MenuController {
  final companyController = CompanyController();

  void startMenu() {
    int? option;

    do {
      MenuUtils.showMenu();

      option = UserInput.receiveIntegerFromUser(
        message: "choose an option:",
        start: 0,
        end: 5,
        errorMessage: "provide an valid option",
      );

      if (option != 0) {
        switch (option) {
          case 1:
            companyController.createCompany();
            break;
          case 2:
            companyController.getCompanyByCNPJ();
            break;
          case 3:
            companyController.getCompanyByPartnerDocument();
            break;

          case 4:
            companyController.listCompaniesOrdenated();
            break;
          case 5:
            companyController.deleteCompanyById();
            break;
        }

        AppUtils.pauseApp();
      }
    } while (option != 0);
  }
}
