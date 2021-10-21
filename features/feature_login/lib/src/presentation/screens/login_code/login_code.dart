import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

import '../../cubit/login_cubit.dart';

class LoginCode extends StatelessWidget {
  const LoginCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0E50),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              bottom: -2,
              right: -80,
              child: SvgPicture.asset(
                'assets/images/login_background.svg',
                package: 'design_system',
                semanticsLabel: 'Woman with card',
                alignment: Alignment.bottomRight,
                height: 500,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      const Color(0xFF0F0E50).withOpacity(.8)
                    ],
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: MediaQuery.of(context).padding.top,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    Image.asset(
                      'assets/images/ryco_logo.png',
                      package: 'design_system',
                      width: 60,
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Online, simples',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'e inteligente.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Usuário', style: TextStyle(color: Colors.white)),
                        SizedBox(height: 4),
                        TextField(
                          style: TextStyle(
                              color: Colors.white, decorationThickness: 0),
                          keyboardType: TextInputType.number,
                          cursorColor: Color(0xFFFF5200),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Digite seu usuário',
                            hintStyle: TextStyle(color: Colors.white),
                            fillColor: Colors.black,
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Lembrar de  mim',
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(value: true, onChanged: null),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: context.read<LoginCubit>().signInWithGoogle,
                      child: const Text('Avançar'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFFF5200),
                        minimumSize: const Size(double.maxFinite, 40),
                        shape: const StadiumBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        'Esqueci meu usuário',
                        style: TextStyle(
                          color: Color(0xFFFF5200),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
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
