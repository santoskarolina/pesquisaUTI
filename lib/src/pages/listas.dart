import 'package:pacienteneuro/src/pages/models.dart';

late List<Perguntas> perguntasPrincipais = [
  Perguntas(
      'Exame da Pele = lesões cutâneas (petéquias, equimoses, hematomas, ferimentos, telangiectasias, exantemas):',
      false,
      [PerguntasBool('Presentes', false), PerguntasBool('Ausentes', false)]),
  Perguntas('Respiração', false, [
    PerguntasBool('Respira em ar ambiente', false),
    PerguntasBool(
        'Respira em ar ambiente e em uso de O2 (cateter nasal ou máscara)',
        false),
    PerguntasBool('Entubado com ventilação mecânica', false),
    PerguntasBool('Traqueostomizado com ventilação mecânica', false)
  ]),
  Perguntas('Distúrbios hemodinâmicos', false, [
    PerguntasBool('Presentes', false),
    PerguntasBool('Ausentes', false),
  ]),
  Perguntas('Febre', false, [
    PerguntasBool('Presentes', false),
    PerguntasBool('Ausentes', false),
  ]),
  Perguntas('Conteúdo da consciência (Perceptividade)', false, [
    PerguntasBool('Executa ordem escrita', false),
    PerguntasBool('Orientado no tempo e no espaço', false),
    PerguntasBool('Executa ordem verbal', false),
    PerguntasBool('Reação de piscamento à ameaça', false),
  ]),
  Perguntas('Crises convulsivas', false, [
    PerguntasBool('Presentes', false),
    PerguntasBool('Ausentes', false),
  ]),
  Perguntas('Movimentos involuntários (mioclonias, tremores)', false, [
    PerguntasBool('Presentes', false),
    PerguntasBool('Ausentes', false),
  ]),
  Perguntas('Alterações Sistêmicas', false, [
    PerguntasBool('Presentes', false),
    PerguntasBool('Ausentes', false),
  ]),
  Perguntas('Rigidez da nuca', false, [
    PerguntasBool('Presentes', false),
    PerguntasBool('Ausentes', false),
  ]),
  Perguntas('Sinais de irritação menígena', false, [
    PerguntasBool('Presentes', false),
    PerguntasBool('Ausentes', false),
  ]),
  Perguntas('Motricidade (Déficits motores nos membros)', false, [
    PerguntasBool('Tetraplegia ou tetraparesia', false),
    PerguntasBool('Triplegia ou triparesia', false),
    PerguntasBool('Paraplegia ou paraparesia', false),
    PerguntasBool('Sem déficits motores', false),
  ]),
  Perguntas('Comprometimento de nervos cranianos', false, [
    PerguntasBool('Múltiplos nervos', false),
    PerguntasBool('Bilateral', false),
    PerguntasBool('Único nervo', false),
    PerguntasBool('Nenhum nervo', false)
  ]),
  Perguntas('Motricidade Ocular (extrínseca e intrínseca)', false, [
    PerguntasBool('Alteração de tamanho das pupilas', false),
    PerguntasBool('Alteração de reflexos fotomotores', false),
    PerguntasBool('Paralisia ocular extrínseca', false),
    PerguntasBool('Sem alterações  intrínsecas nem extrísecas', false),
  ]),
  Perguntas(
      'Reflexos de tronco (Reflexo óculo-cefálico (olho de boneca) e óculo-vestibular (prova calórica).',
      false, [
    PerguntasBool('Presentes', false),
    PerguntasBool('Ausentes', false),
  ]),
  Perguntas('Reflexos córneo-palpebrais', false, [
    PerguntasBool('Presentes', false),
    PerguntasBool('Ausentes', false),
  ]),
];

List<LeitoPaciente> leitosDisponiveis = [
  LeitoPaciente(leitoId: 1, status: 'ATIVO'),
  LeitoPaciente(leitoId: 2, status: 'INATIVO'),
  LeitoPaciente(leitoId: 3, status: 'ATIVO'),
  LeitoPaciente(leitoId: 4, status: 'ATIVO'),
  LeitoPaciente(leitoId: 5, status: 'ATIVO'),
];

