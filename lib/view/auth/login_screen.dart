import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:myapp/common_widgets/custom_box.dart';
import 'package:myapp/resources/asset_manager.dart';
import 'package:myapp/resources/color_manager.dart';
import 'package:myapp/resources/string_manager.dart';
import 'package:social_auth_btn_kit/social_auth_btn_kit.dart';
import 'package:social_auth_btn_kit/social_auth_btn_variants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Image.asset(AssetManager.appLogo, height: 200, width: 200),
                SizedBox(
                  height: 100,
                ),
                Text(
                  StringManager.loginInWithPhoneNumber,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.whiteColor),
                ),
                Card(
                  color: Colors.amber,
                  child: TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: CountryCodePicker(
                      onChanged: print,
                      initialSelection: 'EG',
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                  )),
                ),
                CustomBox(
                  padding: 10,
                  color: ColorManager.greenColor,
                  width: 250,
                  height: 60,
                  child: Text(StringManager.containue),
                  onTap: () {},
                ),
                Text(
                  StringManager.or,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.whiteColor),
                ),
                SizedBox(
                  height: 100,
                ),
                SocialAuthBtn.facebook(
                  theme: FacebookThemeVariants.light,
                  variant: FacebookTypeVariants.normal,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 100,
                ),
                SocialAuthBtn.google(
                  theme: GoogleThemeVariants.light,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 100,
                ),
                SocialAuthBtn.apple(
                  variant: AppleTypeVariants.outlined,
                  theme: AppleThemeVariants.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
