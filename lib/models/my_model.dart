import 'dart:convert';

class MyModel {
  Apartment apartment;
}

class Apartment {
  int people;
  Device device;
}

class Device {
  Measurement measurement;
  Device({
     this.measurement,
  });

  Map<String, dynamic> toMap() {
    return {
      'measurement': measurement.toMap(),
    };
  }

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      measurement: Measurement.fromMap(map['measurement']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Device.fromJson(String source) => Device.fromMap(json.decode(source));
}

class Measurement {
  double consumption;
  double temp;
  double floowTime;
  double powerConsumption;
  String timeStamp;
  Measurement({
     this.consumption,
     this.temp,
     this.floowTime,
     this.powerConsumption,
     this.timeStamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'consumption': consumption,
      'temp': temp,
      'floowTime': floowTime,
      'powerConsumption': powerConsumption,
      'timeStamp': timeStamp,
    };
  }

  factory Measurement.fromMap(Map<String, dynamic> map) {
    return Measurement(
      consumption: map['consumption'],
      temp: map['temp'],
      floowTime: map['floowTime'],
      powerConsumption: map['powerConsumption'],
      timeStamp: map['timeStamp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Measurement.fromJson(String source) => Measurement.fromMap(json.decode(source));
}
