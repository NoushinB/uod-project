abstract class NetworkPath {
  // Hosts
  static const String _host = "http://116.202.131.209:3119/api/v1";
  static const String _identityHost = "https://uod-ids.awrosoft.com";

  // Main APIs
  static String findEmployeeById() => "$_host/employees/details";

  static String confirmAttendance(String eventCode) => "$_host/applies/attendance/confirm/$eventCode";

  static String eventDetail(String eventCode) => "$_host/activity/detail/bycode/$eventCode";

  // Identity APIs
  static const String token = "$_identityHost/connect/token";
  static const String forgotPasswordUrl = "$_identityHost/Account/ForgotPassword";

  // Files
  static const String defaultAvatarUrl = "https://i.postimg.cc/ZRs6MP86/7cc7a630624d20f7797cb4c8e93c09c1.png";
  static const String attendanceImageUrl = "https://i.postimg.cc/dtH43t6V/poor-attendance-at-work-2d-isolated-illustration-employee-late-to-office-absent-worker-angry-boss-fl.jpg";
}
