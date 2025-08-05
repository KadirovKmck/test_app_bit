import 'package:dio/dio.dart';
import '../models/crypto_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl =
      'https://rest.coincap.io/v3/assets?apiKey=328451ab90dcf5711c16cbbf5bfb40536e640e2a42246095b6770b952e3493cb';

  Future<List<CryptoModel>> fetchAssets(int limit, int offset) async {
    final response = await _dio.get(baseUrl);

    final List data = response.data['data'];
    return data.map((e) => CryptoModel.fromJson(e)).toList();
  }
}
