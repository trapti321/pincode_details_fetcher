import 'package:dio/dio.dart';
import '../models/pincode_model.dart';

class PincodeRepository {
  final Dio _dio = Dio();

  Future<List<PostOffice>> fetchPincodeDetails(String pincode) async {
    try {
      String url = 'https://api.postalpincode.in/pincode/';
      final response = await _dio.get('$url$pincode');

      if (response.statusCode == 200) {
        final data = response.data;
        if (data[0]['Status'] == 'Success') {
          return (data[0]['PostOffice'] as List)
              .map((item) => PostOffice.fromJson(item))
              .toList();
        }
      }
      throw Exception('Failed to fetch details for the pincode.');
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
