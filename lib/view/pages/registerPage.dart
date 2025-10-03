import 'package:flutter/material.dart';
import 'package:ziemart_frontend/config/app_asset.dart';
import 'package:gap/gap.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? _role = "pembeli"; // default pembeli

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController extraController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDD0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Gap(20),
            Image.asset(AppAssets.logo, width: 100, height: 100),
            const Gap(20),
            const Text(
              "REGISTER",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const Gap(20),

            // username
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Username",
                filled: true,
                fillColor: Colors.brown,
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const Gap(12),

            // email dan phone #pakai row biar sejajar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email",
                      filled: true,
                      fillColor: Colors.brown,
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: "No. Handphone",
                      filled: true,
                      fillColor: Colors.brown,
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const Gap(12),

            // password
            TextField(
              controller: passwordController,
              obscureText: true, // biar jadi titik"
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Password",
                filled: true,
                fillColor: Colors.brown,
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const Gap(12),

            // konfir password
            TextField(
              controller: confirmPasswordController,
              obscureText: true, // biar jadi titik"
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: "Konfirmasi Password",
                filled: true,
                fillColor: Colors.brown,
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const Gap(12),

            // radio tombol pembeli/penjual
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Radio(
                      value: "pembeli",
                      // ignore: deprecated_member_use
                      groupValue: _role,
                      // ignore: deprecated_member_use
                      onChanged: (value) {
                        setState(() {
                          _role = value.toString();
                          extraController.clear();
                        });
                      },
                    ),
                    const Text("Pembeli"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "penjual",
                      // ignore: deprecated_member_use
                      groupValue: _role,
                      // ignore: deprecated_member_use
                      onChanged: (value) {
                        setState(() {
                          _role = value.toString();
                          extraController.clear();
                        });
                      },
                    ),
                    const Text("Penjual"),
                  ],
                ),
              ],
            ),

            // field sesuai role
            TextField(
              controller: extraController,
              decoration: InputDecoration(
                prefixIcon: Icon(_role == "pembeli" ? Icons.person : Icons.store),
                labelText: _role == "pembeli" ? "Full Name" : "Nama Toko",
                filled: true,
                fillColor: Colors.brown,
                labelStyle: const TextStyle(color: Colors.white),
                border: const OutlineInputBorder(),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const Gap(60),

            // tombol daftar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Logic untuk daftar
                  print("Role: $_role");
                  print("Extra field: ${extraController.text}");
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "DAFTAR",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}