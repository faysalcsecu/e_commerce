import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/app_constants.dart';
import '../models/product_model.dart';

class ApiService {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(AppConstants.apiUrl));
    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
