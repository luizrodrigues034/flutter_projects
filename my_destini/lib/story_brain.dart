import './story.dart';

class StoryBrain {
  final List<Story> _storyData = [
    Story(
      storyTitle:
          'Seu carro furou um pneu em uma estrada sinuosa no meio do nada, sem sinal de celular. Você decide pedir carona. Uma caminhonete enferrujada para ao seu lado. Um homem com um chapéu de aba larga e olhos sem alma abre a porta do passageiro para você e pergunta: "Precisa de carona, garoto?".',
      choice1: 'Vou entrar. Obrigado pela ajuda!',
      choice2: 'É melhor perguntar se ele é um assassino primeiro.',
    ),
    Story(
      storyTitle:
          'Ele acena lentamente com a cabeça, inabalável pela pergunta.',
      choice1: 'Pelo menos ele é honesto. Vou entrar.',
      choice2: 'Espere, eu sei como trocar um pneu.',
    ),
    Story(
      storyTitle:
          'Ao começar a dirigir, o estranho começa a falar sobre seu relacionamento com a mãe. Ele fica cada vez mais irritado a cada minuto. Ele pede para você abrir o porta-luvas. Dentro você encontra uma faca ensanguentada, dois dedos decepados e uma fita cassete do Elton John. Ele estende a mão para o porta-luvas.',
      choice1: 'Adoro Elton John! Entregue a fita cassete para ele.',
      choice2: 'É ele ou eu! Você pega a faca e o esfaqueia.',
    ),
    Story(
      storyTitle:
          'O quê? Que desculpa esfarrapada! Você sabia que acidentes de trânsito são a segunda principal causa de morte acidental para a maioria dos grupos etários adultos?',
      choice1: 'Reiniciar',
      choice2: '',
    ),
    Story(
      storyTitle:
          'Enquanto você atravessa a grade de proteção e despenca em direção às rochas pontiagudas abaixo, você reflete sobre a duvidosa sabedoria de esfaquear alguém enquanto ele está dirigindo um carro em que você está.',
      choice1: 'Reiniciar',
      choice2: '',
    ),
    Story(
      storyTitle:
          'Você cria um laço com o assassino enquanto cantam versos de "Can you feel the love tonight". Ele te deixa na próxima cidade. Antes de você ir, ele pergunta se você conhece bons lugares para desovar corpos. Você responde: "Experimente o píer".',
      choice1: 'Reiniciar',
      choice2: '',
    ),
  ];
  int _storyNumber = 0;
  void nextStory(int choiceNumber) {
    if (_storyNumber == 0 && choiceNumber == 1) {
      _storyNumber = 2;
    } else if (_storyNumber == 2 && choiceNumber == 1) {
      _storyNumber = 5;
    } else if (_storyNumber == 2 && choiceNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber == 0 && choiceNumber == 2) {
      _storyNumber = 1;
    } else if (_storyNumber == 1 && choiceNumber == 1) {
      _storyNumber = 2;
    } else if (_storyNumber == 1 && choiceNumber == 2) {
      _storyNumber = 3;
    }
  }

  getTitleStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  int getActualStory() {
    return _storyNumber;
  }

  setRestart() {
    _storyNumber = 0;
  }
}
