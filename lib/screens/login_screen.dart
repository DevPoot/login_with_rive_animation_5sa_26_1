import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'dart:async'; //3.1 Importar dart:async para usar Timer
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
  SMITrigger? _trigSuccess;
  SMITrigger? _trigFail;

//2.1 Variable para el modo chismoso de la cabeza
  SMINumber? _numLook;
  //SMIBool? _isLookDown;

//1.1 Variable para el modo manos arriba
  //1 Crear variables focusNode
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

//3.2 Timer para detener la mirada al dejar de escribir
  Timer? _typingDebounce;

  //1.2 Agregar listeners a los focusNode
  @override
  void initState() {
    super.initState();

    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus) {
        //Verifica que no sea nulo
        if (_isHandsUp != null) {
          //Manos abajo en el email
          _isHandsUp?.change(false);
          //2.2 Mirada neutral
          _numLook?.value = 80.0; //Valor de calibracion para mirada neutra
        }
      }
    });

    //Listener para password
    _passwordFocusNode.addListener(() {
      if (_passwordFocusNode.hasFocus) {
        if (_isChecking != null) {
          //No quiero el modo chismoso en el password
          _isChecking?.change(false);
        }
        if (_isHandsUp != null) {
          _isHandsUp?.change(true);
        }
      }
    });
  }

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
                    _trigSuccess = _controller!.findSMI('trigSuccess');
                    _trigFail = _controller!.findSMI('trigFail');
                    //2.3 vincular numLook
                    _numLook = _controller!.findSMI('numLook');
                  }
                ),
              ),

              const SizedBox(height: 10),

              // TextField Email
              TextField(
                //1.3 Agregar focusNode al TextField
                focusNode: _emailFocusNode,
                onChanged: (value) {
                  if (_isHandsUp != null) {
                    //No tapes los ojos al ver email
                    //_isHandsUp!.change(false);
                  }
                  //si chcking es nulo
                  if (_isChecking != null) {
                    //Activar modo chismoso en el email
                    _isChecking!.change(true);
                  }
                  //2.4 implementar numlook
                  //ajuste de limites de 0 a 100}
                  //80 como medida de calibracion
                  final look = (value.length/80.0* 100.0)
                  .clamp(0.0, 100.0);//clamp para limitar el valor entre 0 y 100
                  _numLook?.value = look;

                  //3.3 debounce: si el usuario sigue escribiendo, reinicia el timer
                  _typingDebounce?.cancel(); //cancelar el timer existente
                  //crear un nuevo timer que se ejecuta después de 3 segundos de inactividad
                  _typingDebounce = Timer(const Duration(seconds: 3),() {
                    //si se cierra la pantalla, quita el contador
                    if(!mounted)return;
                    //Mirada neutra
                    _isChecking?.change(false);
                    });
                
                  //_isChecking?.change(false);
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
                //1.3 Agregar focusNode al TextField
                focusNode: _passwordFocusNode,
                onChanged: (value) {
                  if (_isChecking != null) {
                    //No quiero el modo chismoso en el password
                    //_isChecking!.change(false);
                  }/////////////////////////////////
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

  //1.4 Liberar recursos(memoria) de los focusNode
  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _typingDebounce?.cancel(); //Cancelar el timer si existe
    super.dispose();
  }
}
