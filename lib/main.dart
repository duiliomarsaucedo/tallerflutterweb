import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 8, 0, 255)),
        useMaterial3: true,
        textTheme: GoogleFonts.anaheimTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // Sidebar
            Container(
              width: 200,
              color: const Color.fromRGBO(218, 13, 13, 1),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  SidebarButton(icon: FontAwesomeIcons.folder, text: 'Projects', onTap: () {}),
                  SidebarButton(icon: FontAwesomeIcons.paintBrush, text: 'Draft', onTap: () {}),
                  SidebarButton(icon: FontAwesomeIcons.users, text: 'Shared with me', onTap: () {}),
                  const SizedBox(height: 20),
                  SidebarButton(icon: FontAwesomeIcons.cog, text: 'Settings', onTap: () {}),
                  SidebarButton(icon: FontAwesomeIcons.userPlus, text: 'Invite members', onTap: () {}),
                  SidebarButton(icon: FontAwesomeIcons.plusSquare, text: 'New Draft', onTap: () {}),
                  SidebarButton(icon: FontAwesomeIcons.star, text: 'New Project', onTap: () {}),
                ],
              ),
            ),

            // Content Area
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        const Text(
                          'Side Hustle',
                          style: TextStyle(
                            fontSize: 35,
                            color: Color.fromRGBO(25, 2, 2, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.shareAlt, color: Colors.orange),
                          onPressed: () {},
                        ),
                        const Text('Share'),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.ellipsisVertical, color: Colors.orange),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Cards
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: NoteCard(
                                title: 'Title ${index + 1}',
                                content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec odio nec nisl sodales fermentum.',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const SidebarButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon, color: const Color.fromARGB(255, 2, 23, 1)),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final String title;
  final String content;

  const NoteCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 204, 14, 141),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 236, 64),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  content,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 47, 194, 234),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Edit',
                style: TextStyle(color: const Color.fromARGB(255, 178, 68, 52)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
