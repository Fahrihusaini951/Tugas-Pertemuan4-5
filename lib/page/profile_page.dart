import 'package:flutter/material.dart';
import 'list_pertemuan_page.dart';

class ProfilePage extends StatefulWidget {
  final String nama, experience;

  const ProfilePage({super.key, required this.nama, required this.experience});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String aboutMe = """
Saya adalah seorang mahasiswa semester 4, saya sedang mempelajari Flutter.
Motivasi untuk terus belajar coding karena untuk menghadapi pekerjaan yang banyak menggunakan teknologi canggih.
Dan membuat program yang dapat bermanfaat untuk banyak orang.
""";

  Map<String, String> info = {
    "Email": "fahri@email.com",
    "Phone": "08123456789",
    "Tanggal Lahir": "10 Januari 1998",
    "Pekerjaan": "Data Entry - Lion Parcel",
  };

  List<String> skills = ["Flutter", "PHP", "MySQL"];
  List<String> interests = ["UI Design", "Mobile App", "Web Dev"];

  // ================= EDIT PROFILE =================
  void editProfile() {
    TextEditingController aboutController = TextEditingController(
      text: aboutMe,
    );

    TextEditingController emailController = TextEditingController(
      text: info["Email"],
    );
    TextEditingController phoneController = TextEditingController(
      text: info["Phone"],
    );
    TextEditingController lahirController = TextEditingController(
      text: info["Tanggal Lahir"],
    );
    TextEditingController kerjaController = TextEditingController(
      text: info["Pekerjaan"],
    );

    TextEditingController skillController = TextEditingController(
      text: skills.join(", "),
    );
    TextEditingController interestController = TextEditingController(
      text: interests.join(", "),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Profile"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: aboutController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: "About Me",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: "Phone"),
                ),
                TextField(
                  controller: lahirController,
                  decoration: const InputDecoration(labelText: "Tanggal Lahir"),
                ),
                TextField(
                  controller: kerjaController,
                  decoration: const InputDecoration(labelText: "Pekerjaan"),
                ),

                const SizedBox(height: 10),

                // 🔥 EDIT SKILLS
                TextField(
                  controller: skillController,
                  decoration: const InputDecoration(
                    labelText: "Skills (pisahkan dengan koma)",
                  ),
                ),

                const SizedBox(height: 10),

                // 🔥 EDIT INTERESTS
                TextField(
                  controller: interestController,
                  decoration: const InputDecoration(
                    labelText: "Interests (pisahkan dengan koma)",
                  ),
                ),
              ],
            ),
          ),

          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                // KONFIRMASI
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Konfirmasi"),
                      content: const Text(
                        "Apakah anda yakin ingin mengedit profile ini?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Tidak"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              aboutMe = aboutController.text;
                              info["Email"] = emailController.text;
                              info["Phone"] = phoneController.text;
                              info["Tanggal Lahir"] = lahirController.text;
                              info["Pekerjaan"] = kerjaController.text;

                              // 🔥 UPDATE SKILLS
                              skills = skillController.text
                                  .split(",")
                                  .map((e) => e.trim())
                                  .where((e) => e.isNotEmpty)
                                  .toList();

                              // 🔥 UPDATE INTERESTS
                              interests = interestController.text
                                  .split(",")
                                  .map((e) => e.trim())
                                  .where((e) => e.isNotEmpty)
                                  .toList();
                            });

                            Navigator.pop(context);
                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Profile berhasil di update"),
                              ),
                            );
                          },
                          child: const Text("Ya"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  void shareProfile() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Profile dibagikan")));
  }

  void deleteProfile() {
    setState(() {
      aboutMe = "-";
      info.clear();
      skills.clear();
      interests.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F8),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 21, 209, 21),
        icon: const Icon(Icons.list),
        label: const Text("List"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ListPertemuanPage()),
          );
        },
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 220,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Husain.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(color: Colors.black26),
                ),

                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/merapi.jpeg"),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            Text(
              widget.nama,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const Text(
              "Tangerang, Indonesia",
              style: TextStyle(color: Colors.grey),
            ),

            Text(widget.experience, style: const TextStyle(color: Colors.grey)),

            const SizedBox(height: 20),

            sectionCard(
              title: "About Me",
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(aboutMe, textAlign: TextAlign.left),
              ),
            ),

            sectionCard(
              title: "Information",
              child: Column(
                children: info.entries.map((e) {
                  return ListTile(
                    leading: Icon(getIcon(e.key)),
                    title: Text(e.key),
                    subtitle: Text(e.value),
                  );
                }).toList(),
              ),
            ),

            sectionCard(
              title: "Skills",
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8,
                  children: skills.map((s) => Chip(label: Text(s))).toList(),
                ),
              ),
            ),
            sectionCard(
              title: "Interests",
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8,
                  children: interests
                      .map(
                        (i) => Chip(
                          label: Text(i),
                          backgroundColor: Colors.green[100],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: editProfile,
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit"),
                ),
                ElevatedButton.icon(
                  onPressed: shareProfile,
                  icon: const Icon(Icons.share),
                  label: const Text("Share"),
                ),
                ElevatedButton.icon(
                  onPressed: deleteProfile,
                  icon: const Icon(Icons.delete),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  label: const Text("Delete"),
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget sectionCard({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  IconData getIcon(String key) {
    switch (key) {
      case "Email":
        return Icons.email;
      case "Phone":
        return Icons.phone;
      case "Tanggal Lahir":
        return Icons.cake;
      case "Pekerjaan":
        return Icons.work;
      default:
        return Icons.info;
    }
  }
}
