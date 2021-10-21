class AuthenticatedUser {
  const AuthenticatedUser({
    required this.displayName,
    required this.email,
    required this.uid,
  });

  final String displayName;
  final String email;
  final String uid;

  @override
  String toString() {
    return 'displayName $displayName, email $email, uid $uid';
  }
}
