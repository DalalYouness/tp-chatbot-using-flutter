import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YD ChatBot",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    ),
    body: Column(
      children: [
        Expanded(
          child: ListView.builder(
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
                String response = "response to ${question}";
                setState(() {

                });
                messages.add({"type" : "user" , "content" : question});
                messages.add({"type" : "assistant" , "content" : response});


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
