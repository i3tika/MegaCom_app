import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import 'login_in/code_screen.dart';

class CodeScreen extends StatelessWidget {
  const CodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Material(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                  0.3,
                  0.7,
                  0.9,
                ],
                    colors: [
                  Color(0xffFF00F5),
                  Color.fromARGB(255, 82, 131, 244),
                  Color(0xff00FFFF),
                ])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                gradient: const LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  stops: [0.2, 0.7],
                  colors: [
                    Color(0xffFF00F5),
                    Color(0xff00FFFF),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 500, left: 150),
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.2, 0.7],
                  colors: [
                    Color(0xffFF00F5),
                    Color(0xff00FFFF),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 428,
              height: 565,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Подвердите Код',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
                        if (state is AuthCodeSucces) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const HomePageScreen(),
                              ));

                          //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          // content: Text(state.model.message ?? '')));
                        }
                      },
                      child: TextField(
                        maxLength: 4,
                        keyboardType: TextInputType.phone,
                        controller: controller,
                        decoration: InputDecoration(
                          labelText: 'Code',
                          fillColor: Colors.white.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 55),
                      child: SizedBox(
                        width: 121,
                        height: 57,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white.withOpacity(0.11)),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (controller.text.length >= 4) {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(SendCodeEvent(code: controller.text));
                            }
                          },
                          child: const Text('Sing In'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
