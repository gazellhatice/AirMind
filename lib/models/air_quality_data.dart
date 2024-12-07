class AirQualityData {
  final String id;
  final String location;
  final int aqi; // Air Quality Index
  final double pm25; // Particulate Matter 2.5
  final double pm10; // Particulate Matter 10
  final DateTime timestamp;

  AirQualityData({
    required this.id,
    required this.location,
    required this.aqi,
    required this.pm25,
    required this.pm10,
    required this.timestamp,
  });

  factory AirQualityData.fromJson(Map<String, dynamic> json) {
    return AirQualityData(
      id: json['id'],
      location: json['location'],
      aqi: json['aqi'],
      pm25: json['pm25'],
      pm10: json['pm10'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location': location,
      'aqi': aqi,
      'pm25': pm25,
      'pm10': pm10,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
