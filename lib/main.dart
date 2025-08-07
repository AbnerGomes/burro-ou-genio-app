import 'package:flutter/material.dart';

void main() => runApp(TesteDeNaoQIApp());

class TesteDeNaoQIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste de NÃO Q.I',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          onPrimary: Colors.white,
          surface: Colors.white,
        ),
      ),
      home: QuizHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizHomePage extends StatefulWidget {
  @override
  _QuizHomePageState createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  int _questionIndex = 0;
  int _score = 0;
  List<String> results = [];
  bool _showDontClick = true;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Você se considera burro?',
      'options': ['SIM', 'NÃO'],
      'answer': 'SIM',
      'icon': Icons.help_outline,
      'explanation': {
        'SIM': 'Ainda bem que você sabe! 👏',
        'NÃO': 'Não adianta clicar em "não", tu é burro SIM. 😎'
      }
    },
    // {
    //   'question': 'Esta frase é falsa.',
    //   'options': ['SIM', 'NÃO'],
    //   'answer': 'nenhuma',
    //   'icon': Icons.loop,
    //   'explanation': {
    //     'default': 'Nem eu sei... mas você errou mesmo assim! 😂'
    //   }
    // },
    {
      'question': 'Se você responder a esta pergunta errada, você estará certo?',
      'options': ['SIM', 'NÃO'],
      'answer': 'paradoxo',
      'icon': Icons.psychology,
      'explanation': {
        'default': 'Parabéns, você entrou num buraco negro de lógica. 🔀'
      }
    },
    {
      'question': 'Se você pegar 3 maçãs de uma cesta com 10, com quantas maçãs você fica?',
      'options': ['7', 'SIM', '3', '0'],
      'answer': '3',
      'icon': Icons.apple,
      'explanation': {
        '3': 'Claro né... você pegou 3, então ficou com 3. Dãã! 🍎',
        'default': 'Você pegou 3 maçãs e ficou com... quantas mesmo? 😵'
      }
    },
    {
      'question': 'E se fosse com laranjas?',
      'options': ['7', '3', 'SIM', '0'],
      'answer': '3',
      'icon': Icons.sports_bar,
      'explanation': {
        '3': '3 de novo, anta. 🦧',
        'default': 'Você confundiu laranja com física quântica, foi? 🍊'
      }
    },
     {
      'question': 'Quem pintou a Mona Lisa?',
      'options': [
        'Vincent van Gogh',
        'Claude Monet',
        'Leonardo da Vinci',
        'Pablo Picasso'
      ],
      'answer': 'Leonardo da Vinci',
      'icon': Icons.brush,
      'explanation': {
        'Leonardo da Vinci': 'Sim! O da Vinci pintou essa famosa senhora que sorri de canto.',
        'default': 'Errado! Mas valeu pela tentativa artística.'
      }
    },
    {
      'question': 'Em que ano Cristóvão Colombo descobriu o Brasil?',
      'options': ['1500', '1522', '1450', '1945', 'nenhum'],
      'answer': 'nenhum',
      'icon': Icons.sailing,
      'explanation': {
        'nenhum': 'Muito bem! Foi Pedro Álvares Cabral que descobriu o Brasil, não Colombo!',
        'default': 'Ihhh... Colombo descobriu as Américas, não o Brasil!'
      }
    },
    {
      'question': 'Qual a velocidade da luz?',
      'options': [
        '300 000 000 metros por segundo (m/s)',
        '150 000 000 metros por segundo (m/s)',
        '199 792 458 metros por segundo (m/s)',
        '299 792 458 metros por segundo (m/s)',
        '30 000 000 metros por segundo (m/s)'
      ],
      'answer': '299 792 458 metros por segundo (m/s)',
      'icon': Icons.flash_on,
      'explanation': {
        '299 792 458 metros por segundo (m/s)': 'Acertou! Você tá iluminado!',
        'default': 'Quase, mas a luz corre um pouquinho mais rápido que isso.'
      }
    },
    {
      'question': 'Qual é a cor do cavalo branco de Napoleão?',
      'options': ['Branco', 'Preto', 'Marrom', 'Cinza'],
      'answer': 'Branco',
      'icon': Icons.color_lens,
      'explanation': {
        'Branco': 'Parabéns, você acertou o óbvio! Ou será que caiu na pegadinha?',
        'default': 'Errado! Era só ler com atenção...'
      }
    },
    {
      'question': 'As pessoas de qual tipo sanguíneo são consideradas doadores universais?',
      'options': ['Tipo A', 'Tipo B', 'Tipo O', 'Tipo AB', 'Tipo ABO'],
      'answer': 'Tipo O',
      'icon': Icons.bloodtype,
      'explanation': {
        'Tipo O': 'Correto! Tipo O negativo é o verdadeiro herói universal.',
        'default': 'Errado! Só o tipo O pode dar uma ajudinha pra todo mundo.'
      }
    },
    {
      'question': 'Você pode colocar 2 litros de água em uma garrafa de 1 litro?',
      'options': ['SIM', 'NÃO'],
      'answer': 'NÃO',
      'icon': Icons.water_drop,
      'explanation': {
        'NÃO': 'É tão óbvia que você até duvidou de si mesmo, né? kkk 💧',
        'default': 'MEU DEUS, você é mais burro do que pensei! 🛇'
      }
    },
    {
      'question': 'No dia 7 de setembro, nós comemoramos a independência do Brasil. Em Portugal também existe 7 de setembro?',
      'options': ['Sim', 'Não', 'Só no Brasil', 'Depende do ano'],
      'answer': 'Sim',
      'icon': Icons.flag,
      'explanation': {
        'Sim': 'Claro que sim! Lá também tem calendário, né? 🤦‍♀️',
        'default': 'Ué... Portugal aboliu setembro agora? 😂'
      }
    },
    {
      'question': 'Quantos segundos tem 1 minuto?',
      'options': ['60', 'SIM', '1', 'Depende'],
      'answer': '60',
      'icon': Icons.timer,
      'explanation': {
        '60': 'Ufa, pelo menos essa você acertou. ⏱️',
        'default': 'Você trocou o cérebro por uma pedra, foi? ⌛'
      }
    },

    {
      'question': 'Qual destas opções é o número pi?',
      'options': ['2,71828', '3,14159', '1,414', '0,14159'],
      'answer': '3,14159',
      'icon': Icons.pie_chart,
      'explanation': {
        '3,14159': 'Correto! Agora você pode decorar tortas com conhecimento.',
        'default': 'Errado. Talvez você tenha confundido com o número de Euler ou a razão áurea.'
      }
    },
    {
      'question': 'O que a palavra "legend" significa em português?',
      'options': ['Legenda', 'Conto', 'História', 'Lenda', 'Legendário'],
      'answer': 'Lenda',
      'icon': Icons.translate,
      'explanation': {
        'Lenda': 'Boa! "Legend" é "Lenda" em português, cuidado com os falsos cognatos!',
        'default': 'Oops! "Legend" parece "legenda", mas significa "lenda". Quase!'
      }
    },

    {
      'question': 'Se você correr em volta de uma árvore a 10km/h, conseguirá se dar um tapa?',
      'options': ['SIM', 'NÃO'],
      'answer': 'SIM',
      'icon': Icons.run_circle,
      'explanation': {
        'SIM': 'Só se você for o Flash! 🤸‍♂️',
        'default': 'Finalmente alguém com senso de física! (ou não?)'
      }
    },
    {
      'question': 'O que é mais pesado: 1kg de algodão ou 1kg de ferro?',
      'options': ['Algodão', 'Ferro', 'Iguais', 'Depende do vento'],
      'answer': 'Iguais',
      'icon': Icons.scale,
      'explanation': {
        'Iguais': 'Achou que ia cair nessa, né? 1kg é 1kg, fera. ⚖️',
        'default': 'Não, algodão não pesa menos só porque é fofinho. 🙄'
      }
    },
    {
      'question': 'Você tem dois patos na frente de dois patos, dois atrás de dois e dois entre dois... quantos patos tem?',
      'options': ['2', '3', '4', '6'],
      'answer': '3',
      'icon': Icons.emoji_nature,
      'explanation': {
        '3': 'Sim, 3 patos. Faz o desenho mental que você entende. 🦆🦆🦆',
        'default': 'Tente de novo com galinhas da próxima vez. 🐔'
      }
    },
    // {
    //   'question': 'Qual a capital do Brasil?',
    //   'options': ['São Paulo', 'Brasília', 'Distrito Federal', 'Brasil'],
    //   'answer': 'Brasília',
    //   'icon': Icons.location_city,
    //   'explanation': {
    //     'Brasília': 'Graças a Deus você não colocou Rio de Janeiro. 🙌',
    //     'default': 'Volta pro ensino fundamental, irmão! 📚'
    //   }
    // },
    {
      'question': 'Qual é o resultado de 0 dividido por 0?',
      'options': ['0', '1', 'Infinito', 'Erro'],
      'answer': 'Erro',
      'icon': Icons.error,
      'explanation': {
        'Erro': 'Até a calculadora trava nessa. Deixa pra lá. 💥',
        'default': 'Você acabou de invocar o caos matemático. ☠️'
      }
    },
    {
      'question': 'Se você colocar um espelho na frente de outro espelho, o que acontece?',
      'options': ['Infinito', 'Nada', 'Explode', 'Vira um portal'],
      'answer': 'Infinito',
      'icon': Icons.cached,
      'explanation': {
        'Infinito': 'Você acaba vendo até sua alma. 👁️',
        'default': 'Só explode se você tiver medo de reflexo. 😅'
      }
    },
    {
      'question': 'Qual destas opções é o número pi?',
      'options': ['2,71828', '3,14159', '1,618', '0,14159'],
      'answer': '3,14159',
      'icon': Icons.pie_chart,
      'explanation': {
        '3,14159': 'Correto! Agora você pode decorar tortas com conhecimento.',
        'default': 'Errado. Talvez você tenha confundido com o número de Euler ou a razão áurea.'
      }
    },
    {
      'question': 'O que a palavra "legend" significa em português?',
      'options': ['Legenda', 'Conto', 'História', 'Lenda', 'Legendário'],
      'answer': 'Lenda',
      'icon': Icons.translate,
      'explanation': {
        'Lenda': 'Boa! "Legend" é "Lenda" em português, cuidado com os falsos cognatos!',
        'default': 'Oops! "Legend" parece "legenda", mas significa "lenda". Quase!'
      }
    },
    {
      'question': 'Quantos lados tem um cubo?',
      'options': ['6', '8', '4', '12'],
      'answer': '6',
      'icon': Icons.view_in_ar,
      'explanation': {
        '6': 'Isso! 6 lados: frente, trás, cima, baixo, esquerda, direita. ✨',
        'default': 'Isso é geometria de ensino básico, hein... 🫠'
      }
    },
     {
      'question': 'Se você jogar uma pedra azul no Mar Vermelho, o que acontece?',
      'options': ['Ela afunda', 'Ela boia', 'Ela muda de cor', 'Ela evapora'],
      'answer': 'Ela afunda',
      'icon': Icons.water,
      'explanation': {
        'Ela afunda': 'Claro! A cor do mar não muda a gravidade, né?',
        'default': 'Errado! A pedra afunda como em qualquer outro lugar.'
      }
    },
    {
      'question': 'Qual o nome do planeta mais próximo do Sol?',
      'options': ['Vênus', 'Terra', 'Marte', 'Mercúrio'],
      'answer': 'Mercúrio',
      'icon': Icons.wb_sunny,
      'explanation': {
        'Mercúrio': 'Mercúrio é o velocista do sistema solar. ☀️',
        'default': 'Não, a Terra não é o centro do universo. Ainda. 🌍'
      }
    },
    {
      'question': 'O que é o número primo?',
      'options': ['Número par', 'Número com só 2 divisores', 'Número com 3 dígitos', 'Número mágico'],
      'answer': 'Número com só 2 divisores',
      'icon': Icons.calculate,
      'explanation': {
        'Número com só 2 divisores': 'Acertou! Matematicamente correto. 📊',
        'default': 'Tente usar a lógica e menos Harry Potter. 🧠'
      }
    },
    {
      'question': 'Quantos meses têm exatamente 30 dias?',
      'options': ['4', '5', '6', 'Todos'],
      'answer': '4',
      'icon': Icons.calendar_today,
      'explanation': {
        '4': 'Abril, junho, setembro e novembro. Pegadinha light. 📅',
        'default': 'Nem todos têm 30 dias, campeão. 😏'
      }
    },
    {
      'question': 'Se um avião cai bem na divisa entre dois países, onde enterram os sobreviventes?',
      'options': ['País A', 'País B', 'Na divisa', 'Não se enterra'],
      'answer': 'Não se enterra',
      'icon': Icons.airplanemode_active,
      'explanation': {
        'Não se enterra': 'Sobrevivente não se enterra, meu anjo! 😂',
        'default': 'Enterrar VIVO? Oxi! 😳'
      }
    },
     {
      'question': 'Qual o plural de “ônibus”?',
      'options': ['Ônibus', 'Ônibuses', 'Ônibusos', 'Ônibi'],
      'answer': 'Ônibus',
      'icon': Icons.directions_bus,
      'explanation': {
        'Ônibus': 'É igual no singular. Pegadinha da gramática! 🚌',
        'default': 'Não inventa plural, hein?'
      }
    },
     {
      'question': 'Qual o resultado de 2 + 2 × 2?',
      'options': ['6', '8', '4', '10'],
      'answer': '6',
      'icon': Icons.calculate,
      'explanation': {
        '6': 'Multiplicação vem antes da soma: 2 + (2×2) = 6.',
        'default': 'Caiu na tentação da ordem errada?'
      }
    },
    {
      'question': 'Qual desses é um número primo?',
      'options': ['7', '9', '15', '21'],
      'answer': '7',
      'icon': Icons.filter_7,
      'explanation': {
        '7': 'Sim! Só é divisível por 1 e por ele mesmo.',
        'default': 'Número primo é mais raro do que parece.'
      }
    },
     {
      'question': 'Se você está em uma corrida e ultrapassa o segundo colocado, em que posição você fica?',
      'options': ['Segundo', 'Primeiro', 'Terceiro', 'Quarto'],
      'answer': 'Segundo',
      'icon': Icons.directions_run,
      'explanation': {
        'Segundo': 'Você ocupou o lugar do segundo. Não é mágica!',
        'default': 'Tem que pensar em como ultrapassagem funciona!'
      }
    },
    {
      'question': 'Qual dessas palavras está escrita corretamente?',
      'options': ['Excessão', 'Exceção', 'Exeção', 'Exceçãon'],
      'answer': 'Exceção',
      'icon': Icons.edit,
      'explanation': {
        'Exceção': 'Português com orgulho!',
        'default': 'Quase acertou... ou não!'
      }
    },
     {
      'question': 'Qual é o contrário do contrário do certo?',
      'options': ['Errado', 'Confuso', 'Certo', 'Inverso'],
      'answer': 'Certo',
      'icon': Icons.sync,
      'explanation': {
        'Certo': 'Exato! Duas negações voltam à afirmação.',
        'default': 'Errado! O contrário do contrário é o próprio.'
      }
     }  
  ];

  void _answerQuestion(String option) {
    final current = _questions[_questionIndex];
    final correct = option == current['answer'];
    final explanation = current['explanation'][option] ??
        current['explanation']['default'] ??
        '🤷';

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(correct ? 'Acertou!' : 'Errou!'),
        content: Text(explanation),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                if (correct) _score++;
                results.add(correct ? '✅' : '❌');
                _questionIndex++;
              });
            },
            child: Text('Próxima'),
          ),
        ],
      ),
    );
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
      results = [];
      _showDontClick = true;
    });
  }

  void _handleDontClick() {
    setState(() {
      _showDontClick = false;
    });
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Você clicou!'),
        content: Text('Era pra não clicar! 🤦‍♂️'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Ok, fui burro mesmo'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final current = _questionIndex < _questions.length ? _questions[_questionIndex] : null;

    return Scaffold(
      floatingActionButton: _showDontClick
          ? FloatingActionButton.extended(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              onPressed: _handleDontClick,
              label: Text('NÃO CLIQUE AQUI'),
              icon: Icon(Icons.block),
            )
          : null,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: current != null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(current['icon'], size: 60, color: Colors.black),
                      SizedBox(height: 20),
                      Text('Pergunta ${_questionIndex + 1}/${_questions.length}',
                          style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      Text(current['question'],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                      SizedBox(height: 30),
                      ...current['options'].map<Widget>((opt) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: OutlinedButton(
                              onPressed: () => _answerQuestion(opt),
                              child: Text(opt, style: TextStyle(fontSize: 16)),
                            ),
                          )),
                      SizedBox(height: 20),
                      Text('Progresso: ${results.join(" ")}'),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.emoji_events, size: 80, color: Colors.amber),
                      SizedBox(height: 20),
                      Text('Você acertou $_score de ${_questions.length}!',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text(
                          () {
                            int errors = _questions.length - _score;

                            if (_score == _questions.length || errors < 3) {
                              return "🧠 Gênio disfarçado de tonto!";
                            } else if (errors >= 20) {
                              return "🤯 Você é 70% burro. Burro nível Hard!";
                            } else if (errors >= 15) {
                              return "😬 Você é 50% burro, ou seja, só meio burro!";
                            } else if (errors >= 11 ) {
                              return "😅 Você é só 25% burro. Um burro moderado, se orgulhe.";
                            } else {
                              return "🎉 Você tem entre 5% a 10% de burrice. Meus parabéns, você é quase um pré-inteligente!";
                            }
                          }(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _restartQuiz,
                        child: Text('Tentar novamente'),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
