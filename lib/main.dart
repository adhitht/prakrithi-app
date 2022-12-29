import 'package:flutter/material.dart';

void main() => runApp(const MyApp());



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final pages = [
    const Florapage(),
    const Faunapage(),
    const Blogpage(),
  ];
  //For Bottom Navigation Bar Changing Index
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prakrithi',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: const Text('Prakrithi'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: pages[_currentIndex],
        ),
        floatingActionButton: const FloatingActionButton(
          tooltip: 'Add', // used by assistive technologies
          onPressed: null,
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.forest),
              label: "Flora",
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pets),
              label: "Fauna",
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: "Blog",
              backgroundColor: Colors.green,
            ),
          ],
          selectedItemColor: Colors.green,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

// class Content extends StatelessWidget {
//   const Content({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const Text('Hello People'),
//     );
//   }
// }

//Flora Page
class Florapage extends StatelessWidget {
  const Florapage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Flora Page"),
      ),
    );
  }
}

//Fauna Page
class Faunapage extends StatelessWidget {
  const Faunapage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Fauna Page"),
      ),
    );
  }
}

//Flora Page
class Blogpage extends StatelessWidget {
  const Blogpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Under Construction"),
      ),
    );
  }
}
