class VisaDetailsModel {
  String? country;
  String? details;
  String? duration;
  String? requirements;
  String? type;

  // Additional fields for API compatibility
  String? nationality;
  String? destinationCountry;
  DateTime? travelDate;
  String? visaType;
  String? processingTime;
  String? fees;
  String? entryRequirements;
  String? notes;

  VisaDetailsModel({
    this.country,
    this.details,
    this.duration,
    this.requirements,
    this.type,
    this.nationality,
    this.destinationCountry,
    this.travelDate,
    this.visaType,
    this.processingTime,
    this.fees,
    this.entryRequirements,
    this.notes,
  });

  // Convert Model to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'details': details,
      'duration': duration,
      'requirements': requirements,
      'type': type,
      'nationality': nationality,
      'destinationCountry': destinationCountry,
      'travelDate': travelDate?.toIso8601String(),
      'visaType': visaType,
      'processingTime': processingTime,
      'fees': fees,
      'entryRequirements': entryRequirements,
      'notes': notes,
    };
  }

  // Factory method to create a model from Firestore snapshot
  factory VisaDetailsModel.fromMap(Map<String, dynamic> map) {
    return VisaDetailsModel(
      country: map['country'],
      details: map['details'],
      duration: map['duration'],
      requirements: map['requirements'],
      type: map['type'],
      nationality: map['nationality'],
      destinationCountry: map['destinationCountry'],
      travelDate: map['travelDate'] != null ? DateTime.parse(map['travelDate']) : null,
      visaType: map['visaType'],
      processingTime: map['processingTime'],
      fees: map['fees'],
      entryRequirements: map['entryRequirements'],
      notes: map['notes'],
    );
  }
}