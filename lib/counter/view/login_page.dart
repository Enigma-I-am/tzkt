import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tzkt/assets/assets.gen.dart';
import 'package:tzkt/core/services/navigation.service.dart';
import 'package:tzkt/counter/counter.dart';
import 'package:tzkt/utils/extenstions.dart';
import 'package:tzkt/widgets/controller_bottom_nav.dart';
import 'package:tzkt/widgets/touchable_opacity.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: TouchableOpacity(
          // onTap: () => context.pop(),
          child: TzktAssets.images.svg.backButton.svg(fit: BoxFit.scaleDown),
        ),
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    Text(
                      'Log in to your account',
                      style: GoogleFonts.inter(
                        color: Colors.black.withOpacity(0.949999988079071),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      'Welcome back! Please enter your registered email address to continue',
                      style: GoogleFonts.inter(
                        color: Colors.black.withOpacity(0.6000000238418579),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Gap(24),
                    TextFormField(
                      decoration: getTextInputDeco(
                        label: 'Username',
                      ),
                      validator: (val) {
                        if ((val ?? '').isEmpty) {
                          return 'Please enter a valid username';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(16),
                    TextFormField(
                      validator: (val) {
                        if ((val ?? "").isEmpty) {
                          return 'password invalid';
                        } else {
                          return null;
                        }
                      },
                      decoration: getTextInputDeco(
                        label: 'Password',
                        showSuffix: true,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: context.screenWidth(),
                    height: 48,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFF11A532),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.navigate(const HomePage());
                        }
                      },
                      child: Text(
                        'Continue',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 0.08,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration getTextInputDeco({
  required String label,
  bool showSuffix = false,
}) =>
    InputDecoration(
      filled: true,
      fillColor: Color(0xFFEFEFEF),
      labelText: label,
      floatingLabelStyle: GoogleFonts.inter(
        color: Color(0xFF5A5A5A),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      suffixIcon: showSuffix
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'SHOW',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.inter(
                    color: Color(0xFF5A5A5A),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Gap(12),
              ],
            )
          : null,
    );
