import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/screens/widgets/text_field_label.dart';
import 'package:flea_fair/screens/widgets/text_field_suffix_icon.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';


class Authenticate extends StatefulWidget {

  final Function signInSuccess;
  const Authenticate({Key? key, required this.signInSuccess}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  late FlipCardController _controller;
  var height;
  var width;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = FlipCardController();
  }

  Widget buildTopComponent() {
    return Container(
      margin: EdgeInsets.only(left: width * 0.3),
      width: width * 0.60,
      height: height * 0.115,
      // color: Colors.red,
      child: Image(
        fit: BoxFit.fitWidth,
        alignment: Alignment.bottomRight,
        image: AssetImage('assets/images/top_comp.png'),
      ),
    );
  }

  Widget buildBottomComponent() {
    return Container(
      margin: EdgeInsets.only(right: width * 0.2),
      width: width * 0.60,
      height: height * 0.1,
      child: Image(
        fit: BoxFit.fitWidth,
        alignment: Alignment.topRight,
        image: AssetImage('assets/images/down_comp.png'),
      ),
    );
  }

  Widget buildForgotPasswordWidget(){
    return Container(
        alignment: Alignment.topRight,
        width: double.infinity,
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            fontSize: 12,
            color: Colors.redAccent,
            fontFamily: fontSemiBold,
          ),
        ));
  }

  Widget buildAuthButton(String title){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      decoration: BoxDecoration(
        color: primaryBlueLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontFamily: fontExtraBold,
              fontSize: 18
          ),
        ),
      ),
    );
  }

  Widget buildSwitchText(String value){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        child: Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.green,
            fontFamily: fontSemiBold,
          ),
        ));
  }

  Widget buildRegisterBox(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: shadowList,
        borderRadius: BorderRadius.circular(20),
      ),
      width: width*0.9,
      padding: EdgeInsets.fromLTRB(width*0.03, width*0.05, width*0.05, width*0.05),
      child: Column(
        children: [
          SizedBox(height: height*0.02,),
          Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              child: Text(
                "Get your account ready!",
                style: TextStyle(
                  fontSize: 24,
                  color: primaryBlueLight,
                  fontFamily: fontBlack,
                ),
              )),
          SizedBox(height: height*0.04,),
          TextFieldLabel(prefixIcon: Icons.perm_identity,label: 'Name', maxLines: 1,
            hint: '',errorText: 'Empty field',radius: 10,accent: primaryBlueLight,
            inputType: TextInputType.text,obscure: false,onSaved: (String name){},),
          SizedBox(height: height*0.025,),
          TextFieldLabel(prefixIcon: Icons.person_pin_rounded,label: 'Username', maxLines: 1,
            hint: '',errorText: 'Empty field',radius: 10,accent: primaryBlueLight,
            inputType: TextInputType.text,obscure: false,onSaved: (String username){},),
          SizedBox(height: height*0.025,),
          TextFieldLabel(prefixIcon: Icons.email,label: 'Email', maxLines: 1,
            hint: '',errorText: 'Wrong Email',radius: 10,accent: primaryBlueLight,
            inputType: TextInputType.text,obscure: false,onSaved: (String email){},),
          SizedBox(height: height*0.025,),
          TextFieldSuffixIcon(suffixIcon: Icons.visibility,prefixIcon: Icons.lock,label: 'Password',
            hint: '',errorText: 'Wrong Password',radius: 10,accent: primaryBlueLight,
            inputType: TextInputType.text,obscure: true,onSaved: (String pass){},),
          SizedBox(height: height*0.04,),
          GestureDetector(onTap:(){ widget.signInSuccess(); },child: buildAuthButton('Sign Up')),
          SizedBox(height: height*0.04,),
          GestureDetector(onTap: (){_controller.toggleCard();},child: buildSwitchText('Already have an account?'),),
          SizedBox(height: height*0.01,),

        ],
      ),
    );
  }

  Widget buildSignInBox(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: shadowList,
        borderRadius: BorderRadius.circular(20),
      ),
      width: width*0.9,
      padding: EdgeInsets.fromLTRB(width*0.03, width*0.05, width*0.05, width*0.05),
      child: Column(
        children: [
          SizedBox(height: height*0.04,),
          Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              child: Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 24,
                  color: primaryBlueLight,
                  fontFamily: fontBlack,
                ),
              )),
          SizedBox(height: height*0.04,),
          TextFieldLabel(prefixIcon: Icons.email,label: 'Email', maxLines: 1,
            hint: '',errorText: 'Wrong Email',radius: 10,accent: primaryBlueLight,
            inputType: TextInputType.text,obscure: false,onSaved: (String email){},),
          SizedBox(height: height*0.025,),
          TextFieldSuffixIcon(suffixIcon: Icons.visibility,prefixIcon: Icons.lock,label: 'Password',
            hint: '',errorText: 'Wrong Password',radius: 10,accent: primaryBlueLight,
            inputType: TextInputType.text,obscure: true,onSaved: (String pass){},),
          SizedBox(height: height*0.01,),
          GestureDetector(onTap: (){},child: buildForgotPasswordWidget()),
          SizedBox(height: height*0.04,),
          GestureDetector(onTap:(){ widget.signInSuccess(); },child: buildAuthButton('Sign In')),
          SizedBox(height: height*0.04,),
          GestureDetector(onTap: (){_controller.toggleCard();},child: buildSwitchText("Don't have an account?"),),
          SizedBox(height: height*0.01,),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     height = MediaQuery.of(context).size.height;
     width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildTopComponent(),

                  Spacer(),
                  FlipCard(
                      flipOnTouch: false,
                      controller: _controller,
                      front: buildSignInBox(),
                      back: buildRegisterBox()
                  ),
                  Spacer(),

                  buildBottomComponent(),
            ],
          ),
        )),
      ),
    );
  }
}





