import 'package:flutter/material.dart';

// ================== MODEL BOOK ==================
class Book {
  String name;
  int price;
  bool isSelected;

  Book({required this.name, required this.price, this.isSelected = false});
}

// ================== FORUM PAGE ==================
class ForumPage extends StatefulWidget {
  final String title;
  final String subtitle;

  const ForumPage({super.key, required this.title, required this.subtitle});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  // ================== DATA BUKU ==================
  List<Book> books = [
    Book(name: "Buku Flutter", price: 50000),
    Book(name: "Buku UI/UX", price: 60000),
    Book(name: "Buku Database", price: 55000),
    Book(name: "Buku Pemrograman", price: 70000),
  ];

  // ================== TOTAL ==================
  int get totalHarga {
    return books
        .where((b) => b.isSelected)
        .fold(0, (sum, item) => sum + item.price);
  }

  int get totalItem {
    return books.where((b) => b.isSelected).length;
  }

  // ================== CHECKOUT ==================
  void showCheckout() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Rincian Pesanan"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...books
                .where((b) => b.isSelected)
                .map((b) => Text("${b.name} - Rp ${b.price}"))
                .toList(),
            const SizedBox(height: 10),
            Text("Total Item: $totalItem"),
            Text("Total Harga: Rp $totalHarga"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              showSuccess();
            },
            child: const Text("Bayar"),
          ),
        ],
      ),
    );
  }

  // ================== SUCCESS ==================
  void showSuccess() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Sukses"),
        content: const Text("Pembayaran telah selesai ✅"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);

              // reset pilihan
              setState(() {
                for (var b in books) {
                  b.isSelected = false;
                }
              });
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // ================== UI ==================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 14, 125, 204),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Text(
              widget.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              widget.subtitle,
              style: const TextStyle(color: Color.fromARGB(255, 155, 124, 217)),
            ),

            const SizedBox(height: 20),

            const Text(
              "Pilih Buku",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // LIST PRODUK
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color.fromARGB(
                          255,
                          69,
                          111,
                          226,
                        ),
                        child: Text(
                          book.name[0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        book.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Rp ${book.price}"),
                      trailing: Checkbox(
                        activeColor: const Color.fromARGB(255, 190, 9, 148),
                        value: book.isSelected,
                        onChanged: (value) {
                          setState(() {
                            book.isSelected = value ?? false;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            // SUMMARY
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 59, 125, 225),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("Total Item"), Text("$totalItem")],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Harga",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rp $totalHarga",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 247, 247, 248),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // BUTTON BAYAR
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 61, 223, 16),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: totalItem == 0 ? null : showCheckout,
                child: const Text(
                  "Bayar Sekarang",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
