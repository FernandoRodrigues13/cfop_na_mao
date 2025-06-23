// lib/api_service.dart (VERSÃO BLINDADA)

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cfop_model.dart';

class ApiService {
  // =======================================================================
  // ATENÇÃO: VERIFIQUE SE A SUA URL REAL DO SHEETDB ESTÁ AQUI
  // =======================================================================
  final String apiUrl = "https://sheetdb.io/api/v1/y6ojhq1wy0hbp";
  // =======================================================================
  
  Future<List<Cfop>> fetchCfops() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        List<dynamic> jsonResponse = json.decode(responseBody);

        // =============================================================
        // INÍCIO DA BLINDAGEM: FILTRANDO DADOS SUJOS
        // =============================================================
        final List<Cfop> cfopsLimpos = [];
        for (var data in jsonResponse) {
          // Garante que o item 'data' seja um mapa, como esperado.
          if (data is Map<String, dynamic>) {
            // VERIFICA SE OS CAMPOS ESSENCIAIS NÃO SÃO NULOS OU VAZIOS
            if (data['codigo'] != null && data['codigo'].toString().isNotEmpty &&
                data['descricao'] != null && data['descricao'].toString().isNotEmpty) {
              try {
                // Tenta converter APENAS a linha que passou no teste.
                cfopsLimpos.add(Cfop.fromJson(data));
              } catch (e) {
                // Se mesmo assim der erro na conversão, imprime e ignora a linha.
                print("--- ERRO AO CONVERTER LINHA VÁLIDA ---");
                print("DADOS: $data");
                print("ERRO: $e");
                print("-------------------------------------");
              }
            } else {
              // Se a linha for "suja", imprime e a ignora.
              print("--- LINHA INVÁLIDA IGNORADA (dados faltando) ---");
              print("DADOS: $data");
              print("----------------------------------------------");
            }
          }
        }
        // Retorna APENAS a lista de CFOPs limpos.
        return cfopsLimpos;
        // =============================================================
        // FIM DA BLINDAGEM
        // =============================================================

      } else {
        throw Exception('Falha ao carregar dados. Código do servidor: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Falha ao conectar ao serviço. Verifique sua conexão: $e');
    }
  }
}