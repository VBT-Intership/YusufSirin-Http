import 'package:flutter/material.dart';

import '../../Core/Service/Network/Response/responseModel.dart';
import '../Model/hp_c.dart';

class CharactersList extends StatelessWidget {
  final ResponseModel<HPCharacters> data;
  const CharactersList({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(data.list[index].name.toString()),
          subtitle: Text(data.list[index].house),
          leading: Text(
            data.list[index].gender,
          ),
        );
      },
    );
  }
}
