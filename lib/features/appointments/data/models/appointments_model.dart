class AppointmentsModel {
  final int numberTurn;
  final String typeAppointments;
  final String docName;
  final String data;
  final String time;
  final String? imageDoc;

  AppointmentsModel({
    required this.numberTurn,
    required this.typeAppointments,
    required this.docName,
    required this.data,
    required this.time,
    this.imageDoc,
  });
}
