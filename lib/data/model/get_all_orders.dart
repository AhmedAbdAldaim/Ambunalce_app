class Appointment {
  final dynamic id;
  final dynamic fullName;
  final dynamic phone;
  final dynamic location;
  final dynamic status;
  final dynamic destination;
  final dynamic medicalReport;
  final dynamic appointmentDate;
  final dynamic appointmentTime;
  final dynamic message;
  final dynamic statusName;
  final Service? service;
  final FitnessStatus? fitnessStatus;
  final Sector? sector;
 // final dynamic driver;
 // final Doctor? doctor;
  Appointment({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.location,
    required this.status,
    this.destination,
    this.medicalReport,
    required this.appointmentDate,
    required this.appointmentTime,
    this.message,
    required this.statusName,
    required this.service,
    required this.fitnessStatus,
    required this.sector,
   // required this.driver,
  //  required this.doctor,
  });

  factory Appointment.fromJson(dynamic json) {
    return Appointment(
      id: json['id'],
      fullName: json['full_name'],
      phone: json['phone'],
      location: json['location'],
      status: json['status'],
      destination: json['destination'],
      medicalReport: json['medical_report'],
      appointmentDate: json['appointment_date'],
      appointmentTime: json['appointment_time'],
      message: json['message'],
      statusName: json['status_name'],
      service: Service.fromJson(json['service']),
      fitnessStatus: FitnessStatus.fromJson(json['fitness_status']),
      sector: Sector.fromJson(json['sector']),
      //driver: json['driver'] ?? [],
      //doctor: json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null,
    );
  }
}

class Service {
  final int id;
  final String name;

  Service({required this.id, required this.name});

  factory Service.fromJson(dynamic json) {
    return Service(
      id: json['id'],
      name: json['name'],
    );
  }
}

class FitnessStatus {
  final int id;
  final dynamic name;

  FitnessStatus({required this.id, required this.name});

  factory FitnessStatus.fromJson(dynamic json) {
    return FitnessStatus(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Sector {
  final int id;
  final dynamic name;

  Sector({required this.id, required this.name});

  factory Sector.fromJson(dynamic json) {
    return Sector(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Doctor {
  final dynamic id;
  final dynamic name;
  final dynamic phone;

  Doctor({required this.id, required this.name, required this.phone});

  factory Doctor.fromJson(dynamic json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}
