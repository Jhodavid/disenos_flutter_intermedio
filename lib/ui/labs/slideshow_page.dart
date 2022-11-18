import 'package:disenos/domain/bloc/ui/ui_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          children: const <Widget>[
            Expanded(
              child: _Slides()
            ),
            _Dots()
          ],
        )
      ),
    );
  }
}



class _Dots extends StatelessWidget {
  const _Dots({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          _Dot(0),
          _Dot(1),
          _Dot(2),

        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  _Dot( this.index );

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<UiBloc, UiState>(
      builder: (context, state) {

        final pageViewIndex = state.currentPage;
        
        return AnimatedContainer(
          duration: const Duration( milliseconds: 200 ),
          width: 12,
          height: 12,
          margin: const EdgeInsets.symmetric( horizontal: 5 ),
          decoration: BoxDecoration(
            color: ( pageViewIndex >= index - 0.5 && pageViewIndex <= index + 0.5 ) 
              ? Colors.blue 
              : Colors.grey ,
            shape: BoxShape.circle
          ),
        );
      },
    );
  }
}



class _Slides extends StatefulWidget {
  const _Slides({super.key});

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      if (kDebugMode) {
        print('Página actual: ${ pageViewController.page } ');
      }

      //Actualizar instancia del provider
      final uiBloc = BlocProvider.of<UiBloc>(context);
      uiBloc.setCurrentPage(pageViewController.page!);

    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: const <Widget>[
          _Slide( svg: 'assets/svgs/1.svg' ),
          _Slide( svg: 'assets/svgs/2.svg' ),
          _Slide( svg: 'assets/svgs/3.svg' ),
        ],
      )
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  const _Slide({
    Key? key, 
    required this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}