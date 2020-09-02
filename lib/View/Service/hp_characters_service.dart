import '../../Core/Service/Network/Response/responseModel.dart';
import '../../Core/Service/Network/network_service.dart';
import '../Model/hp_c.dart';

class HarrpPotterCharactersService {
  static const _baseUrl = "http://hp-api.herokuapp.com/api/";

  final networkService = NetworkService.instance;
  Future<ResponseModel<HPCharacters>> fetchCharacters() async {
    ResponseModel<HPCharacters> fetchcharacters = await NetworkService.instance
        .httpGet<HPCharacters>(
            url: "${_baseUrl}characters", model: HPCharacters());
    return fetchcharacters;
  }
}
