import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/logic/provider/gift_provider.dart' as Gift;
import 'package:provider/provider.dart';

class GiftPage extends StatefulWidget {
  @override
  _GiftPageState createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Gift.Provider(), child: GiftPageBody());
  }
}

class GiftPageBody extends StatefulWidget {
  @override
  _GiftPageBodyState createState() => _GiftPageBodyState();
}

class _GiftPageBodyState extends State<GiftPageBody> {
  Gift.Provider _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<Gift.Provider>(context, listen: false);
    _provider?.onCreate();
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<Gift.Provider>(context);
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 40, 15, 20),
          child: Column(
            children: [
              giftButton(),
              SizedBox(height: 30),
              giftButton(),
              SizedBox(height: 30),
              giftButton(),
              SizedBox(height: 10),
              Row(children: [backButton(), Spacer(), skipButton()])
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  SizedBox giftButton() {
    return SizedBox(
      width: double.infinity,
      height: 185,
      child: RaisedButton(
          onPressed: () {},
          color: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(color: Colors.white)),
          child: Text("SeLaM :)",
              style: TextStyle(fontFamily: 'Minecraft', color: Colors.white))),
    );
  }

  RaisedButton backButton() {
    return RaisedButton(
        onPressed: _provider?.goToBack,
        color: Colors.black,
        child: Text("Back",
            style: TextStyle(fontFamily: 'Minecraft', color: Colors.white)));
  }

  RaisedButton skipButton() {
    return RaisedButton(
        onPressed: () {},
        color: Colors.black,
        child: Text("Skip",
            style: TextStyle(fontFamily: 'Minecraft', color: Colors.white)));
  }
}
