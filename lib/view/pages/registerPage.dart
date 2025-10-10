import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:ziemart_frontend/config/app_asset.dart';
import 'package:ziemart_frontend/view/pages/emailVerifiedPage.dart';
import 'package:ziemart_frontend/view/pages/loginPage.dart'; 

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String? _role = "buyer";
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController extraController = TextEditingController();

  Future<bool> tambahData() async {
    try {
      final response = await http.post(
        Uri.parse("http://127.0.0.1:8000/api/ziemart/register"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "username": usernameController.text.trim(),
          "email": emailController.text.trim(),
          "password": passwordController.text,
          "role": _role ?? "buyer",
          "phone_number": phoneController.text.trim(),
          "fullName": extraController.text.trim(),
        },
      );

      if (response.statusCode == 200) {
        debugPrint("Registrasi berhasil: ${response.body}");
        return true;
      } else {
        debugPrint(
          "Registrasi gagal: ${response.statusCode} - ${response.body}",
        );
        return false;
      }
    } catch (e) {
      debugPrint("Terjadi error saat kirim data: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDD0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Gap(30),
              Image.asset(AppAssets.logo, width: 100, height: 100),
              const Gap(20),
              const Text(
                "REGISTER",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const Gap(25),

              TextFormField(
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
                validator: (value) => value == null || value.isEmpty
                    ? "Username wajib diisi"
                    : null,
              ),
              const Gap(12),

              
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email",
                        filled: true,
                        fillColor: Colors.brown,
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email wajib diisi";
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value)) {
                          return "Format email tidak valid";
                        }
                        return null;
                      },
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: "No. Handphone",
                        filled: true,
                        fillColor: Colors.brown,
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: Colors.white),
                      validator: (value) => value == null || value.isEmpty
                          ? "Nomor HP wajib diisi"
                          : null,
                    ),
                  ),
                ],
              ),
              const Gap(12),

            
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password",
                  filled: true,
                  fillColor: Colors.brown,
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password wajib diisi";
                  } else if (value.length < 6) {
                    return "Minimal 6 karakter";
                  }
                  return null;
                },
              ),
              const Gap(12),

  
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  labelText: "Konfirmasi Password",
                  filled: true,
                  fillColor: Colors.brown,
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Konfirmasi password wajib diisi";
                  }
                  if (value != passwordController.text) {
                    return "Password tidak sama";
                  }
                  return null;
                },
              ),
              const Gap(12),

            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: "buyer",
                        groupValue: _role,
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
                  const Gap(10),
                  Row(
                    children: [
                      Radio(
                        value: "seller",
                        groupValue: _role,
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

           
              TextFormField(
                controller: extraController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    _role == "buyer" ? Icons.person : Icons.store,
                  ),
                  labelText: _role == "buyer" ? "Full Name" : "Nama Toko",
                  filled: true,
                  fillColor: Colors.brown,
                  labelStyle: const TextStyle(color: Colors.white),
                  border: const OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return _role == "buyer"
                        ? "Nama lengkap wajib diisi"
                        : "Nama toko wajib diisi";
                  }
                  return null;
                },
              ),
              const Gap(35),

              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (formKey.currentState!.validate()) {
                            setState(() => isLoading = true);
                            final success = await tambahData();
                            setState(() => isLoading = false);

                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Registrasi berhasil!",
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );

       
                              if (_role == "buyer") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              } else if (_role == "seller") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EmailVerifiedPage(
                                      email: emailController.text.trim(),
                                    ),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Gagal menambahkan data."),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "DAFTAR",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                ),
              ),
              const Gap(25),
            ],
          ),
        ),
      ),
    );
  }
}
