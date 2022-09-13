import 'package:desafio_dart/controllers/my_app_controller.dart';

void myApp() {
  final myAppController = MyAppController(activateMockedService: true);

  myAppController.runApp();
}
