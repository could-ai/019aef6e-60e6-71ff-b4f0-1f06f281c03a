import 'package:flutter/material.dart';

void main() {
  runApp(const FantasyGimnazijaApp());
}

class FantasyGimnazijaApp extends StatelessWidget {
  const FantasyGimnazijaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fantasy Gimnazija',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3F51B5), // Indigo - Academic feel
          secondary: const Color(0xFFFFC107), // Amber - Gold/Trophy feel
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFF3F51B5),
          foregroundColor: Colors.white,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScaffold(),
      },
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const PocetnaScreen(),
    const MojaEkipaScreen(),
    const TransferiScreen(),
    const LjestvicaScreen(),
    const ProfilScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Početna', // Home
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Moja Ekipa', // My Team
          ),
          NavigationDestination(
            icon: Icon(Icons.swap_horiz_outlined),
            selectedIcon: Icon(Icons.swap_horiz),
            label: 'Transferi', // Transfers
          ),
          NavigationDestination(
            icon: Icon(Icons.leaderboard_outlined),
            selectedIcon: Icon(Icons.leaderboard),
            label: 'Ljestvica', // Leaderboard
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil', // Profile
          ),
        ],
      ),
    );
  }
}

// --- Screens ---

class PocetnaScreen extends StatelessWidget {
  const PocetnaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fantasy Gimnazija'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGameweekCard(context),
            const SizedBox(height: 20),
            const Text(
              'Nadolazeći Ispiti', // Upcoming Exams
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildExamCard(context, 'Matematika', '4.A', 'Sutra, 08:00'),
            _buildExamCard(context, 'Hrvatski Jezik', '3.B', 'Petak, 10:30'),
            _buildExamCard(context, 'Povijest', '2.C', 'Ponedjeljak, 14:00'),
            const SizedBox(height: 20),
            const Text(
              'Najbolji Učenici (Tjedan)', // Top Students (Week)
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildStudentCard(context, 'Marko Horvat', 'Prirodoslovni', 15),
            _buildStudentCard(context, 'Ana Babić', 'Jezici', 12),
            _buildStudentCard(context, 'Ivan Kovač', 'Društveni', 10),
          ],
        ),
      ),
    );
  }

  Widget _buildGameweekCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3F51B5), Color(0xFF5C6BC0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ispitni Tjedan 24', // Gameweek 24
            style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Prosjek Razreda: 4.2', // Class Average
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Tvoji Bodovi: 68', // Your Points
            style: TextStyle(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF3F51B5),
              ),
              child: const Text('Pregledaj Bodove'), // View Points
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExamCard(BuildContext context, String subject, String className, String time) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.school, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subject, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(className, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(time, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentCard(BuildContext context, String name, String category, int points) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Text(name[0], style: const TextStyle(color: Colors.black)),
      ),
      title: Text(name),
      subtitle: Text(category), // e.g. Science, Languages
      trailing: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text('$points pts', style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
      ),
    );
  }
}

class MojaEkipaScreen extends StatelessWidget {
  const MojaEkipaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moja Ekipa'), // My Team
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Postava spremljena!')),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const NetworkImage('https://img.freepik.com/free-vector/chalkboard-background_53876-99965.jpg'), // Placeholder chalkboard
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildPitchHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 20),
                    // Row 1: Predsjednik Razreda (Captain/Goalkeeper equivalent)
                    _buildPlayerRow(context, ['Luka P. (C)']), 
                    const SizedBox(height: 30),
                    // Row 2: Prirodoslovci (Defenders)
                    _buildPlayerRow(context, ['Ivan M.', 'Petra K.', 'Josip B.', 'Maja S.']),
                    const SizedBox(height: 30),
                    // Row 3: Društveni (Midfielders)
                    _buildPlayerRow(context, ['Ana T.', 'Marko L.', 'Iva R.', 'Karlo D.']),
                    const SizedBox(height: 30),
                    // Row 4: Jezici/Umjetnost (Forwards)
                    _buildPlayerRow(context, ['Filip N.', 'Sara V.']),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            _buildBench(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPitchHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.white.withOpacity(0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ispitni Tjedan 24', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Rok: Pet 18:30', style: TextStyle(fontSize: 12, color: Colors.red)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF3F51B5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('Triple Captain', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerRow(BuildContext context, List<String> players) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: players.map((name) => _buildPlayerIcon(name)).toList(),
    );
  }

  Widget _buildPlayerIcon(String name) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.amber, width: 2),
            boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black45)],
          ),
          child: const Icon(Icons.person, color: Color(0xFF3F51B5)),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFF3F51B5),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 2),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
          color: Colors.white.withOpacity(0.8),
          child: const Text('7.5', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildBench(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Klupa:', style: TextStyle(fontWeight: FontWeight.bold)),
          _buildSmallPlayerIcon('Tomo'),
          _buildSmallPlayerIcon('Lana'),
          _buildSmallPlayerIcon('Dino'),
        ],
      ),
    );
  }

  Widget _buildSmallPlayerIcon(String name) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 15,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, size: 16, color: Colors.white),
        ),
        Text(name, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}

class TransferiScreen extends StatelessWidget {
  const TransferiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transferi')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Budžet', style: TextStyle(fontSize: 12)),
                    Text('100.0m', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Besplatni transferi', style: TextStyle(fontSize: 12)),
                    Text('1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: const Icon(Icons.person),
                  ),
                  title: Text('Učenik ${index + 1}'),
                  subtitle: Text(index % 2 == 0 ? 'Prirodoslovna Gimnazija' : 'Jezična Gimnazija'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${(5.0 + index * 0.5)}m'),
                      const SizedBox(width: 10),
                      const Icon(Icons.info_outline, color: Colors.blue),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LjestvicaScreen extends StatelessWidget {
  const LjestvicaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ljestvica'), // Leaderboard
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Globalna Liga'),
              Tab(text: 'Moj Razred'),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.amber,
          ),
        ),
        body: TabBarView(
          children: [
            _buildLeaderboardList(context, true),
            _buildLeaderboardList(context, false),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboardList(BuildContext context, bool isGlobal) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        final rank = index + 1;
        final isTop3 = rank <= 3;
        return Container(
          color: index == 5 && !isGlobal ? Colors.amber.withOpacity(0.1) : null, // Highlight current user
          child: ListTile(
            leading: Container(
              width: 30,
              alignment: Alignment.center,
              child: Text(
                '$rank',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isTop3 ? Colors.amber[800] : Colors.grey[700],
                ),
              ),
            ),
            title: Text(isGlobal ? 'Tim ${String.fromCharCode(65 + index)}' : 'Korisnik ${index + 1}'),
            subtitle: Text(isGlobal ? 'Menadžer: Ivan H.' : '4.B Razred'),
            trailing: Text(
              '${1200 - (index * 45)}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF3F51B5)),
            accountName: const Text('Ivan Horvat'),
            accountEmail: const Text('ivan.horvat@skole.hr'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('IH', style: TextStyle(fontSize: 24, color: Theme.of(context).primaryColor)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Postavke'), // Settings
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Povijest Ispita'), // Exam History
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Obavijesti'), // Notifications
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Pomoć i Podrška'), // Help & Support
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Odjava', style: TextStyle(color: Colors.red)), // Logout
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
