import 'dart:io';
import 'package:roguelike/mundo.dart';
import 'package:roguelike/personagem.dart';
import 'package:roguelike/ponto_2d.dart';

// Classe Jogador é derivada (filha) da classe Personagem
class Jogador extends Personagem {
  // Constantes
  // static final String TECLA_CIMA = "W";
  // static final String TECLA_BAIXO = "S";
  // static final String TECLA_DIREITA = "D";
  // static final String TECLA_ESQUERDA = "A";
  static final String SIMBOLO_JOGADOR = "@";

  int _vidas; // Variável privada (_nomeDaVariavel)
  int passos; // Variável publica

  // Getter para variável vida
  int get vidas => _vidas;

  // Construtor padrão + Construtor do pai (super)
  Jogador(Ponto2D posicao, String simbolo, this._vidas)
      : super(posicao, simbolo) {
    this.passos = 0;
  }

  // Método inline verifica se o jogador esta vivo
  bool vivo() => _vidas > 0;

  // Método para dar dano no jogador
  // @dano: valor que será descontado da vida do jogador
  void tomarDano(int dano) {
    this._vidas -= dano;
  }

  // Implementação do método abstrato atualizar
  // @mundo: mundo em que o personagem esta no momento
  void atualizar(Mundo mundo) {
    print(
        "Para mover o personagem [W/Cima - S/Baixo - A/Esquerda - D/Direita]: ");

    // Aguarda entrada pelo console e converte para maiusculo
    var entrada = stdin.readLineSync().toUpperCase();

    // Verifica se o jogador digitou WASD para move-lo trocamos o if and else por switch case simplismente por ficar com o codigo mais limpo e pelo o fato de a verificação é de apenas uma variavel logo o switch acaba sendo mais apropriado para o caso 
    switch(entrada) {
      case "D":
      mover(mundo, 1, 0);
      break;
      case "A":
      mover(mundo, -1, 0);
      break;
      case "W":
      mover(mundo, 0, -1);
      break;
      case "S": 
      mover(mundo, 0, 1);
      break;

      default:
      print("valor invalido tente novamente");
      // o jogo tem um bug que ao apertar enter sem andar ele conta como passos msm que eu n ande para isso adcionamos um default com a seguinte linha
      passos--;
    }
    // Verifica se o jogador digitou WASD para move-lo
    // if (entrada == TECLA_DIREITA) {
    //   mover(mundo, 1, 0);
    // } else if (entrada == TECLA_ESQUERDA) {
    //   mover(mundo, -1, 0);
    // } else if (entrada == TECLA_CIMA) {
    //   mover(mundo, 0, -1);
    // } else if (entrada == TECLA_BAIXO) mover(mundo, 0, 1);

    // incrementa o número de passos do jogador
    passos++;
  }
}
