# DOCUMENTAÇÃO DO ROGUELIKE PARA ESTUDO

<strong>Projeto criado em POO  <a text-decoration="none" href="https://github.com/kleberandrade/roguelike-dart">FORK DO ROGUELIKE TUTORIAL MEDIUM</a> </strong>
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

---

<h2>Etapa 2: Entidade</h2>

<p>Essa classe terá uma posição(onde ele está nesse momento) e um simbolo(representação visual do personagem).
O simbolo vai ser um String onde será representado por um ASCII (Exemplo:#).
"Posicao" irá representar o ponto2d, ou seja, a posição atual de cada objeto no mundo

ele terá o construtor padrão para inicializar os atributos posição e simbolo.
usamos novamente um override para indicar que queremos sobrescrever o método/objeto.
abrindo uma função toString para retornar o valor do simbolo.
</p>

---

<h2>Etapa 3: Celula</h2>

<p>
O mapa é composto por monstros passagens e paredes bloqueante(true ou false) usando uma herança para que a celula possa ocupar uma posição no mapa e tenha um simbolo.	

único atributo possuinte que eles tem é um valor bool com o nome bloqueado.

o true será responsável pelos bloqueios(#) enquanto o false será responsáveis pelas passagens(.)

Depois será usado um construtor padrão para inicializar o atributo bloqueado e depois um super construtor para inicializar os atributos posição e simbolo que são de entidade, classe pai de celula.
</p>

---

<h2>Etapa 4: Personagem</h2>
<p>
apos criarmos o mapas partiremos para a criação de personagens(NPC e controláveis) para servir como base/modelo usaremos uma classe abstrata( que serve de base para sub classes, n podendo criar um objeto com ela) herdada de Entidade.

ele terá os atributos posição e simbolo através do construtor padrão e posição e simbolo possuirá os valores implementados da sua classe pai com o construtor super.
									
criaremos uma função mover, onde terá uma condição if para se o bloqueado for igual a falso adicionar o deltaX para a posicao.x e a msm coisa para o eixo Y. O deltaX será adicionado dentro do atributo posição.x(referente ao personagem no mapa) assim atualizando com o metodo atualizar(Mundo mundo) a posição dos npc e controlaveis.
			
mundo === local que está no mundo atual( @mundo: mundo em que o personagem esta no momento)
</p>

---

<h2>Etapa 5: Jogador</h2>
<p>
a classe jogador é uma extensão de personagem(no caso uma herança)
aonde ficará definidos a quantidade de vida, o método de como o Jogador irá se mover e perder vida.

a var vida será uma variável do tipo inteiro privada; que será acessada pelo método get chamado vidas;

a variável passos será a quantidade de passos que vc dará no decorrer do jogo, sendo que a kd passo o mundo será atualizado e tanto jogador quanto criatura mudaram de posição

O construtor do jogador, possuirá os parâmetros padrões como posição e simbolo adicionado o parâmetro vidas.

o atributo passos iniciará com valor = 0 para só ser acrescentado a partir do momento que o jogador se mover pelo mapa;

Após disso usaremos um getter para tornar o atributo privado _vidas em atributo publico vidas para ser usado posteriormente.

Vai haver também o método vivo, onde, irá sempre verificar se o jogador está vivo ou morto quando o mundo atualizar.

depois haverá um método para que o player perca vida ao sofrer um dano. nesse método será passado o parâmetro dano(var do tipo int)
que irá subtrair de _vidas.

após esses passos usaremos o método abstrato(void atualizar) criado na classe personagem que indicará o estado do mundo atual.

aqui será onde poderemos ter o contato com o jogador(controlável) iniciando com um print que dará as instruções para a movimentação, logo em seguida teremos uma variável que será para as entradas(teclado --- WASD).

aqui divergimos do código, enquanto ele segue por um padrão e if e else, nós optamos por uma pratica mais eficiente o Switch case;

para cada caso será acrescentado ou retirado valores do posicao.x e y(método da class personagem) assim em seguida atualizando a variável mundo responsável por o estado atual do personagem no momento.

e apos a cada movimento será incrementado nos passos do jogador;

</p>





-----
# Alterações

* <strong><a href="#teste">Jogador.dart</a>:</strong> 
Para o sistema de movimento do player tem como trocar o if else por um switch case fazendo isso tem como tirar os atributos static final TECLA_DIREITA,ESQUERDA,CIMA E BAIXO, além das linhas que o if pegava, fazendo isso, aparentemente o joguinho para de dar glitch quando você tecla muito rápido.

<h2 id="teste"> Arquivo jogador.dart</h2>

<h3 >Antes:</h3>

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


