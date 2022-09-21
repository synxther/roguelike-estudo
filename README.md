# DOCUMENTAÇÃO DO ROGUELIKE PARA ESTUDO

<strong>Projeto criado em POO <a text-decoration="none" href="https://github.com/kleberandrade/roguelike-dart">FORK DO ROGUELIKE TUTORIAL MEDIUM</a> </strong>
<br />
<cite>F. Magno e Eduardo Abrantes</cite>
<br />
<bold>Ignorem erros de ortografia e acentuação, nada aqui deve ser levado com verdade absoluta</bold>

<h1>ETAPAS DO PROJETO:</h1>
<h2>Etapa 0: escopo do projeto</h2> 
<p>
O projeto funciona da seguinte forma, começamos definindo como seria a representação das posições dos jogadores e passagens no mapa
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


Após os atributos serem definidos partiremos para a criação do construtor que será responsável por criar o objeto a partir do que é passado.

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
"Posicao" irá representar o ponto2d, ou seja, a posição atual de cada objeto no mundo.

Ele terá o construtor padrão para inicializar os atributos posição e simbolo.
usamos novamente um override para indicar que queremos sobrescrever o método/objeto.
abrindo uma função toString para retornar o valor do simbolo.

</p>

---

<h2>Etapa 3: Celula</h2>

<p>
O mapa é composto por monstros passagens e paredes bloqueante(true ou false) usando uma herança para que a celula possa ocupar uma posição no mapa e tenha um simbolo.

Único atributo possuinte que eles tem é um valor bool com o nome bloqueado.

