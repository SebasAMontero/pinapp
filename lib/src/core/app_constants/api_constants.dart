class ApiConstants {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String endpointPosts = '/posts';
  static String endpointComments(int postId) => '/comments?postId=$postId';
  static const int postsPerPage = 10;
}
