class UnprocessedEntity implements Exception{

  @override
  String toString() {
    return "Missing fields";
  }
}

class LoginFailed implements Exception{

  @override
  String toString() {
    return 'Credentials rejected';
  }
}

class NoInternetConnection implements Exception{
  @override
  String toString() {
    return 'No internet available !!!!! ';
  }
}

class RedirectionFound implements Exception{

  @override
  String toString() {
    return "Too Many redirections";
  }
}



class ResourceNotFound implements Exception{
  String message;
  ResourceNotFound(this.message);
  @override
  String toString() {
    return "Resource ${this.message} Not  found!!!";
  }
}

class PropertyRequired implements Exception {
  String field;

  PropertyRequired(this.field);

  @override
  String toString() {
    return 'The property ${this.field} is required ';
  }
}