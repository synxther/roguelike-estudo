import 'dart:math';

import 'package:roguelike/entidade.dart';
import 'package:roguelike/ponto_2d.dart';
import 'package:roguelike/mundo.dart';

class Vida extends Entidade {
    Random _aleatorio;

  static final String SIMBOLO_VIDAS = 'V';

  Vida(Ponto2D posicao, String simbolo) : super(posicao, simbolo) {
    _aleatorio = Random(null);
  }
}
