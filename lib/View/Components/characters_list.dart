import 'package:flutter/material.dart';

import '../Model/hp_c.dart';

class CharactersList extends StatelessWidget {
  final List<HPCharacters> list;
  const CharactersList({
    Key key,
    this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        var character = list[index];
        return ListTile(
          title: Text(character.name.toString()),
          subtitle: Text(character.house),
          leading: Text(
            character.gender,
          ),
        );
      },
    );
  }
}
