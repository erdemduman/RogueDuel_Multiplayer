import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:project_rd/logic/provider/game_provider.dart' as Game;

class GiftView extends StatefulWidget {
  final PageController _pageController;

  GiftView(this._pageController);

  @override
  _GiftViewState createState() => _GiftViewState();
}

class _GiftViewState extends State<GiftView> {
  Game.Provider _provider;

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<Game.Provider>(context);
    return Container(
        child: Column(
          children: [
            Expanded(child: Container()),
            SizedBox(height: 70),
            downArrow()
          ],
        ),
        margin: EdgeInsets.fromLTRB(15, 40, 15, 15));
  }

  Container downArrow() {
    return Container(
      height: 50,
      width: double.infinity,
      child: RaisedButton(
          onPressed: () {
            _provider?.pageViewChanged(_provider.pageNumber + 1);
            widget._pageController.animateToPage(_provider?.pageNumber,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut);
          },
          color: Colors.black,
          child: Stack(children: [
            Image.asset('assets/down_arrow.png'),
            Align(
                alignment: Alignment.topCenter,
                child: Text("Duel", style: TextStyle(color: Colors.grey[300])))
          ])),
    );
  }
}
