import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'your_intro_screen_file.dart'; // Replace with actual filename

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: TitleScreen(), // 👈 Starts here
));


class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ LSU Logo Image
              Image.asset(
                'assets/images/lsu_logo.png',
                width: 200, // You can adjust size as needed
              ),

              const SizedBox(height: 30),

              const Text(
                'L-S-YOU FIND IT',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF461D7C),
                  letterSpacing: 4,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavigationBarApp()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF461D7C),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 16),
                ),
                child: const Text('Enter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  // Screens for navigation
  static final List<Widget> _pages = <Widget>[
  const IntroScreen(), // Home

  // ✅ Updated Map page with the image
  Scaffold(
    appBar: AppBar(
      title: const Text('PFT Map'),
      centerTitle: true,
    ),
    body: Center(
      child: InteractiveViewer(
        panEnabled: true,
        minScale: 0.5,
        maxScale: 4.0,
        child: Image.asset(
          'assets/images/pft_map.png',
          fit: BoxFit.contain,
        ),
      ),
    ),
  ),
    Scaffold(
  appBar: AppBar(
    title: const Text('Details'),
    centerTitle: true,
  ),
  body: Padding(
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'About Patrick F. Taylor Hall',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            'Patrick F. Taylor Hall (PFT) is one of the largest freestanding academic buildings in the U.S. and serves as the central hub for LSU’s College of Engineering. It houses classrooms, labs, computer centers, and collaboration spaces where innovation and learning thrive.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 24),
          Text(
            'About This App',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            'This app is your interactive companion for a self-guided scavenger hunt through PFT. It helps you explore key areas of the building while answering fun and challenging questions related to what you see.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 24),
          Text(
            'How the Scavenger Hunt Works',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            'Each stop presents a question based on something you can observe around you in PFT—like signs, labs, or displays. Answer correctly to move on to the next challenge. At the end, you’ll receive a congratulations message for completing the hunt!',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    ),
  ),
)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
         currentPageIndex = index;
        });
      },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.house_outlined),
            selectedIcon: Icon(Icons.house),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'Details',
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LSU Scavenger Hunt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 95, 19, 153)),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

// Welcome Screen
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LSU Scavenger Hunt')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to the LSU Scavenger Hunt",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto', // Or use GoogleFonts.roboto() if using the package
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IntroScreen()),
                );
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

// Intro Screen
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LSU Patrick F. Taylor Scavenger Hunt'),
        centerTitle: true, // 👈 Centers the title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Time to see how well you know the PFT!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const QuizScreen(questionIndex: 0)),
                );
              },
              child: const Text("Play"),
            ),
          ],
        ),
      ),
    );
  }
}

// List of questions & answers
const List<Map<String, dynamic>> quizQuestions = [
  {
    "question": "What do the Banners by the big stairs say?",
    "options": ["College of Engineering", "Geaux Tigers", "Welcome to LSU", "Innovation Hub"],
    "correct": "College of Engineering"
  },
  {
    "question": "What is the first option listed on the Panera Bread sandwich menu in the PFT?",
    "options": ["Turkey Club", "Roast Beef Sandwich", "BLT", "Grilled Chicken Sandwich with Avocado"],
    "correct": "Grilled Chicken Sandwich with Avocado"
  },
  {
    "question": "What is the room number for the Roy Marrin Auditorium?",
    "options": ["2100", "1200", "3100", "1100"],
    "correct": "1100"
  },
  {
    "question": "What does it say on the left door of the Chevron center?",
    "options": ["Geaux Communicate", "Future Tigers", "Welcome Engineers", "Innovation Hub"],
    "correct": "Geaux Communicate"
  },
  {
    "question": "What is inside room 2215?",
    "options": ["A crash test car", "A robotics lab", "A computer lab", "An engineering workshop"],
    "correct": "A crash test car"
  },
  {
    "question": "How many computers are in room 2241?",
    "options": ["50", "51", "48", "49"],
    "correct": "51"
  },
  {
    "question": "What floor is the suite for the college of engineering and computer science?",
    "options": ["2nd floor", "3rd floor", "1st floor", "4th floor"],
    "correct": "3rd floor"
  },
  {
    "question": "Where is the Dr. William A. Brookshire Student Service Office?",
    "options": ["In front of the big stairs", "behind the big stairs", "next to the entrance", "on the roof"],
    "correct": "In front of the big stairs"
  },
  {
    "question": "Which zone has the Dean’s suite of the PFT?",
    "options": ["Zone 1100", "Zone 1400", "Zone 1200", "Zone 1300"],
    "correct": "Zone 1200"
  },
  {
    "question": "What year does the TAU BETA PI statue say it was made?",
    "options": ["1942", "2025", "1936", "1956"],
    "correct": "1936"
  }
];


// Quiz Screen
class QuizScreen extends StatelessWidget {
  final int questionIndex;

  const QuizScreen({super.key, required this.questionIndex});

  void _navigateToResult(BuildContext context, bool isCorrect) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          isCorrect: isCorrect,
          questionIndex: questionIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final questionData = quizQuestions[questionIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Question ${questionIndex + 1}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                questionData["question"],
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            for (String option in questionData["options"])
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToResult(context, option == questionData["correct"]);
                  },
                  child: Text(option),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Result Screen
class ResultScreen extends StatelessWidget {
  final bool isCorrect;
  final int questionIndex;

  const ResultScreen({super.key, required this.isCorrect, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isCorrect ? "Hurray!" : "Oops, Try Again!")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isCorrect ? "🎉 Hurray! You got it right! 🎉" : "❌ Oops, try again! ❌",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isCorrect) {
                  if (questionIndex < quizQuestions.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(questionIndex: questionIndex + 1),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CongratsScreen()),
                    );
                  }
                } else {
                  Navigator.pop(context);
                }
              },
              child: Text(isCorrect ? "Next" : "Back"),
            ),
          ],
        ),
      ),
    );
  }
}

// Congratulations Screen
class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("You Did It!"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "🎉 Congratulations! You completed the LSU Scavenger Hunt! 🎉",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // ✅ Add this Return button
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: const Color(0xFF461D7C), // LSU Purple
                foregroundColor: Colors.white,
              ),
              child: const Text("Return to Home"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