O true será responsável pelos bloqueios(#) enquanto o false será responsáveis pelas passagens(.)

Depois será usado um construtor padrão para inicializar o atributo bloqueado e depois um super construtor para inicializar os atributos posição e simbolo que são de entidade, classe pai de celula.

</p>

---

<h2>Etapa 4: Personagem</h2>
<p>
Apos criarmos o mapas partiremos para a criação de personagens(NPC e controláveis) para servir como base/modelo usaremos uma classe abstrata( que serve de base para sub classes, n podendo criar um objeto com ela) herdada de Entidade.

Ele terá os atributos posição e simbolo através do construtor padrão e posição e simbolo possuirá os valores implementados da sua classe pai com o construtor super.
criaremos uma função mover, onde terá uma condição if para se o bloqueado for igual a falso adicionar o deltaX para a posicao.x e a msm coisa para o eixo Y. O deltaX será adicionado dentro do atributo posição.x(referente ao personagem no mapa) assim atualizando com o método atualizar(Mundo mundo) a posição dos npc e controláveis.
mundo === local que está no mundo atual( @mundo: mundo em que o personagem esta no momento)

</p>

---

<h2>Etapa 5: Jogador</h2>
<p>
A classe jogador é uma extensão de personagem(no caso uma herança)
aonde ficará definidos a quantidade de vida, o método de como o Jogador irá se mover e perder vida.

A var vida será uma variável do tipo inteiro privada; que será acessada pelo método get chamado vidas;

A variável passos será a quantidade de passos que vc dará no decorrer do jogo, sendo que a kd passo o mundo será atualizado e tanto jogador quanto criatura mudaram de posição

O construtor do jogador, possuirá os parâmetros padrões como posição e simbolo adicionado o parâmetro vidas.

O atributo passos iniciará com valor = 0 para só ser acrescentado a partir do momento que o jogador se mover pelo mapa;

Após disso usaremos um getter para tornar o atributo privado \_vidas em atributo publico vidas para ser usado posteriormente.

Vai haver também o método vivo, onde, irá sempre verificar se o jogador está vivo ou morto quando o mundo atualizar.

Depois haverá um método para que o player perca vida ao sofrer um dano. nesse método será passado o parâmetro dano(var do tipo int)
que irá subtrair de \_vidas.

Após esses passos usaremos o método abstrato(void atualizar) criado na classe personagem que indicará o estado do mundo atual.

Aqui será onde poderemos ter o contato com o jogador(controlável) iniciando com um print que dará as instruções para a movimentação, logo em seguida teremos uma variável que será para as entradas(teclado --- WASD).

Aqui divergimos do código, enquanto ele segue por um padrão e if e else, nós optamos por uma pratica mais eficiente o Switch case;

Para cada caso será acrescentado ou retirado valores do posicao.x e y(método da class personagem) assim em seguida atualizando a variável mundo responsável por o estado atual do personagem no momento, E apos a cada movimento será incrementado nos passos do jogador;

</p>

---

<h2>Etapa 6: Criatura</h2>
<p>

As criaturas são os objetos no jogo que apresentaram perigo para o jogador podendo dar dano e se o jogador estiver com apenas uma vida, mata-lo.

Primeiro definiremos os atributos dela diferente do jogador, onde nós podemos movimenta-lo, as criaturas irão se mover por si só de forma aleatória, por essa razão, os movimentos da criatura serão assimilados a números e por nunca mudarem serão static:

```dart
static final int FICAR_PARADO           = 0;
static final int MOVER_BAIXO            = 1;
static final int MOVER_CIMA             = 2;
static final int MOVER_DIREITA          = 3;
static final int MOVER_ESQUERDA         = 4;
```

Para as criaturas caminharem de forma aleatória importaremos o dart:math; criamos uma variável Random privada \_aleatorio;

No super construtor especificaremos que o iniciará com um valor null, porem tá ação é opcional podendo passar o parâmetro vazio;( n entendi bem)

Aqui usaremos novamente o método abstrato atualizar, iniciando com uma variável direção que pegará o \_aleatorio q irá até o numero 1000 e será dividido pela quantidade de movimentos sendo que nesta parte nos focaremos no resto da divisão por 5.

Para haver a movimentação teremos o switch case que estará relacionado ao resto da divisão ( 0, 1, 2, 3 e 4)

</p>

---

<h2>Etapa 7: Mundo</h2>
<p>
A partir de agora estaremos criando o mundo do jogo
 <li>mundo composto por jogador </li>
 <li>criaturas</li>
 <li>mapa</li>

Precisa ser desenhável, um modo de atualizar os personagens e cores para diferenciar as coisas no mapa.

Iniciaremos definindo atributos de altura e largura(int), passaremos para uma lista da classe celula que se chamara mapa, logo apos teremos uma outra lista( da classe Criatura) que será responsável pelas criaturas no mapa.
e um atributo jogador(classe Jogador).

Criamos um construtor Mundo que pegará os atributos da matrix mapa, e da lista criaturas(atributos definido log acima);
Dentro desse construtor atribuímos a variável privada largura os valores dos indenes de mapa(mapa.length), já em relação a altura atribuímos o valor.

Faremos em seguida um método de bloqueio se baseando em x e y, bool bloqueado(int x, int y) caso o valor de bloqueado for verdadeiro ele irá retornar as coordenadas desejadas como bloqueadas.

Em seguida faremos o método de atualizar, para atualizar a posição do jogador e usar o repetidor for para atualizar a posição de todas as criaturas. Dentro do método atualizar também criaremos uma condição onde, se a posição do player for igual a de uma criatura o player vai tomarDano(1).

Agora o faremos o método responsável por desenhar o mundo, void desenhar. Primeiramente iremos armazenar as posições das criaturas em um mapa usando o <strong><i>for</i></strong> para pegar a posição de cada uma individualmente e em seguida adicionamos o do jogador no mapa também. Depois mostraremos as informações do jogador como sua posição total de vidas e quantidade de passos usando o print e repetiremos em toda atualização.

Juntamente com isso faremos um <i>for</i> responsável por desenhar o mapa onde int y rodará começando com 0, e enquanto for menor que \_altura terá o incremento de 1(y++). a variável line n terá conteúdo, e será onde o for percorrerá toda vez adicionando linhas até o seu valor ser sido alcançado.

Teremos um for dentro de outro for que percorrerá todas as colunas iniciando também em 0, e enquanto x for menor que \_largura ele terá um incremento.

Apos isso teremos uma sequencia de if and else que serão responsáveis por pintar os nosso personagem, o primeiro if é para se caso tenha algo além do null ele irá criar um jogador caso o simbolo respectivo daquela linha for jogador.SIMBOLO_JOGADOR caso contrario ele ira pintar uma criatura e caso não tenha nada além do null ele irá desenhar o mapa(pintar as parede de branco).

</p>

---

<h2>Etapa 8: MundoBuilder</h2>
<p>

Apesar da classe mundo gerar e armazenar jogador, criatura e bloqueios/passagens(a partir de x e y), mas ainda sim não temos quem criará o mapa

  <strong>
    Heurística é um método ou processo criado com o objetivo de encontrar soluções para um problema.
  </strong>
  <cite>Medium</cite>
Na classe MundoBuilder teremos como atributos (int) largura e altura; a matriz mapa e a lista de criaturas. Vamos ter o construtor padrão onde será incializado a largura a altura e as criaturas

Agora faremos o passo 1 da heurística, o metodo preencher, ele será usado para preencher o mapa, consistindo em criar uma matriz onde X e Y são celulas bloqueadas, para isso teremos uma variável mapa que vai armazenar duas List.generate que irão repetir o x pela largura e y pela altura fazendo assim uma matriz de celulas bloqueadas.
assim retornando o mesmo.

Após gerarmos o mapa bloqueado começaremos a gerar as passagens, y será o inicio de sua posição em y, o x será o mesmo esquema, o passos como o próprio nome ja diz será responsável pela quantidade de passos do jogador.

Esse metodo inicia com uma variável Random denominada bussola que rodará o parâmetro Random().

Logo apos isso teremos um for inciado em 0, e enquanto i for menor que passo ele ira adicionar mais 1. Esse for receberá uma variável norte = bussola.nextInt(4);
assim verificando as novas passagens.

Ainda dentro do for teremos uma condicional, para deslocar o jogador para o norte apontado sem atravessar as paredes colocadas(n entendi a estruturação da condicional em sua essência),
e para trocar as paredes por passagens tem uma lista mapa com arrays [x] [y] que será igual ao construtor celula que pegará as posições x, y, que irá trocar o os símbolos de acordo com o bool atual.

Agora iremos adicionar as criaturas no mapa, especificando o numero de criaturas que queremos que o mapa possua

Esse metodo começa com uma variável Random que gera um numero aleatório e os int x e y que serão as posições iniciais das criaturas, após isso, criaremos um for que repetira pela quantidade de criaturas definida, dentro do for criaremos um código que defini valores randômicos para x e y em relação a largura e altura e impedir que criaturas surjam em cima de paredes usando o do while(mapa[x][y].bloqueado), e por fim retornamos o metodo.

Por fim criaremos o metodo build que vair retornar o nosso mundo(mapa e criaturas).

</p>

---

<h2>Etapa 9: Roguelike</h2>
<p>

na ultima classe Roguelike, criaremos uma variável privada mundo com tipo Mundo, uma variável privada jogador com tipo Jogador e os inTs privados largura e altura.

Depois o construtor padrão que irá chamar o metodo criarMundo()

O método criarMundo será o metodo para criar o mundo, inicialmente iremos definir a posição inicial do player. criamos uma variavel posição de tipo Ponto2D que vai ser igual ao Ponto2d.zero, ou seja, a posição.x e posição.y vão ser inicialmente 0 mas será adicionado a divisão inteira da largura e da altura por 2.

Depois definiremos a quantidade de passos que será igual a largura vezes a altura vezes o FATOR_PROFUNDIDADE.

Depois criaremos o mapa a classe mundo builder que irá executar os comandos:
.preencher
.criarCaminho
.criarCriaturas
.build

e colocaremos o jogador no mundo com \_mundo.jogador = \_jogador;

Por fim criamos o metodo executar que while o personagem estiver vivo ele irá executar o \_mundo.desenhar e as atualizações. quando o personagem morrer, é game over.

</p>

---

<h2>Etapa 10: Void main()</h2>
<p>
Para iniciar começaremos importando a classe roguelike que terá todas as funções e classes que precisamos para que o jogo funcione corretamente.

Partindo para a parte principal:

Começaremos definindo uma constante para a largura e altura onde o mapa será gerado a partir desses valores.

Instanciamos a classe passando o objeto jogo, atribuindo os valores de altura e largura para a classe.

Após executamos o objeto jogo chamando o metodo executar(), o que rodará o jogo.

Que irá executar um while para rodar enquanto o jogador estiver vivo, atualizando as criaturas e jogador

Até que o jogador morra

</p>

---

# Alterações:

<h3>Indices:</h3>

- <strong><a href="#jogador">Jogador.dart</a>:</strong>
  Para o sistema de movimento do player tem como trocar o if else por um switch case fazendo isso tem como tirar os atributos static final TECLA_DIREITA,ESQUERDA,CIMA E BAIXO, além das linhas que o if pegava, fazendo isso, aparentemente o joguinho para de dar glitch quando você tecla muito rápido.
- <strong><a href="#criatura">criatura.dart</a>:</strong> Na classe criatura podemos retirar a QUANTIDADE_MOVIMENTOS e na variável direção usar var direcao = \_aleatorio.nextInt(1000) % 5.
- <strong><a href="#criatura">criatura.dart</a>:</strong> O sistema de criatura de foi trocado de if and else por switch case assim economizando/limpando 15 linhas de código.</li>

<h2 id="jogador">Jogador.dart</h2>

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
      break;
      // o jogo tem um bug que ao apertar enter sem andar ele conta como passos msm que eu n ande para isso adcionamos um default com a seguinte linha
      passos--;
}

