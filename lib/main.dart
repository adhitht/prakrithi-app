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
          title: const Text('Prakrithi'),
          backgroundColor: Colors.green,
        ),
        drawer: const NavBar(),
        body: Center(
          child: pages[_currentIndex],
        ),
        floatingActionButton: const FloatingActionButton(
          tooltip: 'Add',
          onPressed: null,
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
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

//Side Navigation Bar
class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      DrawerHeader(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            const Text('Muzaan Mohammed'),
          ],
        ),
      ),
      ListTile(
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          title: const Text('Settings'),
          onTap: () {
            Navigator.pop(context);
          }),
      ListTile(
            leading: IconButton(
            icon: const Icon(Icons.help),
            onPressed: () {},
          ),
          title: const Text('About'),
          onTap: () {
            Navigator.pop(context);
          })
    ]));
  }
}

// Pages of App
//Flora Page
class Florapage extends StatelessWidget {
  const Florapage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(5.0),
        children: const [
          AppItem(
            url: 'https://i.imgur.com/vcrfpJ6.png',
            name: 'Garden Rose',
            scientificName: 'Rosa Rubiginosa',
            isFlora: true,
          ),
          AppItem(
            url: '',
            name: 'White Sage',
            scientificName: 'Salvia Apiana',
            isFlora: true,
          ),
          AppItem(
            url: '',
            name: 'Giant Calotrope',
            scientificName: 'Calotropis Gigantea',
            isFlora: true,
          ),
          AppItem(
            url: '',
            name: 'Crown of Thorns',
            scientificName: 'Euphorbia Milii',
            isFlora: true,
          ),
          AppItem(
            url: '',
            name: 'Chineese Evergreen',
            scientificName: 'Aglaonema',
            isFlora: false,
          ),
          AppItem(
            url: '',
            name: 'White Sage',
            scientificName: 'Salvia Apiana',
            isFlora: true,
          ),
        ],
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

//About Page
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const Text(
          'Prakrithi is the Nature Club of IIT Hyderabad: it is a place where all members of IITH Community are welcome and contribute.Prakrithi was formed on June 22nd, 2011. The name “Prakriti” means “Nature” in Sanskrit, and we have used the same name as that of like-minded clubs in our sister institutes: IIT Guwahati, and IIT Madras.'),
      ListView(
        children: [
          _members('Muzaan Mohammed'),
          _members('Ajay Krishnan'),
          _members('Adhith T'),
        ],
      ),
    ]);
  }
}

//About Page Members
ListTile _members(String name) {
  return ListTile(
    title: Text(
      name,
      style: const TextStyle(fontSize: 20),
    ),
  );
}

//Box for each Fauna and Flora
class AppItem extends StatelessWidget {
  const AppItem({
    super.key,
    required this.url,
    required this.name,
    required this.scientificName,
    required this.isFlora,
  });

  final String url;
  final String name;
  final String scientificName;
  final bool isFlora;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 200.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: 135,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(isFlora
                          ? (url.isNotEmpty ? url : 'https://i.imgur.com/8Xvg5kM.png')
                          : url.isNotEmpty
                              ? url
                              : 'assets/fauna.png'),
                    ),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              //Name of Flora Fauna
              Align(
                alignment: const Alignment(-1.0, 0.15),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              //Scientific Name
              Align(
                alignment: const Alignment(-1.0, 0.56),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(name,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 71, 71, 71),
                        fontStyle: FontStyle.italic,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
