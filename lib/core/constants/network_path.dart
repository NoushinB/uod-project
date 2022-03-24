abstract class NetworkPath {
  // Hosts
  static const String _host = "http://XYZ.com";
  static const String _identityHost = "http://server.ibazzar.net";

  // Main APIs
  static String findTeacherById(int id) => "$_host/GetTeacher?id=$id";
  static String getSpecialPlans(int posterId)=> "$_identityHost/api/ibazar/plans?posterId=$posterId";

  // Identity APIs
  static const String token = "$_identityHost/connect/token";
}
