class MeasurementRecord {
  final String id;
  final String location;
  final DateTime timestamp;
  final double value;

  MeasurementRecord({
    required this.id,
    required this.location,
    required this.timestamp,
    required this.value,
  });

  factory MeasurementRecord.fromJson(Map<String, dynamic> json) {
    return MeasurementRecord(
      id: json['id'],
      location: json['location'],
      timestamp: DateTime.parse(json['timestamp']),
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location': location,
      'timestamp': timestamp.toIso8601String(),
      'value': value,
    };
  }
}
