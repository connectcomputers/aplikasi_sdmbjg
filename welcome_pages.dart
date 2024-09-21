part of 'pages.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const WelcomePages(),
//       // initialRoute: "/",
//       // routes: {
//       //   "/": (BuildContext context) => LoginView(),
//       //   "/RegisterView": (context) => RegisterView(),
//       // },

//       routes: <String, WidgetBuilder>{
//         '/welcomepage': (BuildContext context) => const WelcomePages(),
//         '/dashboard': (BuildContext context) => const DashBoard(
//               username: 'username',
//             ),
//         '/form_ppdb': (BuildContext context) => const form_ppdb(),
//       },
//     );
//   }
// }

class WelcomePages extends StatefulWidget {
  const WelcomePages({super.key});

  @override
  State<WelcomePages> createState() => _WelcomePagesState();
}

class _WelcomePagesState extends State<WelcomePages> {
  // final formkey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController nama_lengkap = TextEditingController();
  TextEditingController no_wa = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController konfimasi_password = TextEditingController();

  bool _isHiddenPassword = true;
  bool _isHiddenKonfPassword = true;

  bool _ischecked = false;

  Future _simpan() async {
    const urik2 = 'http://127.0.0.1/api_sdmbjgfile/register.php';
    debugPrint(urik2);
//    print(urik2);
    final respon = await http.post(Uri.parse(urik2), body: {
      'username': username.text.toString(),
      'nama_lengkap': nama_lengkap.text.toString(),
      'no_wa': no_wa.text.toString(),
      'password': password.text.toString(),
      'konfirmasi_password': konfimasi_password.text.toString(),
    });
    print(respon);
    if (respon.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future _login() async {
    // final url =
    //     Uri.http("192.168.0.13", '/api_sdmbjgfile/login.php', {'q': '{http}'});
    // final response = await http.post(url, body: {
    // const urlok = 'http://192.168.0.13/api_sdmbjgfile/login.php';
    // final response = await http.post(Uri.parse(urlok), body: {
    // const url = 'http://192.168.0.13/api_sdmbjgfile/login.php';
    const url = 'http://127.0.0.1/api_sdmbjgfile/login.php';
    final response = await http.post(Uri.parse(url), body: {
      "username": username.text,
      "password": password.text,
      // "username": username.text.toString(),
      // "password": password.text.toString(),
      // "username": username.toString(),
      // "password": password.toString(),
    });
    // var data = jsonDecode(response.body);
    var data = json.decode(response.body);
    // var data = response.statusCode;
    debugPrint(data.toString());
    if (data == 'Success') {
      // if (data.toString() == 'Login Berhasil') {
      // if (data.length > 0) {
      // print(data.toString());
      // Fluttertoast.showToast(
      //   msg: 'Login Succesful',
      //   backgroundColor: Colors.green,
      //   textColor: Colors.white,
      //   toastLength: Toast.LENGTH_SHORT,
      // );

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const DashBoard(),
      //   ),
      // );
      // DashBoard().call();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const DashBoard(username: 'username')));
      // _munculLayarRegister();
    } else {
      // Fluttertoast.showToast(
      //   backgroundColor: Colors.red,
      //   textColor: Colors.white,
      //   msg: 'email and Password invalid',
      //   toastLength: Toast.LENGTH_SHORT,
      // );
      // setState(() => );
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Gagal'),
          content: Text('Email atau password salah.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      ); // _munculLayarLogin();
      // _gagalLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            Image.asset(
              'assets/images/login_images.png',
              height: 333,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Assalamualaikum Wr. Wb.',
              style: dangerTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Selamat Datang di \nSD Muhammadiyah Benjeng \nThe Best Choice of Islamic Education',
              style: whiteTextStyle.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                child: ElevatedButton(
                    onPressed: () {
                      _munculLayarRegister.call();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Create Account',
                      style: whiteTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: whiteColor),
                    ))),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                child: ElevatedButton(
                    onPressed: () {
                      _munculLayarLogin.call();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: bgtblLogin,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Login',
                      style: whiteTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: whiteColor),
                    ))),
            const SizedBox(
              height: 80,
            ),
            Text(
              'All Right Reserved by IT-Dept SDMBJG @2024',
              style: whiteTextStyle.copyWith(color: blackColor, fontSize: 10),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  void _munculLayarRegister() {
    setState(() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Wrap(
                  children: [
                    Container(
                      // Navigator.pushNamed(context, '/registerview');

                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          ),
                        ),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Silahkan...',
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 20, color: blackColor),
                                      ),
                                      Text(
                                        'Register',
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: blackColor),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Image.asset(
                                          'assets/images/Close.png',
                                          height: 30,
                                          width: 30),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextField(
                                controller: username,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'hamidioke84@gmail.com',
                                  labelText: 'Username / Email',
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: nama_lengkap,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Muammar Hamidi',
                                  labelText: 'Nama Lengkap',
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: no_wa,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: '081232188425',
                                  labelText: 'No Whatsapp',
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: password,
                                obscureText: _isHiddenPassword,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Password',
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                      //KETIKA ICON DI KLIK
                                      icon: Icon(_isHiddenPassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined),
                                      onPressed: () {
                                        setState(() {
                                          _isHiddenPassword =
                                              !_isHiddenPassword;
                                        });
                                      }),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: konfimasi_password,
                                obscureText: _isHiddenKonfPassword,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Konfimasi Password',
                                  labelText: 'Konfimasi Password',
                                  suffixIcon: IconButton(
                                      //KETIKA ICON DI KLIK
                                      icon: Icon(_isHiddenKonfPassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined),
                                      onPressed: () {
                                        setState(() {
                                          _isHiddenKonfPassword =
                                              !_isHiddenKonfPassword;
                                        });
                                      }),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width -
                                      2 * defaultMargin,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        _simpan();
                                        username.clear();
                                        nama_lengkap.clear();
                                        no_wa.clear();
                                        password.clear();
                                        konfimasi_password.clear();

                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: secondaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: Text(
                                        'Register',
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: whiteColor),
                                      ))),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have account?',
                                    style: whiteTextStyle.copyWith(
                                        color: blackColor, fontSize: 10),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      _munculLayarLogin.call();
                                    },
                                    child: Text(
                                      'Login',
                                      style: whiteTextStyle.copyWith(
                                          color: dangerColor, fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: defaultMargin,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          });
    });
  }

  void _munculLayarLogin() {
    setState(() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Wrap(
                  children: [
                    Container(
                      // Navigator.pushNamed(context, '/registerview');

                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          ),
                        ),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Silahkan...',
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 20, color: blackColor),
                                      ),
                                      Text(
                                        'Login',
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: blackColor),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Image.asset(
                                          'assets/images/Close.png',
                                          height: 30,
                                          width: 30),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextField(
                                controller: username,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'hamidioke84@gmail.com',
                                  labelText: 'Username / Email',
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: password,
                                obscureText: _isHiddenPassword,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Password',
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                      //KETIKA ICON DI KLIK
                                      icon: Icon(_isHiddenPassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined),
                                      onPressed: () {
                                        setState(() {
                                          _isHiddenPassword =
                                              !_isHiddenPassword;
                                        });
                                      }),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        border: Border.all(
                                            color: blackColor, width: 3),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Checkbox(
                                      value: _ischecked,
                                      checkColor: whiteColor,
                                      onChanged: (value) {
                                        setState(() {
                                          _ischecked = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text('Remember me',
                                      style: whiteTextStyle.copyWith(
                                          color: blackColor, fontSize: 10)),
                                  const Spacer(),
                                  Text(
                                    'forgot Password?',
                                    style: whiteTextStyle.copyWith(
                                        color: blackColor, fontSize: 10),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width -
                                      2 * defaultMargin,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        _login();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: bgtblLogin,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: Text(
                                        'Login',
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: whiteColor),
                                      ))),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don’t have an account?',
                                    style: whiteTextStyle.copyWith(
                                        color: blackColor, fontSize: 10),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      _munculLayarRegister.call();
                                    },
                                    child: Text(
                                      'Register',
                                      style: whiteTextStyle.copyWith(
                                          color: dangerColor, fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: defaultMargin,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          });
    });
  }

  void _gagalLogin() {
    setState(() {
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'email and Password invalid',
        toastLength: Toast.LENGTH_SHORT,
      );
    });
  }
}
