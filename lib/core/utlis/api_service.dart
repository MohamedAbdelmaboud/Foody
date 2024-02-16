import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  fetchFood({required String baseUrl}) async {
    Response response = await dio.get(
      baseUrl,
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '4c47bd5b77msh3f6acd65269f18bp19bb01jsn04ab535b84f8',
          'X-RapidAPI-Host': 'the-vegan-recipes-db.p.rapidapi.com'
        },
      ),
    );
    return response.data;
  }
}