late List<Perguntas> perguntasPaciente1 = [
  Perguntas(
      'Exame da Pele – lesões cutâneas (petéquias, equimoses, hematomas, ferimentos, telangiectasias, exantemas):',
      true,
      [PerguntasBool('Presentes', true), PerguntasBool('Ausentes', false)]),
  Perguntas('Respiração', true, [
    PerguntasBool('Respira em ar ambiente', true),
    PerguntasBool(
        'Respira em ar ambiente e em uso de O2 (cateter nasal ou máscara)',
        false),
    PerguntasBool('Entubado com ventilação mecânica', false),
    PerguntasBool('Traqueostomizado com ventilação mecânica', false)
  ]),
  Perguntas('Distúrbios hemodinâmicos', false, [
    PerguntasBool('Presentes', false),
    PerguntasBool('Ausentes', true),
  ]),
  Perguntas('Febre', false, [
    PerguntasBool('Presentes', false),
    PerguntasBool('Ausentes', true),
  ]),
  Perguntas('Conteúdo da consciência (Perceptividade)', false, [
    PerguntasBool('Executa ordem escrita', false),
    PerguntasBool('Orientado no tempo e no espaço', true),
    PerguntasBool('Executa ordem verbal', false),
    PerguntasBool('Reação de piscamento à ameaça', false),
  ]),
  Perguntas('Crises convulsivas', false, [
    PerguntasBool('Presentes', false),
    PerguntasBool('Ausentes', true),
  ]),
  Perguntas('Movimentos involuntários (mioclonias, tremores)', false, [
    PerguntasBool('Presentes', true),
    PerguntasBool('Ausentes', false),
  ]),
  Perguntas('Alterações Sistêmicas', false, [
    PerguntasBool('Presentes', true),
    PerguntasBool('Ausentes', false),
  ]),
  Perguntas('Rigidez da nuca', false, [
    PerguntasBool('Presentes', true),
    PerguntasBool('Ausentes', false),
  ]),
  Perguntas('Sinais de irritação menígena', false, [
    PerguntasBool('Presentes', false),
    PerguntasBool('Ausentes', true),
  ]),
  Perguntas('Motricidade (Déficits motores nos membros)', false, [
    PerguntasBool('Tetraplegia ou tetraparesia', false),
    PerguntasBool('Triplegia ou triparesia', true),
    PerguntasBool('Paraplegia ou paraparesia', false),
    PerguntasBool('Sem déficits motores', false),
  ]),
  Perguntas('Comprometimento de nervos cranianos', false, [
    PerguntasBool('Múltiplos nervos', false),
    PerguntasBool('Bilateral', true),
    PerguntasBool('Único nervo', false),
    PerguntasBool('Nenhum nervo', false)
  ]),
  Perguntas('Motricidade Ocular (extrínseca e intrínseca)', false, [
    PerguntasBool('Alteração de tamanho das pupilas', true),
    PerguntasBool('Alteração de reflexos fotomotores', false),
    PerguntasBool('Paralisia ocular extrínseca', false),
    PerguntasBool('Sem alterações  intrínsecas nem extrísecas', false),
  ]),
  Perguntas(
      'Reflexos de tronco (Reflexo óculo-cefálico (olho de boneca) e óculo-vestibular (prova calórica).',
      false, [
    PerguntasBool('Presentes', true),
    PerguntasBool('Ausentes', false),
  ]),
  Perguntas('Reflexos córneo-palpebrais', false, [
    PerguntasBool('Presentes', true),
    PerguntasBool('Ausentes', false),
  ]),
];

late List<Paciente> pacientesTodos = [
  Paciente(
      paciente_id: 2,
      nome: 'Ana Karolina',
      dataNascimento:  '2022-10-29',
      sexo: 'FEMININO',
      avaliacaoPaciente: AvaliacaoPaciente(1, '2022-10-29T13:35:57.007Z', perguntasPaciente1),
      leitos: [LeitoPaciente(leitoId: 1, status: 'ATIVO'), LeitoPaciente(leitoId: 2, status: 'ATIVO')]),
  Paciente(
      paciente_id: 2,
      nome: 'Edilson',
      dataNascimento:  '2022-10-29',
      sexo: 'FEMININO',
      avaliacaoPaciente: AvaliacaoPaciente(1, '2022-10-29T13:35:57.007Z', perguntasPaciente1),
      leitos: [LeitoPaciente(leitoId: 1, status: 'ATIVO')]),
];
