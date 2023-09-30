import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maku_app/model/photo.dart';
import 'package:maku_app/network/network_request.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  gotoDetailPage(BuildContext context, Photo photo) {}
  List<Photo> photos = [];
  final List<String> titles = [
    'Dapur 1',
    'Dapur 2',
    'Dapur 3',
    'Dapur 4',
    'Dapur 5',
    'Dapur 6'
  ]; // Ganti dengan judul yang sesuai

  circularProgress() {
    return Center(child: CircularProgressIndicator());
  }

  Future<void> _fetchPhotos() async {
    try {
      List<Photo> fetchedPhotos = await NetworkRequest.fetchPhotos();
      setState(() {
        photos = fetchedPhotos;
      });
    } catch (e) {
      print('Error fetching photos: $e');
    }
  }

  List<String> imageList = [];
  // Function to handle user logout
  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      Navigator.of(context).pushReplacementNamed(
          'phone'); // Navigate to phone verification page after logout
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          // Logout button
          IconButton(
            icon: Icon(Icons.logout),
            color: Colors.black,
            onPressed: () => _signOut(),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 7,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  2, // Menampilkan maksimal 2 gambar dalam satu baris
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final imagePath =
                  'assets/pp${index + 1}.jpg'; // Sesuaikan dengan struktur folder Anda
              final title =
                  'Judul ${index + 1}'; // Sesuaikan judul sesuai kebutuhan

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // margin: EdgeInsets.symmetric(vertical: 20),
                    width: 100, // Lebar gambar (sesuaikan sesuai kebutuhan)
                    height: 100, // Tinggi gambar (sesuaikan sesuai kebutuhan)
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage(
                            imagePath), // Menggunakan AssetImage untuk gambar dari folder assets
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
