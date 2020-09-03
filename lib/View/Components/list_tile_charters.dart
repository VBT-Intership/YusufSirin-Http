import 'package:flutter/material.dart';

import '../Model/hp_c.dart';

class ListTileCharacter extends StatelessWidget {
  const ListTileCharacter({
    Key key,
    @required this.character,
  }) : super(key: key);

  final HPCharacters character;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(character.name.toString()),
      subtitle: Text(character.house),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(character.image),
      ),
    );
  }
}
