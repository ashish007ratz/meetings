import 'package:flutter/material.dart';
import 'package:project2/screens/products/products.dart';
import '../../colors.dart';
import '../../models/auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
   String email = "";
   String password = "";
  bool isLoading = false;
  String? error;
  bool get valueIsEmpty => (email  == "" || password == "");

  var formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promilo", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // heading
                Center(
                    child: Text(
                  "Hey, Welcome Back!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: textPrimaryColor),
                )),
                SizedBox(height: 35),
                // text fields
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Please Sign in to continue",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: textPrimaryColor),
                  ),
                ),
                SizedBox(height: 10),
                /// number email
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 10, right: 10, top: 13, bottom: 13),
                    labelText: "Enter Email or Mob No.",
                    labelStyle: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                        fontSize: 15), // Adjust based on your design
                    hintText: "Enter your input", // Optional hint text
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                            width: 2)), // Or other border styles
                  ),
                  onChanged: (v) {
                    email = v ?? "";
                    setState(() {});
                  },
                  validator: (value) {
                    if (value == null || value == "")
                      return "This field cannot be empty";
                    return null; // Return an error message if invalid
                  },
                ),
                SizedBox(height: 5),
                // otp
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text("Sign in with OTP",
                          style: TextStyle(
                              fontSize: 14,
                              color: textSecondaryColor,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                // Enter password
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: textPrimaryColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                /// password field
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 10, right: 10, top: 13, bottom: 13),
                    labelText: "Enter Password",
                    labelStyle: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                        fontSize: 15), // Adjust based on your design
                    hintText: "Enter your input", // Optional hint text
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                            width: 2)), // Or other border styles
                  ),
                  onChanged: (v) {
                    password = v ?? "";
                    setState(() {});
                  },
                  validator: (value) {
                    if (value == null || value == "")
                      return "This field cannot be empty";
                    return null; // Return an error message if invalid
                  },
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){
                      rememberMe = !rememberMe;
                      setState(() {});
                    }, icon: Icon(
                      rememberMe? Icons.check_box :Icons.check_box_outline_blank_outlined,
                      color:rememberMe? liteColor:Colors.grey.shade400,
                    ),),
                    Text("Remember Me",
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade400)),
                    Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () {},
                      child: Text("Forget Password",
                          style: TextStyle(
                              fontSize: 14,
                              color: textSecondaryColor,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                /// error container
                // if(error != null)
                  AnimatedContainer(
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15)
                    ),
                      padding:error == null? null: EdgeInsets.all(10),
                      margin: error == null? null: EdgeInsets.only(top: 10, bottom: 10),
                      duration: Duration(seconds: 3),child:error == null? null:Center(child: Text(error??"", style: TextStyle(color: Colors.red),))),
                /// user Login button
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed:() async{
                            if(!valueIsEmpty){
                              isLoading = true;
                              error = null;
                              setState(() {});

                              /// User login
                              if (formKey.currentState?.validate() ?? false) {
                                /// user creds
                                await Future.delayed(Duration(seconds: 2));
                                formKey.currentState!.save();
                                try{
                                  await LoginCreds(email, password).userLogIn();
                                  /// navigate to home/product page
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> ProductsPage()));
                                }catch(e){
                                  error = e.toString();
                                }
                              }
                              isLoading = false;
                              setState(() {});
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if(!isLoading)...[
                                Text('Submit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))],
                              /// handling loading
                              if(isLoading)...[
                                Text('Submitting...',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                SizedBox(width: 10,),
                                SizedBox(height: 20,width: 20,child: CircularProgressIndicator(strokeWidth: 2.5,color: Colors.white,),)
                              ]
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: valueIsEmpty? textSecondaryColor.withOpacity(0.3) :textSecondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                /// bottom things
                SizedBox(height: 35),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: Colors.grey.shade200,
                    )),
                    SizedBox(width: 3),
                    Text("Or",
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    SizedBox(width: 3),
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: Colors.grey.shade200,
                    )),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                /// fake image need to improve
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          child: Image.asset('assets/images/assets.png',fit: BoxFit.fitWidth),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Business User?",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Don\'t Have Account?",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Login Here",
                        style: TextStyle(
                            fontSize: 14,
                            color: textSecondaryColor,
                            fontWeight: FontWeight.w600)),
                    Text("Sign Up",
                        style: TextStyle(
                            fontSize: 14,
                            color: textSecondaryColor,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By continuing, you agreed to",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Promilo\'s",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Terms of Use & Private Policy.",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
