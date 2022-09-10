# DOCUMENTAÇÃO DO ROGUELIKE PARA ESTUDO

<strong>Projeto criado em POO  <a href="https://github.com/kleberandrade/roguelike-dart">FORK DO ROGUELIKE TUTORIAL MEDIUM</a> </strong>
<br />
<cite>F. Magno e Eduardo</cite>

---
<br />
<h1>ETAPAS DO PROJETO:</h1>
<h2>Etapa 0: escopo do projeto</h2> 
<p>O projeto funciona da seguinte forma, começamos definindo como seria a representação das posições dos jogadores e passagens no mapa
partindo desse principio criamos uma classe Ponto2D, Entidade, Celula. Partindo do principio que temos todas as peças posicionadas na "tela"
podemos partir para a criação de personagens sendo criatura ou Jogador controlavel, para essa parte usaremos uma classe abstrata chamada personagem que a partir dela teremos o jogador e a criatura.
</p>

<h2>Etapa 1: Ponto2D</h2>
<p>Primeiramente criamos uma classe chamada Ponto2D, que terá como atributos dois inteiros chamados:

```dart
int x, y;
///que representará os eixos para onde os personagens iram se mover ou iram estar
```
Que será responsável por armazenar o eixo X e Y do projeto.
</p>
<p> Após os atributos serem definidos partiremos para a criação do construtor que será responsável por criar o objeto a partir do que é passado,

Com o atributo nomeado é definido os valores do parâmetros o valor começará em zero e apos começar os movimentos no mapa eles iram se alterá :

```dart 
Ponto2D.zero() {
    this.x = this.y = 0;
}

```
</p>

<p>Usamos o override para indicar que queremos sobrescrever o método/objeto, abrindo uma função toString para retornar os valores dos atributos x e y , assim criando a forma dos objetos no mapa.</p>

<h2>Etapa 2: Entidade</h2>

<p>Essa classe terá uma posição(onde ele está nesse momento) e um simbolo(representação visual do personagem).
O simbolo vai ser um String onde será representado por um ASCII (Exemplo:#).
Posicao irá representar o ponto2d, ou seja, a posição atual de cada objeto no mundo

ele terá o construtor padrão para inicializar os atributos posição e simbolo

usamos novamente um override para indicar que queremos sobrescrever o método/objeto

abrindo uma função toString para retornar o valor do simbolo.
</p>













-----
# Alterações

<h2> Arquivo jogador.dart</h2>

<h3>Antes:</h3>

```dart
/// CODIGO ORIGINAL
static final String TECLA_CIMA = "W";
static final String TECLA_BAIXO = "S";
static final String TECLA_DIREITA = "D";
static final String TECLA_ESQUERDA = "A";

    // Verifica se o jogador digitou WASD para move-lo
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
---
<h2> Arquivo criatura.dart</h2>

<h3>Antes:</h3>

```dart 
/// CÓDIGO ORIGINAL
static final int FICAR_PARADO = 0;
static final int MOVER_BAIXO = 1;
static final int MOVER_CIMA = 2;
static final int MOVER_DIREITA = 3;
static final int MOVER_ESQUERDA = 4;
static final int QUANTIDADE_MOVIMENTOS = 5;  

      if (direcao == FICAR_PARADO) {
            mover(mundo, 0, 0);
      } else if (direcao == MOVER_BAIXO) {
            mover(mundo, 0, 1);
      } else if (direcao == MOVER_CIMA) {
            mover(mundo, 0, -1);
      } else if (direcao == MOVER_DIREITA) {
            mover(mundo, 1, 0);
      } else if (direcao == MOVER_ESQUERDA) { 
            mover(mundo, -1, 0);
      }

```

<h3>Depois:</h3>

```dart
var direcao = _aleatorio.nextInt(1000) % 5;

 switch(direcao) {
      case 0:
      mover(mundo, 0, 0);
      break;
      case 1:
      mover(mundo, 0, 1);
      break;
      case 2: 
      mover(mundo, 0, -1);
      break;
      case 3:
      mover(mundo, 1, 0);
      break;
      case 4: 
      mover(mundo, -1, 0);
      break;
    }
```


