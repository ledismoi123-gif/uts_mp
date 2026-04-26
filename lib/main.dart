import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ================= APP =================
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/forgot': (context) => ForgotPasswordScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}

// ================= LOGIN =================

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  bool isLoading = false;
  bool isPasswordVisible = false;

  String? errorMessage;

  void login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    await Future.delayed(Duration(seconds: 2));

    if (email == "ledismoi123@gmail.com" && password == "12345678A") {
      Navigator.pushReplacementNamed(
        context,
        '/dashboard',
        arguments: email,
      );
    } else {
      setState(() {
        isLoading = false;
        errorMessage = "Email atau password salah";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 380,
              padding: EdgeInsets.all(20),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.lock, size: 80, color: Colors.blue),

                        SizedBox(height: 10),

                        Text(
                          "MATERIAL",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),

                        SizedBox(height: 10),

                        if (errorMessage != null)
                          Text(
                            errorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),

                        SizedBox(height: 20),

                        // EMAIL
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email kosong";
                            }
                            if (!RegExp(r'\S+@\S+\.\S+')
                                .hasMatch(value)) {
                              return "Format email salah";
                            }
                            return null;
                          },
                          onChanged: (v) => email = v.trim(),
                        ),

                        SizedBox(height: 15),

                        // PASSWORD
                        TextFormField(
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible =
                                      !isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password kosong";
                            }
                            if (value.length < 8) {
                              return "Minimal 8 karakter";
                            }
                            if (!RegExp(r'[A-Za-z]').hasMatch(value) ||
                                !RegExp(r'[0-9]').hasMatch(value)) {
                              return "Harus huruf & angka";
                            }
                            return null;
                          },
                          onChanged: (v) => password = v.trim(),
                        ),


                        SizedBox(height: 20),

                        isLoading
                            ? CircularProgressIndicator()
                            : SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: login,
                                  child: Text("LOGIN SEKARANG"),
                                ),
                              ),

                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgot');
                          },
                          child: Text("Lupa Password?"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ================= FORGOT PASSWORD (FIXED + KECIL) =================
class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}


class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = "";
  bool isLoading = false;

  void sendReset() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    await Future.delayed(Duration(seconds: 2));

    setState(() => isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Link reset dikirim ke email")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 350, // ✅ diperkecil
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 10),

                  Text(
                    "FORGOT PASSWORD",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  Form(
                    key: _formKey,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email kosong";
                        }
                        if (!RegExp(r'\S+@\S+\.\S+')
                            .hasMatch(value)) {
                          return "Email tidak valid";
                        }
                        return null;
                      },
                      onChanged: (v) => email = v,
                    ),
                  ),

                  SizedBox(height: 20),

                  isLoading
                      ? CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: sendReset,
                            child: Text("Kirim Link Reset"),
                          ),
                        ),

                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Kembali"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ================= DASHBOARD =================

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final email =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),

          Text(
            "Selamat datang, $email",
            style: TextStyle(fontSize: 20),
          ),

          SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text("Menu ${index + 1}"),
                    subtitle: Text("Item dashboard"),
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