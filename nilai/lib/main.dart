import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengelompokan Nilai Siswa',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light, 
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pengelompokan Nilai Siswa'),
          backgroundColor: Colors.blue,
          actions: [
            Switch(
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
          ],
        ),
        body: NilaiForm(),
      ),
    );
  }
}

class NilaiForm extends StatefulWidget {
  @override
  _NilaiFormState createState() => _NilaiFormState();
}

class _NilaiFormState extends State<NilaiForm> {
  final _controller = TextEditingController();
  String _kategori = '';

  void _hitungKategori() {
    final input = _controller.text;
    final nilai = int.tryParse(input);
    
    if (nilai == null || nilai < 0 || nilai > 100) {
      setState(() {
        _kategori = 'Nilai tidak valid.';
      });
    } else if (nilai >= 85) {
      setState(() {
        _kategori = 'Kategori Nilai:A';
      });
    } else if (nilai >= 70) {
      setState(() {
        _kategori = 'Kategori Nila :B';
      });
    } else if (nilai >= 55) {
      setState(() {
        _kategori = 'Kategori Nilai:C';
      });
    } else {
      setState(() {
        _kategori = 'Kategori Nilai:D';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Masukkan Nilai Siswa',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          
          ElevatedButton(
            onPressed: _hitungKategori,
            child: Text('Hitung'),
          ),
          SizedBox(height: 20),
          Text(
            _kategori,
            style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
