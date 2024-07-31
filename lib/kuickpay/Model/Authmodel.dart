class AuthResponse {
  String responseCode;
  String institutionId;
  String authToken;
  int expiry;

  AuthResponse({
    required this.responseCode,
    required this.institutionId,
    required this.authToken,
    required this.expiry,
  });

  // Factory method to create an instance of AuthResponse from JSON
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      responseCode: json['responseCode'],
      institutionId: json['institutionId'],
      authToken: json['auth_token'],
      expiry: json['expiry'],
    );
  }

  // Method to convert an AuthResponse instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'responseCode': responseCode,
      'institutionId': institutionId,
      'auth_token': authToken,
      'expiry': expiry,
    };
  }
}
