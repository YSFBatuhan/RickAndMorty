import 'package:flutter/material.dart';
import 'package:deneme/screens/homeScreen.dart';
import 'package:deneme/screens/seasonsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick And Morty"),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: const CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage('assets/images/portalSplash.png')
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: Builder(
                builder: (context) {
                  return Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/rickandmorty.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Center(
                      child: Text('Characters'),
                    ),
                  );
                }
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Seasons(),
                  ),
                );
              },
              child: Builder(
                builder: (context) {
                  return Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/rickandmorty2.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: const Center(
                      child: Text('Episodes'),
                    ),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
