import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/ui/viewmodel/choose_gift_viewmodel.dart'
    as ChooseGift;
import 'package:project_rd/styles.dart';
import 'package:provider/provider.dart';

class ChooseGiftPage extends StatefulWidget {
  @override
  _ChooseGiftPageState createState() => _ChooseGiftPageState();
}

class _ChooseGiftPageState extends State<ChooseGiftPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ChooseGift.ViewModel(),
        child: ChooseGiftPageBody());
  }
}

class ChooseGiftPageBody extends StatefulWidget {
  @override
  _ChooseGiftPageBodyState createState() => _ChooseGiftPageBodyState();
}

class _ChooseGiftPageBodyState extends State<ChooseGiftPageBody> {
  ChooseGift.ViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<ChooseGift.ViewModel>(context, listen: false);
    _viewModel?.onCreate();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<ChooseGift.ViewModel>(context);
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
          onPressed: () => _viewModel?.goToActionScenario(),
          color: Colors.black,
          shape: Styles.buttonStyle(),
          child: Container(
            child: Text("Gift Sample",
                style: TextStyle(fontFamily: 'Minecraft', color: Colors.white)),
          )),
    );
  }

  RaisedButton backButton() {
    return RaisedButton(
        onPressed: _viewModel?.goToBack,
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
