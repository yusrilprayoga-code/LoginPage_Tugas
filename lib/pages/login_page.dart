import 'package:flutter/material.dart';
import 'package:loginpage/pages/home_page.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  bool rememberMe = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: SafeArea(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Icon(
                    Icons.auto_awesome_mosaic,
                    color: Colors.pink,
                    size: 100,
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  //Welcome Back
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign in to acces your account",
                    style: TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  //Email Field
                  TextFormField(
                    controller: emailController,
                    //input color text field
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                      labelStyle: TextStyle(
                          color: Colors.grey), // Warna label menjadi abu-abu
                      hintStyle: TextStyle(color: Colors.grey),
                      //icon email
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email tidak boleh kosong";
                      } else if (!value.contains("@")) {
                        return "Email tidak valid";
                      } else {
                        return null;
                      }
                    },
                  ),

                  //Password Field
                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    //input color text field,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your Password",
                      labelStyle: TextStyle(
                          color: Colors.grey), // Warna label menjadi abu-abu
                      hintStyle: TextStyle(color: Colors.grey),
                      //icon password
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password tidak boleh kosong";
                      } else if (value.length < 6) {
                        return "Password minimal 6 karakter";
                      } else {
                        return null;
                      }
                    },
                  ),

                  //remember me and forgot password
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Menyusun elemen sejajar di kanan
                    children: [
                      TextButton(
                        onPressed: () {
                          // Tambahkan aksi yang sesuai saat tombol "Forgot Password?" ditekan.
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (newValue) {
                              setState(() {
                                rememberMe = newValue!;
                              });
                            },
                            activeColor: Colors.pink,
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //sign in button
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        String Email = 'yusril@gmail.com';
                        String Password = '123456789';
                        if (formKey.currentState!.validate()) {
                          if (emailController.text == Email &&
                              passwordController.text == Password) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Login Berhasil"),
                              ),
                            );
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                                (route) => false);
                          } else {
                            emailController.clear();
                            passwordController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Email atau Password salah"),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  //sign up
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Tambahkan aksi yang sesuai saat tombol "Sign Up" ditekan.
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.pink,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
