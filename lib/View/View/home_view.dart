import 'package:flutter/material.dart';
import 'package:harrypotterapp/Core/Service/Network/Response/responseModel.dart';
import 'package:harrypotterapp/Core/Service/Network/network_service.dart';
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
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder<ResponseModel<HPCharacters>>(
                future: characters,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (!snapshot.data.isSucces) {
                      return Expanded(
                        child: Center(
                          child: Text("${snapshot.data.error}"),
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.list.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text(snapshot.data.list[index].name.toString()),
                            subtitle: Text(snapshot.data.list[index].wand.core),
                            leading: Text(
                              snapshot.data.list[index].gender,
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Expanded(
                      child: Center(
                        child: Text(" - ${snapshot.hasError}"),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
