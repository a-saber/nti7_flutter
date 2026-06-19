import 'package:flutter/material.dart';

// SOLID
// S - Single Responsibility Principle
// O - Open/Closed Principle
// L - Liskov Substitution Principle
// I - Interface Segregation Principle
// D - Dependency Inversion Principle

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {

  TextEditingController controller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.grey
        ),
        title: Text('Home Screen', style: TextStyle(
          color: Colors.red,
          backgroundColor: Colors.grey,
          fontSize: 30, fontWeight: FontWeight.bold,
          wordSpacing: 10,
          letterSpacing: 3
        ),),
        actions: [
          Icon(Icons.check),
          SizedBox(width: 10,),
          Text('Hello'),
          SizedBox(width: 20,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (String? value){
                  // if(value?.contains('@')== false){
                  //   return 'Enter Valid Email';
                  // }
                  // return null;

                  //  Regex
                  // ahmed@gmail.com
                  var emailSimpleRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9]+@+[a-zA-Z0-9]+\.[a-zA-Z]{2}");
                  if(!emailSimpleRegex.hasMatch(value??'')){
                    return 'Enter Valid Email';
                  }
                  return null;
                },
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter Your Email',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.green
                    )
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: Colors.grey
                    )
                  )
                ),
                // enabled: false,
                // readOnly: true,
                // onTap: (){
                //   // print('Text Field  is Tapped');
                //   showDatePicker(
                //     context: context,
                //     firstDate: DateTime.now(),
                //     lastDate: DateTime.now().add(Duration(days: 365)),
                //   );
                // },
                onChanged: (String? value){
                  print(value);
                },

              ),

              SizedBox(
                height: 20,
              ),
              Text(r'Hello \n World'),

              ElevatedButton(onPressed: (){
                // print(controller.text);
                if(formKey.currentState?.validate() == true){
                  // call api();
                  print('Validated true');
                  print(controller.text);
                }
              }, child: Text('BTN'))
            ],
          ),
        ),
      )
    );
  }
}
