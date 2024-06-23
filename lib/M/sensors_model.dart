class SensorData {
  final Gassensor gassensor;
  final Watersensor watersensor;
  final Ldesensor ldesensor;
  final int electst;

  SensorData({
    required this.gassensor,
    required this.watersensor,
    required this.ldesensor,
    required this.electst,
  });

  factory SensorData.fromJson(Map<dynamic, dynamic> json) {
    return SensorData(
      gassensor: Gassensor.fromJson(json['Gassensor']),
      watersensor: Watersensor.fromJson(json['Watersensor']),
      ldesensor: Ldesensor.fromJson(json['ldesensor']),
      electst: json['electst'],
    );
  }
}

class Gassensor {
  final String gasmessage;
  final int gasvalue;

  Gassensor({required this.gasmessage, required this.gasvalue});

  factory Gassensor.fromJson(Map<dynamic, dynamic> json) {
    return Gassensor(
      gasmessage: json['gasmessage'],
      gasvalue: json['gasvalue'],
    );
  }
}

class Watersensor {
  final int watervalu;
  final String serstat;

  Watersensor({required this.watervalu, required this.serstat});

  factory Watersensor.fromJson(Map<dynamic, dynamic> json) {
    return Watersensor(
      watervalu: json['watervalu'],
      serstat: json['serstat'],
    );
  }
}

class Ldesensor {
  final String ldrmes;
  final int ldrvalu;

  Ldesensor({required this.ldrmes, required this.ldrvalu});

  factory Ldesensor.fromJson(Map<dynamic, dynamic> json) {
    return Ldesensor(
      ldrmes: json['ldrmes'],
      ldrvalu: json['ldrvalu'],
    );
  }
}
