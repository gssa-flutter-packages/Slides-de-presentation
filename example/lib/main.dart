import 'package:flutter/material.dart';
import 'package:slide_de_presentation/slide_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ModelDeSlide(
          nombresDeSlides: 3, // Exemple de valeurs pour vos paramètres
          imageDeSlide: ['https://gss-a.com/wp-content/uploads/2023/01/logo_GSSA.png',
           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ61yrH-uBgiaXUvYiH8A2tMofDJrhHtdBJQ&usqp=CAU', 
           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ61yrH-uBgiaXUvYiH8A2tMofDJrhHtdBJQ&usqp=CAU'], // Exemple de valeurs pour vos paramètres
          textDeSlide: ['Gerez efficacement vos ventes', 'gerez vos stock', 'Suivez en temps réel vos informations'], // Exemple de valeurs pour vos paramètres
          arrondissementDuBordDuBloc: 20.0, // Exemple de valeurs pour vos paramètres
          couleurDuBloc: [Colors.orange, Colors.black, Colors.orange], 
          backgroundImageUrl: 'https://firebasestorage.googleapis.com/v0/b/bootika-eb4fe.appspot.com/o/bootika.jpg?alt=media&token=e5d58c38-2ab1-4b7d-a46a-bf5a1a8d88eb', // Exemple de valeurs pour vos paramètres
        ),
      ),
    );
  }
}