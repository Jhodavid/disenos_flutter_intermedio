import 'package:flutter/material.dart';


class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _CuadradoAnimado(),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;

  @override
  void initState() {

    controller = AnimationController(
      vsync: this,
      duration: const Duration( milliseconds: 4000 ),
    );
    
    moverDerecha = Tween(
      begin: 0.0,
      end: 100.0
    ).animate( 
      CurvedAnimation(
        parent: controller, 
        curve: const Interval( 0, 0.25)
      )
    );

    moverArriba = Tween(
      begin: 0.0,
      end: 100.0
    ).animate( 
      CurvedAnimation(
        parent: controller, 
        curve: const Interval( 0.25, 0.5)
      )
    );

    moverIzquierda = Tween(
      begin: 0.0,
      end: 100.0
    ).animate( 
      CurvedAnimation(
        parent: controller, 
        curve: const Interval( 0.5, 0.75)
      )
    );

    moverAbajo = Tween(
      begin: 0.0,
      end: 100.0
    ).animate( 
      CurvedAnimation(
        parent: controller, 
        curve: const Interval( 0.75, 1.0)
      )
    );

    controller.addListener(() { 
      if( controller.status == AnimationStatus.completed ) {
        controller.reset();
      }
    });

    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset( moverDerecha.value  - moverIzquierda.value, 0 - moverArriba.value + moverAbajo.value ),
          child: Center(
            child: child
          )
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}