import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

import '../cubit/login_cubit.dart';
import 'typer.dart';

class LoginSuccessScreen extends StatefulWidget {
  const LoginSuccessScreen({Key? key}) : super(key: key);

  @override
  State<LoginSuccessScreen> createState() => _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<LoginSuccessScreen> {
  static const String name = 'Olá, KEVYN!';

  static const duration = Duration(milliseconds: 600);
  static const curve = Curves.ease;

  bool isFinishedAnimatedText = false;
  bool isFinishedAnimatedButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0E50),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFFFF5200),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedOpacity(
                        duration: duration,
                        curve: curve,
                        opacity: isFinishedAnimatedButton ? 1 : 0,
                        child: Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Center(
                            child: Text(
                              'KR',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      AnimatedAlign(
                        alignment: isFinishedAnimatedText
                            ? Alignment.centerLeft
                            : Alignment.center,
                        duration: duration,
                        curve: curve,
                        child: AnimatedTextKit(
                          onFinished: () {
                            setState(() {
                              isFinishedAnimatedText = true;
                            });
                          },
                          animatedTexts: [
                            TyperAnimatedText(
                              name,
                              textAlign: TextAlign.center,
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                      AnimatedOpacity(
                        duration: duration,
                        opacity: isFinishedAnimatedButton ? 1 : 0,
                        curve: curve,
                        child: const Text(
                          'Bom te receber de volta! :)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      AnimatedOpacity(
                        duration: duration,
                        opacity: isFinishedAnimatedText ? 1 : 0,
                        onEnd: () {
                          setState(() {
                            isFinishedAnimatedButton = true;
                          });
                        },
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Avançar'),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFFF5200),
                            minimumSize: const Size(double.maxFinite, 40),
                            shape: const StadiumBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      AnimatedOpacity(
                        duration: duration,
                        opacity: isFinishedAnimatedText ? 1 : 0,
                        onEnd: () {
                          setState(() {
                            isFinishedAnimatedButton = true;
                          });
                        },
                        child: ElevatedButton(
                          onPressed: () async =>
                              await context.read<LoginCubit>().signOut(),
                          child: const Text('Deslogar'),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFFF5200),
                            minimumSize: const Size(double.maxFinite, 40),
                            shape: const StadiumBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Token Ryco',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
