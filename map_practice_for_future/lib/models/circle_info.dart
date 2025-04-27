class CircleInfo {
  final String id;
  final String fillColor;
  final double fillOpacity;
  final double centerLat;
  final double centerLng;
  final double radius;
  final String strokeColor;
  final int strokeWidth;

  CircleInfo({required this.id,
    required this.fillColor,
    required this.fillOpacity,
    required this.centerLat,
    required this.centerLng,
    required this.radius,
    required this.strokeColor,
    required this.strokeWidth});


  factory CircleInfo.fromJson(Map<String, dynamic> json) {
    return CircleInfo(
      id: json['id'],
      fillColor: json['fillColor'],
      fillOpacity: (json['fillOpacity'] ?? 0.5).toDouble(),
      centerLat: json['centerLat'].toDouble(),
      centerLng: json['centerLng'].toDouble(),
      radius: json['radius'].toDouble(),
      strokeColor: json['strokeColor'],
      strokeWidth: json['strokeWidth'],
    );
  }
}