import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Galeria de imagenes',
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  static final List<String> images = [
    'https://cdn.pixabay.com/photo/2021/10/05/16/53/kimono-6683245_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/11/14/03/43/kimono-1822520_640.jpg',
    'https://cdn.pixabay.com/photo/2024/01/12/08/48/traditional-8503473_640.jpg',
    'https://cdn.pixabay.com/photo/2016/11/14/03/44/girls-1822521_640.jpg',
    'https://media.istockphoto.com/id/1195370326/es/foto/mujer-asi%C3%A1tica-con-kimono-tradicional-japon%C3%A9s-y-flor-de-cerezo-en-primavera-jap%C3%B3n.jpg?s=612x612&w=0&k=20&c=j5lyG9Ki2bvQR-rHGSRSU4nsrXd9j-pHdqqNx6QQ7D0=',
    'https://media.istockphoto.com/id/1042499682/es/foto/asia-mujer-vestida-con-kimono-tradicional-japon%C3%A9s-en-el-monte-fuji-kawaguchiko-lago-en-jap%C3%B3n.jpg?s=612x612&w=0&k=20&c=zSQcI-WA1J4ILIg2m14mUg-9a0B1wm9iPRDiPE0ey5k=',
  ];

  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    //MediaQuery.of(context).orientation obtiene la orientación de la pantalla vertical u horizontal
    //isLandscape guarda un valor booleano que indica si la orientación es horizontal.

    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeria de imagenes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Agrega espacio alrededor de la cuadrícula
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                isLandscape ? 3 : 2, // 3 columnas en horizontal, 2 en vertical
            crossAxisSpacing: 16, // Espacio horizontal entre imágenes
            mainAxisSpacing: 16, // Espacio vertical entre imágenes
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(imageUrl: images[index]),
                  ),
                );
              },
              child: AspectRatio(
                aspectRatio: 1, // Mantiene las imágenes cuadradas
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String imageUrl;

  const SecondScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagen'),
      ),
      body: Center(
        child: Image.network(
          // carga la iamgen de la url
          imageUrl,
          fit: BoxFit
              .contain, // BoxFit.contain para que la imagen este dentro del area dipoible
        ),
      ),
    );
  }
}
