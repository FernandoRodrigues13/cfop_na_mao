// lib/api_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cfop_model.dart';
import 'ncm_model.dart';

class ApiService {
  final String cfopApiUrl = "https://sheetdb.io/api/v1/y6ojhq1wy0hbp";
  final String ncmApiUrl = "https://sheetdb.io/api/v1/j8t6shb7p03jh";
  
  Future<List<Cfop>> fetchCfops() async {
    final response = await http.get(Uri.parse(cfopApiUrl));
    if (response.statusCode == 200) {
      String responseBody = utf8.decode(response.bodyBytes);
      List<dynamic> jsonResponse = json.decode(responseBody);
      final List<Cfop> cfopsLimpos = [];
      for (var data in jsonResponse) {
        if (data is Map<String, dynamic> && data['codigo'] != null && data['codigo'].toString().isNotEmpty) {
          try { cfopsLimpos.add(Cfop.fromJson(data)); } catch (e) {}
        }
      }
      return cfopsLimpos;
    } else {
      throw Exception('Falha ao carregar CFOPs.');
    }
  }

  Future<List<Ncm>> fetchNcms() async {
    final response = await http.get(Uri.parse(ncmApiUrl));
    if (response.statusCode == 200) {
      String responseBody = utf8.decode(response.bodyBytes);
      List<dynamic> jsonResponse = json.decode(responseBody);
      final List<Ncm> ncmsLimpos = [];
      for (var data in jsonResponse) {
        if (data is Map<String, dynamic> && data['codigo'] != null && data['codigo'].toString().isNotEmpty) {
          try { ncmsLimpos.add(Ncm.fromJson(data)); } catch (e) {}
        }
      }
      return ncmsLimpos;
    } else {
      throw Exception('Falha ao carregar NCMs.');
    }
  }
}