class Manufacturer {
  final String country;
  final String? commonName;
  final int id;
  final String name;
  final List<VehicleType> vehicleTypes;

  Manufacturer({
    required this.country,
    required this.commonName,
    required this.id,
    required this.name,
    required this.vehicleTypes,
  });

  factory Manufacturer.fromJson(Map<String, dynamic> json) {
    final vehicleTypesList = json['VehicleTypes'] as List<dynamic>;
    final List<VehicleType> vehicleTypes = vehicleTypesList
        .map((type) => VehicleType.fromJson(type as Map<String, dynamic>))
        .toList();

    return Manufacturer(
      country: json['Country'] as String,
      commonName: json['Mfr_CommonName'] as String? ?? '',
      id: json['Mfr_ID'] as int,
      name: json['Mfr_Name'] as String,
      vehicleTypes: vehicleTypes,
    );
  }
}

class VehicleType {
  final bool isPrimary;
  final String name;

  VehicleType({
    required this.isPrimary,
    required this.name,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) {
    return VehicleType(
      isPrimary: json['IsPrimary'] as bool,
      name: json['Name'] as String,
    );
  }
}
