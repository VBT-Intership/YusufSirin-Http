import 'package:flutter/material.dart';
import 'package:harrypotterapp/Core/Components/FutureBuilder/http_future_builder.dart';
import 'package:harrypotterapp/Core/Extension/string_extension.dart';
import 'package:harrypotterapp/Core/Service/Network/Response/responseModel.dart';
import 'package:harrypotterapp/Core/Service/Network/network_service.dart';
import 'package:harrypotterapp/View/Components/characterslist.dart';
import 'package:harrypotterapp/View/Model/hp_c.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<ResponseModel<HPCharacters>> characters;

  Future<ResponseModel<HPCharacters>> fetchCharacters() async {
    ResponseModel<HPCharacters> fetchcharacters = await NetworkService.instance
        .httpGet<HPCharacters>(
            url: "http://hp-api.herokuapp.com/api/characters",
            model: HPCharacters());
    return fetchcharacters;
  }

  @override
  void initState() {
    super.initState();
    characters = fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("hello".locale),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HttpFutureBuilder<ResponseModel<HPCharacters>>(
                future: characters,
                onSucces: (data) {
                  return CharactersList(data: data);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