```

<h2 id="criatura">Criatura.dart</h2>

<h3>Antes:</h3>

```dart
  static final int FICAR_PARADO = 0;
  static final int MOVER_BAIXO = 1;
  static final int MOVER_CIMA = 2;
  static final int MOVER_DIREITA = 3;
  static final int MOVER_ESQUERDA = 4;
  static final int QUANTIDADE_MOVIMENTOS = 5

    if (direcao == FICAR_PARADO) {
      mover(mundo, 0, 0);
    } else if (direcao == MOVER_BAIXO) {
      mover(mundo, 0, 1);
    } else if (direcao == MOVER_CIMA) {
      mover(mundo, 0, -1);
    } else if (direcao == MOVER_DIREITA) {
      mover(mundo, 1, 0);
    } else if (direcao == MOVER_ESQUERDA) mover(mundo, -1, 0);

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

<h2>Observações:</h2>

<p>

- Super construtores => supostamente o ":" rodará antes do construtor em si, para só assim após poder atribuir valores ao personagem;
- entidade tem um atributo que tem que tem acesso ao Ponto2D por meio do atributo (Ponto2D posição) EX: posicao.x;

- o método mover jogará os valores para a classe personagem q rodará o if.

- O static serve para encapsular a variável para que não chamada em nenhum outro local.
</p>

<h2>Duvidas:</h2>
<p>
  
```dart

Mundo(this.mapa, this.criaturas) {
\_largura = mapa.length;
\_altura = mapa[0].length;
}
/// estrutura do mapa[0]
//pq possui um indice zero?

````

```dart

 for (int y = 0; y < _altura; y++) {
      var line = "";
      // Percorre todas as colunas
      for (int x = 0; x < _largura; x++) {

        // SE na posição X, Y existe algo além do chão, então
        if (map[Ponto2D(x, y).toString()] != null) {
          // SE a posição tem um jogador, desenha o jogador, caso contrário desenha a criatura
          if (map[Ponto2D(x, y).toString()].simbolo == Jogador.SIMBOLO_JOGADOR) {
            line += '\u001b[34;1m' + map[Ponto2D(x, y).toString()].toString();
          } else {
            line += '\u001b[31;1m' + map[Ponto2D(x, y).toString()].toString();
          }
        } else { // Desenha o mapa
          line += '\u001b[0m' + mapa[x][y].toString();
        }
      }
      print(line);
    }
/// dificuldade na estrutura em geral
````

</p>
