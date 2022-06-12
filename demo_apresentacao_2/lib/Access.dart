class Access{
  final int horario;
  final String operador;
  final String medicamento;
  final String gifPath;

  Access(this.horario, this.operador, this.medicamento, this.gifPath);

  static Access fromJson(Map<String, dynamic> json) => Access(
    json['Horario'],
    json['Operador'],
    json['Medicamento'],
    json['Gif']
  );

}