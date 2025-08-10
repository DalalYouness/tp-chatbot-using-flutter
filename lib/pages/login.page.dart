import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController loginUserNameController = TextEditingController();
  TextEditingController loginPassWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 500,
            color: Colors.white,
            child: Card.outlined(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image(image : AssetImage("imgs/ensetLogo.png"),width: 250,),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: loginUserNameController,
                      decoration: InputDecoration(
                        hintText: "Userame",
                        //icon: Icon(Icons.lock),
                        //prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).primaryColor
                          )
                        )
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: loginPassWordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        //icon: Icon(Icons.lock),
                        //prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.visibility),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).primaryColor
                              )
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        String userName = loginUserNameController.text;
                        String password = loginPassWordController.text;
                        if(userName == "admin" && password == "1234") {
                              Navigator.of(context).pop();
                            Navigator.pushNamed(context, "/bot");
                        }

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor
                        ),
                        child: Text("Login", style: TextStyle(
                          fontSize: 23,
                          color: Colors.white
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
