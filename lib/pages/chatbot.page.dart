import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ChatBotPage extends StatefulWidget {
   ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
   var messages = [
     {"type" : "user" , "content" : "Bonjour"},
     {"type" : "assistant" , "content" : "Salut Que puis-je faire pour vous"},
   ];

    TextEditingController userController = TextEditingController();
    ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YD ChatBot",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pop();
            Navigator.pushNamed(context, "/");
          }, icon: Icon(Icons.logout),
          color: Theme.of(context).indicatorColor,)
        ],
    ),
    body: Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            itemCount: messages.length,
            itemBuilder: (context,index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        messages[index]['type'] == 'user' ?
                            SizedBox(width: 80,)
                        :  SizedBox(width: 0,),
                        Expanded(
                          child: Card.outlined(
                            margin: EdgeInsets.all(6),
                            color: messages[index]['type'] == 'user'? Color.fromARGB(60,0,255,0)
                                : Colors.white ,
                            child: ListTile(
                              title: Text("${messages[index]['content']}"),
                            ),
                          ),
                        ),
                        messages[index]['type'] == 'assistant' ?
                        SizedBox(width: 80,)
                            :  SizedBox(width: 0,),
                      ],
                    ),
                    Divider()
                  ],
                );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: userController,
                  decoration: InputDecoration(
                      hintText: "Userame",
                      //icon: Icon(Icons.lock),
                      //prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).primaryColor
                          )
                      )
                  ),
                ),
              ),
              IconButton(onPressed: (){

                String question = userController.text;
                //Uri uri = Uri.https("","");
                Uri uri = Uri.parse("http://localhost:11434/v1/chat/completions");
                var headers = {
                  "Content-Type":"application/json"
                };

                var body = {
                  "model": "gemma:2b" , "messages": [
                    {"role": "user" , "content" : question}
                  ]
                };
                http.post(uri,headers: headers, body: json.encode(body))
                .then((resp){
                  var aiResponse = json.decode(resp.body);
                  String answer = aiResponse['choices'][0]['message']['content'];
                  setState(() {
                    messages.add({"type" : "user" , "content" : question});
                    messages.add({"type" : "assistant" , "content" : answer});
                    scrollController.jumpTo(
                      scrollController.position.maxScrollExtent + 800
                    );
                  });
                }).catchError((err){
                  print(err);
                });

              },
                  icon: Icon(Icons.send))
            ],
          ),
        ),
      ],
    )
    );
  }
}
