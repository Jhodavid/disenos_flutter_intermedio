import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAb),
    );
  }
}

class HeaderBorderRedondeados extends StatelessWidget {
  const HeaderBorderRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xff615AAb),
        borderRadius: BorderRadius.only( 
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(25)
        ),
      ),
    );
  }
}


class HeaderBorderInclinado extends StatelessWidget {
  const HeaderBorderInclinado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}


class _HeaderDiagonalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    
    // Propiedades
    paint.color = const Color(0xff615AAb);
    paint.style = PaintingStyle.fill; // .fill .stroke
    paint.strokeWidth = 2;

    final path = Path();

    //Dinujar con el path y el lapiz
    path.lineTo(0, size.height*0.35);
    path.lineTo(size.width, size.height*0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);



    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    
    return true;
  }
}



class HeaderBorderFullInclinado extends StatelessWidget {
  const HeaderBorderFullInclinado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalFullPainter(),
      ),
    );
  }
}


class _HeaderDiagonalFullPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    
    // Propiedades
    paint.color = const Color(0xff615AAb);
    paint.style = PaintingStyle.fill; // .fill .stroke
    paint.strokeWidth = 2;

    final path = Path();

    //Dinujar con el path y el lapiz
    path.moveTo( 0, 0 );
    path.lineTo( size.width, size.height );
    path.lineTo( size.width, 0 );


    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    
    return true;
  }
}



class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}


class _HeaderPicoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    
    // Propiedades
    paint.color = const Color(0xff615AAb);
    paint.style = PaintingStyle.fill; // .fill .stroke
    paint.strokeWidth = 2;

    final path = Path();

    //Dinujar con el path y el lapiz
    path.moveTo( 0, 0);
    path.lineTo( 0, size.height*0.22 );
    path.lineTo( size.width*0.5, size.height*0.28 );
    path.lineTo( size.width, size.height*0.22 );
    path.lineTo( size.width, 0 );


    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    
    return true;
  }
}




class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}


class _HeaderCurvoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    
    // Propiedades
    paint.color = const Color(0xff615AAb);
    paint.style = PaintingStyle.fill; // .fill .stroke
    paint.strokeWidth = 2;

    final path = Path();

    //Dinujar con el path y el lapiz
    path.moveTo( 0, 0);
    path.lineTo( 0, size.height*0.25 );
    path.quadraticBezierTo( size.width*0.5, size.height*0.2, size.width, size.height*0.25  );
    path.lineTo( size.width, size.height*0.25 );
    path.lineTo( size.width, 0 );


    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    
    return true;
  }
}



class HeaderWave extends StatelessWidget {
  const HeaderWave({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}


class _HeaderWavePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    
    // Propiedades
    paint.color = const Color(0xff615AAb);
    paint.style = PaintingStyle.fill; // .fill .stroke
    paint.strokeWidth = 2;

    final path = Path();

    //Dinujar con el path y el lapiz
    path.moveTo( 0, 0);
    path.lineTo( 0, size.height*0.25 );
    path.quadraticBezierTo( size.width*0.25, size.height*0.3, size.width*0.5, size.height*0.25  );
    path.quadraticBezierTo( size.width*0.75, size.height*0.2, size.width, size.height*0.25  );
    path.lineTo( size.width, size.height*0.25 );
    path.lineTo( size.width, 0 );


    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    
    return true;
  }
}




class HeaderGradient extends StatelessWidget {
  const HeaderGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderGradientPainter(),
      ),
    );
  }
}


class _HeaderGradientPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: Offset( 0, 120 ),
      radius: 100
    );

    final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xFFAD0B0B),
        Color(0xFFFFEEE6),
        Color(0xFFCE2020),
      ],
      stops: [
        0.4,
        0.5,
        1.0
      ]
    );

    final paint = Paint()..shader = gradient.createShader(rect);
    
    // Propiedades
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill; // .fill .stroke
    paint.strokeWidth = 2;

    final path = Path();

    //Dinujar con el path y el lapiz
    path.moveTo( 0, 0);
    path.lineTo( 0, size.height*0.25 );
    path.quadraticBezierTo( size.width*0.25, size.height*0.3, size.width*0.5, size.height*0.25  );
    path.quadraticBezierTo( size.width*0.75, size.height*0.2, size.width, size.height*0.25  );
    path.lineTo( size.width, size.height*0.25 );
    path.lineTo( size.width, 0 );


    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    
    return true;
  }
}
