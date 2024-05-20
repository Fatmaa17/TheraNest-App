import 'dart:typed_data';

class ServiceModel {
  int? id;
  Uint8List? image;
  String? name, specialty;
  double? sessionPrice;
  int? experienceYears,activity;
  List<String>? languages, fields;

  ServiceModel.fromJson(Map<String, dynamic> m) {
    id = m['id']; // Cast the value to int?
    image = m['image'];
    name = m['name'];
    specialty = m['specialty'];
    sessionPrice = m['sessionPrice']; // Corrected key name
    experienceYears = m['experienceYears']; // Corrected key name
    languages = (m['languages'] as String?)
        ?.split(','); // Convert comma-separated string to list
    fields = (m['fields'] as String?) 
        ?.split(','); // Convert comma-separated string to list
     activity =m['activity'];
  }
}
