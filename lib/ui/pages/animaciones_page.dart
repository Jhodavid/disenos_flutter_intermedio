import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}


class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> moverDerecha;
  late Animation<double> agrandar;

  @override
  void initState() {
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration( milliseconds: 4000 ),
    );

    rotation = Tween(
      begin: 0.0,
      end: 2*Math.pi
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Curves.bounceInOut
      )
    );

    opacidad = Tween(
      begin: 0.1,
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval( 0, 0.25, curve: Curves.easeOut )
      )
    );

    opacidadOut = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval( 0.75, 1, curve: Curves.easeOut )
      )
    );

    moverDerecha = Tween(
      begin: 0.0,
      end: 100.0
    ).animate( 
      CurvedAnimation(
        parent: controller, 
        curve: Curves.easeOut
      )
     );

    agrandar = Tween(
      begin: 0.0,
      end: 2.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Curves.easeOut
      )
    );

    controller.addListener(() {
      
      if( controller.status == AnimationStatus.completed ) {
        controller.reset();
      } 
      else if( controller.status == AnimationStatus.dismissed ) {
        // controller.repeat();
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
      builder: (context, childRectangulo) {

        print('Opacidad: ${ opacidad.value }');
        print('Rotación: ${ rotation.value }');

        return Transform.translate(
          offset: Offset( moverDerecha.value, 0 ),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacidad.value - opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: childRectangulo
              ),
            )
          ),
        );
      },
    );
  }
}




class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 90,
       height: 70,
       decoration: const BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}


