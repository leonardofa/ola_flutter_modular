import 'package:flutter_modular/flutter_modular.dart';
import 'package:ola_flutter_modular/modules/home/home.page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage(), transition: TransitionType.fadeIn);
  }
}