import 'package:cloud_firestore/cloud_firestore.dart';

class VisaSearchModel {
  String nationality;
  String destinationCountry;
  DateTime travelDate;
  String visaType;

  VisaSearchModel({
    required this.nationality,
    required this.destinationCountry,
    required this.travelDate,
    required this.visaType,
  });

  // Convert Model to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'nationality': nationality,
      'destinationCountry': destinationCountry,
      'travelDate': travelDate.toIso8601String(),
      'visaType': visaType,
    };
  }

  // Factory method to create a model from Firestore snapshot
  factory VisaSearchModel.fromMap(Map<String, dynamic> map) {
    return VisaSearchModel(
      nationality: map['nationality'] ?? '',
      destinationCountry: map['destinationCountry'] ?? '',
      travelDate: DateTime.parse(map['travelDate'] ?? DateTime.now().toIso8601String()),
      visaType: map['visaType'] ?? '',
    );
  }
}
