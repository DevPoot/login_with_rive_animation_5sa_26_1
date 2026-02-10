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


  @override
  Widget build(BuildContext context) {
    //Para ontener el tamaño de la pantalla
final Size size = MediaQuery.of(context).size;

    return Scaffold(
      //Evita que se quite espacio del nudge
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: 200,
                child: RiveAnimation.asset('animated_login_bear.riv')),
              //para separar 
              const SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    //para redondear los bordes del textfield
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    //if ternario para cambiar el icono dependiendo de si se muestra o no la contraseña
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      //Refresca el (icono) estado para mostrar/ocultar la contraseña
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ), 
                  border: OutlineInputBorder(
                    //para redondear los bordes del textfield
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ]// children
          ),
        )
      )
    );
  }
}