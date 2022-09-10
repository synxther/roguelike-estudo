# DOCUMENTAÇÃO DO ROGUELIKE PARA ESTUDO

<strong>Projeto criado em POO <a href="https://github.com/kleberandrade/roguelike-dart"> FORK DO ROGUELIKE TUTORIAL MEDIUM</a> </strong>
<br />
<cite>F. Magno e Eduardo</cite>

---
<h2>Etapa 0: escopo do projeto</h2> 
<p>O projeto funciona da seguinte forma, começamos definindo como seria a representação das posições dos jogadores e passagens no mapa
partindo desse principio criamos uma classe Ponto2D, Entidade, Celula. Partindo do principio que temos todas as peças posicionadas na "tela"
podemos partir para a criação de personagens sendo criatura ou Jogador controlavel, para essa parte usaremos uma classe abstrata chamada personagem que a partir dela teremos o jogador e a criatura.
</p>






















-----
# Alterações

<h2> Arquivo jogador.dart</h2>

<h3>Antes:</h3>

```dart

static final String TECLA_CIMA = "W";
static final String TECLA_BAIXO = "S";
static final String TECLA_DIREITA = "D";
static final String TECLA_ESQUERDA = "A";

if (entrada == TECLA_DIREITA) {
  mover(mundo, 1, 0);
} else if (entrada == TECLA_ESQUERDA) {
      mover(mundo, -1, 0);
} else if (entrada == TECLA_CIMA) {
      mover(mundo, 0, -1);
} else if (entrada == TECLA_BAIXO) mover(mundo, 0, 1);

```

<h3>Depois:</h3>

```dart
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
      passos--;
    }
```

