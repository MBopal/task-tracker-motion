import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Testing Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _daftar = ['Belajar Flutter', 'Kerjakan tugas', 'Tidur'];
  final _controller = TextEditingController();

  void _tambah() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _daftar.add(_controller.text);
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Masukkan item'),
            ),
            ElevatedButton(onPressed: _tambah, child: const Text('Tambah')),
            Expanded(
              child: ListView.builder(
                itemCount: _daftar.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(_daftar[index]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
