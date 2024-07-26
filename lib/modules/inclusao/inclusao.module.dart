import 'package:flutter_modular/flutter_modular.dart';

import 'inclusao.page.dart';

class InclusaoModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/:id', child: (_) => InclusaoPage(), transition: TransitionType.fadeIn);
  }
}