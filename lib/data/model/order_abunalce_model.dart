class OrderAmbunlaceModel {
  late String? fullname;
  late String? phone;
  late int? serviceid;
  late int? fitnessstatusid;
  late int? sectorid;
  late String? location;
  late String? appointmentdate;
  late String? appointmenttime;
  late String? late;
  late String? long;
  late String? message;
  OrderAmbunlaceModel(
      {required this.fullname,
      required this.phone,
      required this.sectorid,
      required this.serviceid,
      required this.fitnessstatusid,
      required this.location,
      required this.late,
      required this.long,
      required this.appointmentdate,
      required this.appointmenttime,
      required this.message,
      });
  factory OrderAmbunlaceModel.fromJson(Map<String, dynamic> json) {
    return OrderAmbunlaceModel(
        fullname: json['full_name'],
        phone: json['phone'],
        serviceid: json['service_id'],
        fitnessstatusid: json['fitness_status_id'],
        sectorid: json['sector_id'],
        location: json['location'],
        late: json['lat'],
        long: json['long'],
        appointmentdate: json['appointment_date'],
        appointmenttime: json['appointment_time'],
        message: json['message']);
  }
}
