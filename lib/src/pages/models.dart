class Perguntas {
  late String titulo;
  late List<PerguntasBool> perguntas;
  late bool? valueCheck = false;
  Perguntas(this.titulo, this.valueCheck, this.perguntas, );
}

class PerguntasBool{
  late String titulo;
  late bool check;
  PerguntasBool(this.titulo, this.check);
}

class Paciente {
  int? paciente_id;
  String? nome;
  String? dataNascimento;
  String? sexo;
  late AvaliacaoPaciente? avaliacaoPaciente;
  List<LeitoPaciente>? leitos;

  Paciente({ this.paciente_id,
    this.nome,
    this.dataNascimento,
    this.sexo,
    this.avaliacaoPaciente,
    this.leitos});

  Paciente.fromJson(Map<dynamic, dynamic> json)
   : paciente_id= json['paciente_id'],
      nome= json['nome'],
      dataNascimento= json['dataNascimentoemail'],
      sexo= json['sexo'];

  Map toJson() {
    Map<String, dynamic> paciente = {
      'paciente_id': paciente_id,
      'nome':nome,
      'dataNascimento': dataNascimento,
      'sexo': sexo,
    };
    return paciente;
  }
}

class AvaliacaoPaciente {
  int avaliacaoId;
  String date;
  List<Perguntas> perguntas;
  AvaliacaoPaciente(this.avaliacaoId, this.date, this.perguntas);
}

class LeitoPaciente {
  int? leitoId;
  String? status;
  LeitoPaciente({this.leitoId, this.status});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'leitoId': leitoId,
      'status': status
    };
    return map;
  }

  factory LeitoPaciente.fromJson(Map<dynamic, dynamic> json) {
    return LeitoPaciente(
        leitoId: json["leitoId"],
        status: json["status"]
    );
  }
}

