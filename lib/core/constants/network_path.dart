abstract class NetworkPath {
  // Hosts
  static const String _host = "http://116.202.131.209:3119/api/v1";
  static const String _identityHost = "http://uod-ids.awrosoft.com";

  // Main APIs
  static String findEmployeeById(String id) => "$_host/employees/details/$id";

  static String confirmAttendance(String eventCode) => "$_host/applies/attendance/confirm/$eventCode";

  // Identity APIs
  static const String token = "$_identityHost/connect/token";
}
