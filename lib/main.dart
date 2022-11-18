
import 'package:disenos/domain/bloc/ui/ui_bloc.dart';
import 'package:disenos/ui/pages/slideshow_page.dart';

import 'package:flutter/material.dart';

// import 'package:disenos/ui/pages/headers_page.dart';
// import 'package:disenos/ui/pages/animaciones_page.dart';
// import 'package:disenos/ui/labs/circular_progres_page.dart';
// import 'package:disenos/ui/retos/cuadrado_animado_page.dart';

// import 'package:disenos/ui/pages/graficas_circulares_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [  
        BlocProvider(create: ( ( context ) => UiBloc() ))
      ], 
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true
      ),
      home: const SlideshowPage(),
    );
  }
}