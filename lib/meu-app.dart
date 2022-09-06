import 'package:desafio_dart/controllers/my-app-controller.dart';

void myApp() {
  final myAppController = MyAppController(activateMockedService: true);

  myAppController.runApp();
}
