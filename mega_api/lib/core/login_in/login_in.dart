import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_api/core/login_in/widget/container_widget.dart';

import '../../app_images/app_images.dart';
import '../../bloc/auth_bloc.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';
import '../login_code.dart';
import 'code_screen.dart';

class LoginInPage extends StatefulWidget {
  const LoginInPage({super.key});

  @override
  State<LoginInPage> createState() => _LoginInPageState();
}

class _LoginInPageState extends State<LoginInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phonecontroller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.gradient, AppColors.gradientberz],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                AppImages.ellipseOne,
                width: 215,
                height: 215,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 525, left: 180),
              child: RotatedBox(
                  quarterTurns: 4,
                  child: Image.asset(
                    AppImages.ellipseOne,
                    width: 287,
                    height: 287,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ContainerWidget(
                widget: Column(
                  children: [
                    const SizedBox(
                      height: 23,
                    ),
                    Text(
                      'Welcome',
                      style: AppFonts.w600s25.copyWith(color: AppColors.white),
                    ),
                    const SizedBox(
                      height: 139,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 69, right: 49),
                      child: TextFieldWidget(
                        controller: phonecontroller,
                        lableText: 'Phone',
                      ),
                    ),
                    const SizedBox(
                      height: 102,
                    ),
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSucces && state.model.status == 1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.model.message ?? ''),
                            ),
                          );
                        }

                        if (state is AuthSucces && state.model.status == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const CodeScreen()),
                            ),
                          );
                        }
                        if (state is AuthSucces &&
                            state.model.message ==
                                'Ранее отправленный СМС-код действителен. Введите его.') {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: AppColors.white,
                              title: const Text(
                                'Ранее отправленный СМС-код действителен. Введите его',
                                style: TextStyle(color: AppColors.black),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        if (state is AuthSucces &&
                            state.model.message ==
                                "Профиль абонента не найден") {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: AppColors.white,
                              title: const Text(
                                "Профиль абонента не найден",
                                style: TextStyle(color: AppColors.black),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        // else {
                        // showDialog<String>(
                        //   context: context,
                        //   builder: (BuildContext context) => AlertDialog(
                        //     backgroundColor: AppColors.white,
                        //     title: const Text(
                        //       'Профиль абонента не найден',
                        //       style: TextStyle(color: AppColors.black),
                        //     ),
                        //     actions: [
                        //       TextButton(
                        //         onPressed: () {
                        //           Navigator.pop(context, 'Cancel');
                        //         },
                        //         child: const Text(
                        //           'Cancel',
                        //           style: TextStyle(
                        //             color: AppColors.black,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // );
                        //   }
                      },
                      child: SizedBox(
                        width: 121,
                        height: 57,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white.withOpacity(0.11)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (phonecontroller.text.length >= 11) {
                              BlocProvider.of<AuthBloc>(context).add(
                                SendPhoneEvent(
                                    phoneNumber: phonecontroller.text),
                              );
                            } else {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(                                  
                                  title: const Text('Проверьте номер'),
                                  actions: [
                                    
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                          context,
                                        );
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: const Text('Sing In'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Are you a new user?',
                        style: AppFonts.w600s15,
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign Up',
                              style: AppFonts.w600s15
                                  .copyWith(color: AppColors.bers),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginInPage()));
                                }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.lableText,
    // this.onChaanged,
  }) : super(key: key);
  final TextEditingController controller;
  final String lableText;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  // final Function(String)? onChaanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone,
      maxLength: 12,
      controller: widget.controller,
      onChanged: (val) {
        // BlocProvider.of<AuthBloc>(context).add(SendPhoneEvent(phoneName: val));
        if (val.contains('996')) {
          errorText = null;
          setState(() {});
        } else {
          errorText = 'Ведите правильный номер телефона\n(996+)';
          setState(() {});
        }
      },
      decoration: InputDecoration(
          filled: true,
          errorText: errorText,
          fillColor: AppColors.white.withOpacity(0.1),
          label: Text(
            widget.lableText,
            style: AppFonts.w600s15.copyWith(color: AppColors.white),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14))),
    );
  }
}

TextEditingController controller = TextEditingController();
// TextEditingController controllerpassword = TextEditingController();

String? errorText;
