import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainMenuCard extends StatelessWidget {
  final _menuItem;

  MainMenuCard(this._menuItem);

  @override
  Widget build(BuildContext context) {
    return _menuItem.action != null ? getItem() : getLockedItem();
  }

  Card getItem() {
    return Card(
      child: InkWell(
        child: Center(
            child: Text(
          _menuItem.name,
          style: TextStyle(fontFamily: 'Minecraft', fontSize: 20),
        )),
        onTap: _menuItem.action,
      ),
      color: Colors.black,
    );
  }

  Card getLockedItem() {
    return Card(
      child: InkWell(
          child: Center(
              child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock,
            color: Colors.grey[400],
            size: 20,
          ),
          SizedBox(width: 10),
          Text(
            _menuItem.name,
            style: TextStyle(
                fontFamily: 'Minecraft', color: Colors.grey[400], fontSize: 20),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.lock,
            color: Colors.grey[400],
            size: 20,
          )
        ],
      ))),
      color: Colors.black,
    );
  }
}
