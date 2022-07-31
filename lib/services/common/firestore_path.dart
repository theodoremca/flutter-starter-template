class FirestorePath {
  static String users = 'User';
  static String user(String uid) => '$users/$uid';

  static String categories = 'Category';
  static String category(String categoryId) => '$categories/$categoryId';

  static String resources = 'Resource';
  static String resource(String resourceId) => '$resources/$resourceId';
}

