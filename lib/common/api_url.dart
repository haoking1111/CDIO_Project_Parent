class ApiUrl {
  static const apiUrl ='http://192.168.50.210:8080';
  static const authUrl = '$apiUrl/api/auth/login';
  static const getParentUrl = '$apiUrl/api/user';
  static const getTeacherUrl = '$apiUrl/api/user';
  static const getChildUrl = '$apiUrl/api/children/parent';
  static const getClassById = '$apiUrl/api/classroom';
  static const getMedicineReminder = '$apiUrl/api/medicine-reminder/children';
  static const updateParentInfUrl = '$apiUrl/api/user';
  static const addMedicineReminderUrl = '$apiUrl/api/medicine-reminder';
  static const deleteMedicineReminderUrl = '$apiUrl/api/medicine-reminder';
  static const getNotificationUrl = '$apiUrl/api/notification';
  static const getAllMessageUrl = '$apiUrl/api/message';
  static const creatMessageUrl = '$apiUrl/api/message';
}