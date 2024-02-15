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
              'ac8eb55bccmshb9b570b4abbd5a6p1b0787jsnc830096ac8dd',
          'X-RapidAPI-Host': 'the-vegan-recipes-db.p.rapidapi.com'
        },
      ),
    );
    return response.data;
  }
}
