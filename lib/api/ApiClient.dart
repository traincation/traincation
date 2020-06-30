import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'ApiModels.dart';

part 'ApiClient.g.dart';

@RestApi(baseUrl: "https://traincation.herokuapp.com/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/solver")
  Future<SolverResponse> solve(@Body() SolverRequest request);

  @POST("/search")
  Future<SearchResponse> search(@Body() SearchRequest request);
}

class TraincationApi {
  TraincationApi._privateConstructor() {
    final dio = Dio();
    _client = RestClient(dio);
  }

  static final TraincationApi instance = TraincationApi._privateConstructor();

  RestClient _client;

  Future<SolverResponse> solve(List<String> stations) async {
    final request = SolverRequest(stationsIds: stations);
    return _client.solve(request);
  }

  Future<SearchResponse> search(String query) async {
    final request = SearchRequest(searchTerm: query);
    return _client.search(request);
  }
}
