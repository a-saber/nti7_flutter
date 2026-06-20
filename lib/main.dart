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

class CountryModel {
  int id;
  int phoneCode;
  String name;

  CountryModel({required this.id, required this.phoneCode, required this.name});
}

class HomeScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  // List<String> countries = ['Egypt', 'KSA', 'USA', 'UAE', 'Jordan'];
  List<CountryModel> countries = [
    CountryModel(id: 1, phoneCode: 20, name: 'Egypt'),
    CountryModel(id: 2, phoneCode: 966, name: 'KSA'),
    CountryModel(id: 3, phoneCode: 1, name: 'USA'),
  ];

  /*
  Country Model
  - id
  - name
  - phoneCode

  [
    CountryModel(id: 1, name: 'Egypt', phoneCode: 20),
    CountryModel(id: 2, name: 'KSA', phoneCode: 966),
  ]

  design : PhoneCode + CountryName
  value: id
   */
  List<String> names = ['Ahmed', 'Mohamed', 'Sayed', 'Ahmed', 'Mohamed'];

  @override
  Widget build(BuildContext context) {
    print('rebuild');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.arrow_back, size: 30, color: Colors.grey),
        title: Text(
          'Home Screen',
          style: TextStyle(
            color: Colors.red,
            backgroundColor: Colors.grey,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            wordSpacing: 10,
            letterSpacing: 3,
          ),
        ),
        actions: [
          Icon(Icons.check),
          SizedBox(width: 10),
          Text('Hello'),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  // if(value?.contains('@')== false){
                  //   return 'Enter Valid Email';
                  // }
                  // return null;

                  //  Regex
                  // ahmed@gmail.com
                  var emailSimpleRegex = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9]+@+[a-zA-Z0-9]+\.[a-zA-Z]{2}",
                  );
                  if (!emailSimpleRegex.hasMatch(value ?? '')) {
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
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
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
                onChanged: (String? value) {
                  print(value);
                },
              ),

              SizedBox(height: 20),
              DropdownButtonFormField<int>(
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(Icons.home),
                        SizedBox(width: 10),
                        Text('E'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 10),
                        Text('Profile'),
                      ],
                    ),
                  ),
                ],
                onChanged: (int? value) {
                  print('Selected Value: $value');
                },
                validator: (int? value) {
                  if (value == null) {
                    return 'Select Option';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter Your Email',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              TestCheckBox(),

              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: DropdownButton<CountryModel>(
                    // decoration: InputDecoration(
                    //   labelText: 'Code',
                    // ),
                    items: countries
                        .map(
                          (CountryModel oldElement) => DropdownMenuItem(
                            value: oldElement,
                            child: Text('${oldElement.phoneCode}'),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      print(value?.id);
                      print('+${value?.phoneCode} ${phoneController.text}');
                    },
                  ),
                  // suffixIcon: Icon(Icons.check),
                ),
              ),

              SizedBox(height: 20),
              GestureDetector(onTap: () {}, child: Text(r'Hello \n World')),
              InkWell(onTap: () {}, child: Text(r'Hello \n World')),

              IconButton(onPressed: (){}, icon: Icon(Icons.add),
              style: IconButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white
              ),),
              TextButton(onPressed: (){}, child: Text('data')),
              ElevatedButton(
                onPressed: () {
                  // print(controller.text);
                  if (formKey.currentState?.validate() == true) {
                    // call api();
                    print('Validated true');
                    print(controller.text);
                  }
                  // print('${}')
                },
                child: Text('BTN'),
              ),
              SizedBox(height: 20),
              TestSwitch(),
              ElevatedButton(
                  onPressed: (){
                    print('tabbed');
                  },
                  child: Text('BTN'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),

              )

            ],
          ),
        ),
      ),
    );
  }
}

class TestCheckBox extends StatefulWidget {
  @override
  State<TestCheckBox> createState() {
    return TestCheckBoxState();
  }
}

// Switch
class TestCheckBoxState extends State<TestCheckBox> {
  bool? checkBox = true;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Colors.green,
      checkColor: Colors.red,
      title: Text('Allow Contact'),
      subtitle: Text('Allow contact to see your name and profile picture'),
      value: checkBox,
      onChanged: (value) {
        setState(() {
          checkBox = value;
        });
      },
    );
  }
}

class TestSwitch extends StatefulWidget {
  @override
  State<TestSwitch> createState() {
    return TestSwitchState();
  }
}

class TestSwitchState extends State<TestSwitch> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor:  Colors.green,
      inactiveThumbColor: Colors.cyan,
      activeTrackColor: Colors.red,
      inactiveTrackColor: Colors.amber,
      onFocusChange: (bool value){
        print('On Focus Change: $value');
      },
      title: Text('Allow Contact'),
      subtitle: Text('Allow contact to see your name and profile picture'),
      value: value,
      onChanged: (v) {
        setState(() {
          value = v;
        });
      },
    );
  }
}
