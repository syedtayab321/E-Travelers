class VisaDataModel {
  String? id;                  // Visa ID
  String? applicantName;        // Applicant Name
  String? passportNumber;       // Passport Number
  String? nationality;          // Nationality
  String? visaType;             // Visa Type (e.g., Tourist, Work, Student)
  String? issuingCountry;       // Country Issuing Visa
  String? destinationCountry;   // Destination Country
  String? issueDate;            // Visa Issue Date
  String? expiryDate;           // Visa Expiry Date
  String? status;               // Visa Status (e.g., Approved, Pending, Rejected)
  String? processingTime;       // Processing Time (e.g., 7 Days)
  String? remarks;              // Admin Remarks
  String? contactNumber;        // Contact Number of Applicant
  String? email;                // Applicant Email
  String? supportingDocuments;  // Document URL (Optional)
  String? visaFee;              // Visa Fee (e.g., 100 USD)
  String? currency;             // Currency Type (e.g., USD, PKR)

  VisaDataModel({
    this.id,
    this.applicantName,
    this.passportNumber,
    this.nationality,
    this.visaType,
    this.issuingCountry,
    this.destinationCountry,
    this.issueDate,
    this.expiryDate,
    this.status,
    this.processingTime,
    this.remarks,
    this.contactNumber,
    this.email,
    this.supportingDocuments,
    this.visaFee,
    this.currency,
  });

  // Convert JSON to Model
  factory VisaDataModel.fromJson(Map<String, dynamic> json) {
    return VisaDataModel(
      id: json['id'] ?? '',
      applicantName: json['applicantName'] ?? '',
      passportNumber: json['passportNumber'] ?? '',
      nationality: json['nationality'] ?? '',
      visaType: json['visaType'] ?? '',
      issuingCountry: json['issuingCountry'] ?? '',
      destinationCountry: json['destinationCountry'] ?? '',
      issueDate: json['issueDate'] ?? '',
      expiryDate: json['expiryDate'] ?? '',
      status: json['status'] ?? '',
      processingTime: json['processingTime'] ?? '',
      remarks: json['remarks'] ?? '',
      contactNumber: json['contactNumber'] ?? '',
      email: json['email'] ?? '',
      supportingDocuments: json['supportingDocuments'] ?? '',
      visaFee: json['visaFee'] ?? '',
      currency: json['currency'] ?? '',
    );
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "applicantName": applicantName,
      "passportNumber": passportNumber,
      "nationality": nationality,
      "visaType": visaType,
      "issuingCountry": issuingCountry,
      "destinationCountry": destinationCountry,
      "issueDate": issueDate,
      "expiryDate": expiryDate,
      "status": status,
      "processingTime": processingTime,
      "remarks": remarks,
      "contactNumber": contactNumber,
      "email": email,
      "supportingDocuments": supportingDocuments,
      "visaFee": visaFee,
      "currency": currency,
    };
  }
}
