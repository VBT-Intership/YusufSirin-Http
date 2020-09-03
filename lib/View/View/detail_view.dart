import 'package:flutter/material.dart';
import 'package:harrypotterapp/View/Model/hp_c.dart';

class DetailView extends StatefulWidget {
  final HPCharacters character;

  const DetailView({Key key, this.character}) : super(key: key);
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.character.name),
      ),
    );
  }
}
