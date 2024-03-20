import 'package:flutter/material.dart';
import 'package:slide_de_presentation/slide_item.dart';

class SlideDePresentation extends StatefulWidget {

  const SlideDePresentation({super.key});

  @override
  State<SlideDePresentation> createState() => _SlideDePresentationState() ;
}

class _SlideDePresentationState extends State<SlideDePresentation>  with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return  ModelDeSlide(
    couleurDuBloc: [Colors.orange, Colors.black, Colors.orange,],
    nombresDeSlides: null, 
    imageDeSlide: [], 
    arrondissementDuBordDuBloc: null, 
    textDeSlide: [],
    backgroundImageUrl: '', 
 );
  }
}