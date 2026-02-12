import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Control para mostrar/ocultar contraseña
  bool _obscureText = true;

  //Crear cerebro de la animacion
  StateMachineController? _controller;

  //SMI: State Machine Input
  SMIBool? _isChecking;
  SMIBool? _isHandsUp;
  //SMIBool? _isLookDown;
  //SMITrigger? _numLook;
  SMITrigger? _trigSuccess;
  SMITrigger? _trigFail;

  @override
  Widget build(BuildContext context) {
    //Para obtener el tamaño de la pantalla
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: 200,
                child: RiveAnimation.asset(
                  'animated_login_bear.riv',
                  stateMachines: ['Login Machine'],
                  onInit: (artboard) {
                    _controller = StateMachineController.fromArtboard(
                      artboard,
                      'Login Machine',
                    );

                    if (_controller == null) return;

                    artboard.addController(_controller!);

                    _isChecking = _controller!.findSMI('isChecking');
                    _isHandsUp = _controller!.findSMI('isHandsUp');
                    //_isLookDown = _controller!.findSMI('isLookDown') as SMIBool;
                    //_numLook = _controller!.findSMI('numLook') as SMITrigger;
                    _trigSuccess = _controller!.findSMI('trigSuccess');
                    _trigFail = _controller!.findSMI('trigFail');
                  },
                ),
              ),

              const SizedBox(height: 10),

              // TextField Email
              TextField(
                onChanged: (value) {
                  if (_isHandsUp != null) {
                    _isHandsUp!.change(false);
                  }
                  if (_isChecking != null) {
                    _isChecking!.change(true);
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // TextField Password
              TextField(
                onChanged: (value) {
                  if (_isChecking != null) {
                    _isChecking!.change(false);
                  }
                  if (_isHandsUp != null) {
                    _isHandsUp!.change(true);
                  }
                },
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
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
