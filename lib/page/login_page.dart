import 'package:flutter/material.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nama = TextEditingController();
  final experience = TextEditingController();
  final skill = TextEditingController();
  final umur = TextEditingController();

  String gender = "Laki-laki";

  @override
  void dispose() {
    nama.dispose();
    experience.dispose();
    skill.dispose();
    umur.dispose();
    super.dispose();
  }

  void konfirmasiLogin() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.teal,
                    child: Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.yellow,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Apakah kamu yakin?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Apakah kamu ingin login?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("NO"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            Navigator.pop(context);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MainPage(
                                  nama: nama.text,
                                  experience: experience.text,
                                ),
                              ),
                            );
                          },
                          child: const Text("YES"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget inputField(String label, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F8),
      appBar: AppBar(
        title: const Text("Form Login"),
        backgroundColor: const Color.fromARGB(255, 58, 223, 69),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            inputField("Nama", nama),
            inputField("Experience", experience),
            inputField("Skill", skill),
            inputField("Umur", umur),

            DropdownButtonFormField<String>(
              value: gender,
              items: ["Laki-laki", "Perempuan"]
                  .map(
                    (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
              decoration: InputDecoration(
                labelText: "Jenis Kelamin",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 62, 222, 123),
                padding: const EdgeInsets.all(15),
              ),
              child: const Text("Login"),
              onPressed: () {
                if (nama.text.isEmpty || experience.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Nama & Experience wajib diisi!"),
                    ),
                  );
                } else {
                  konfirmasiLogin();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
