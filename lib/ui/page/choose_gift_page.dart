import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/logic/provider/choose_gift_provider.dart'
    as ChooseGift;
import 'package:provider/provider.dart';

class ChooseGiftPage extends StatefulWidget {
  @override
  _ChooseGiftPageState createState() => _ChooseGiftPageState();
}

class _ChooseGiftPageState extends State<ChooseGiftPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ChooseGift.Provider(),
        child: ChooseGiftPageBody());
  }
}

class ChooseGiftPageBody extends StatefulWidget {
  @override
  _ChooseGiftPageBodyState createState() => _ChooseGiftPageBodyState();
}

class _ChooseGiftPageBodyState extends State<ChooseGiftPageBody> {
  ChooseGift.Provider _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<ChooseGift.Provider>(context, listen: false);
    _provider?.onCreate();
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<ChooseGift.Provider>(context);
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 40, 15, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: giftButton(), flex: 2),
              SizedBox(height: 10),
              Expanded(child: giftButton(), flex: 2),
              SizedBox(height: 10),
              Expanded(child: giftButton(), flex: 2),
              Expanded(
                child: Container(
                    child: Row(children: [
                  backButton(),
                  Spacer(),
                  skipButton(),
                ])),
                flex: 1,
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Container giftButton() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
          onPressed: () => _provider?.goToActionScenario(),
          color: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(color: Colors.white)),
          child: Container(
            child: Text("Gift Sample",
                style: TextStyle(fontFamily: 'Minecraft', color: Colors.white)),
          )),
    );
  }

  RaisedButton backButton() {
    return RaisedButton(
        onPressed: _provider?.goToBack,
        color: Colors.black,
        child: Container(
          child: Text("Back",
              style: TextStyle(fontFamily: 'Minecraft', color: Colors.white)),
        ));
  }

  RaisedButton skipButton() {
    return RaisedButton(
        onPressed: () {},
        color: Colors.black,
        child: Container(
          child: Text("Skip",
              style: TextStyle(fontFamily: 'Minecraft', color: Colors.white)),
        ));
  }
}
