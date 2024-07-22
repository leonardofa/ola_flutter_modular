import 'package:flutter_modular/flutter_modular.dart';
import 'package:ola_flutter_modular/modules/second/second.page.dart';

class SecondModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/:id', child: (_) => SecondPage(id: int.parse(r.args.params['id'])), transition: TransitionType.fadeIn);
  }
}