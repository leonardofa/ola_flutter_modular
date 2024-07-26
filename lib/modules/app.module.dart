import 'package:flutter_modular/flutter_modular.dart';
import 'package:ola_flutter_modular/core/stores/todo.store.dart';
import 'package:ola_flutter_modular/modules/inclusao/inclusao.module.dart';

import '../core/pages/splash.page.dart';
import 'detalhe/detalhe.module.dart';
import 'home/home.module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(TodoStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => SplashPage(), transition: TransitionType.size);
    r.module('/home', module: HomeModule());
    r.module('/inclusao', module: InclusaoModule());
    r.module('/detalhe', module: DetalheModule());
  }
}