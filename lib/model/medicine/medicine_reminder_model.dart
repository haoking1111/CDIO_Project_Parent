class MedicineReminder {
  int? id;
  String? comment;
  String? currentStatus;
  int? childId;
  List<int>? createdDate;
  List<int>? updatedDate;

  MedicineReminder({
    this.id,
    this.comment,
    this.currentStatus,
    this.childId,
    this.createdDate,
    this.updatedDate,
  });

  factory MedicineReminder.fromJson(Map<String, dynamic> json) {
    return MedicineReminder(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      comment: json['comment'],
      currentStatus: json['currentStatus'] ,
      childId: json['childId'] is String ? int.parse(json['childId']) : json['childId'],
      createdDate: json['createdDate'] is String ? int.parse(json['createdDate']) : json['createdDate'],
      updatedDate: json['updatedDate']is String ? int.parse(json['createdDate']) : json['createdDate'],
    );
  }
}

// ou're absolutely right. The error message indicates a mismatch between the data type you're trying to assign and the expected type in your MedicineReminder model.
//
// In the provided code, you're creating a DateTime object from the createdDate list in the JSON data and assigning it to the createdDate property of the MedicineReminder model. However, the createdDate property is defined as a List<int> (list of integers).
//
// Here's how to fix the issue:
//
// Remove the createdDate property from MedicineReminder:
// Since the API is returning individual year, month, day, etc. components, there's no need to store them as a list within the model. You can directly have separate properties for each component.
//
// Dart
// class MedicineReminder {
//   int? id;
//   String? comment;
//   String? currentStatus;
//   int? childId;
//   int? createdYear; // New property for year
//   int? createdMonth; // New property for month
// // ... other properties
// }
// Hãy thận trọng khi sử dụng các đoạn mã.
// content_copy
// Update MedicineReminder.fromJson:
// Instead of creating a DateTime object and assigning it to the createdDate property, extract the individual components from the createdDate list and assign them to the newly added properties:
//
// Dart
// factory MedicineReminder.fromJson(Map<String, dynamic> json) {
// return MedicineReminder(
// id: json['id'] is String ? int.parse(json['id']) : json['id'],
// comment: json['comment'],
// currentStatus: json['currentStatus'] ,
// childId: json['childId'] is String ? int.parse(json['childId']) : json['childId'],
// createdYear: json['createdDate'][0] as int,
// createdMonth: json['createdDate'][1] as int,
// // ... other properties
// );
// }
// Hãy thận trọng khi sử dụng các đoạn mã.
// content_copy
// With these changes, the code will correctly parse the createdDate data and populate the individual properties in your MedicineReminder model.