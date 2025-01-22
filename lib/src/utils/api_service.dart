import 'package:get/get.dart';

class ApiService extends GetConnect {
  // Base URL for your API
  @override
  void onInit() {
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com'; // Example base URL
  }

  // GET request
  Future<Response> fetchPosts() => get('/posts');

  // POST request
  Future<Response> createPost(Map<String, dynamic> data) => post('/posts', data);

  // PUT request
  Future<Response> updatePost(int id, Map<String, dynamic> data) =>
      put('/posts/$id', data);

  // DELETE request
  Future<Response> deletePost(int id) => delete('/posts/$id');
}
