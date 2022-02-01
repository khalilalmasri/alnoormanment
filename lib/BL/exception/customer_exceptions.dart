

class NotAuthenticatedException implements Exception {
  String message;
  NotAuthenticatedException(this.message);
}


class NoAcceptanceUserRoleException implements Exception {
  String errorMessage;
  NoAcceptanceUserRoleException(this.errorMessage);
}



