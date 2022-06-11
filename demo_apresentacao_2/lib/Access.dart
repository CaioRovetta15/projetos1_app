class Access{
  final int horario;
  final String operador;
  final String medicamento;

  Access(this.horario, this.operador, this.medicamento);

  static Access fromJson(Map<String, dynamic> json) => Access(
    json['Horario'],
    json['Operador'],
    json['Medicamento']
  );

}