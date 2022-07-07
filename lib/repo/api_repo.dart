import 'package:bloc_api/model/post_model.dart';
import 'package:bloc_api/service/api_service.dart';

class ApiRepo {
  final ApiService apiService;

  ApiRepo({required this.apiService});

  Future<List<Post>?> getPostList() async {
    final response = await apiService.getPostData();
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((singlePost) => Post.fromJson(singlePost)).toList();
    }
  }
}
