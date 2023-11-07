import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:your_teacher/Pantallas/Available_Lessons.dart';
import 'package:your_teacher/Logica/flutterMethods.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:your_teacher/Dominios/user.dart';

class MyFind_Class extends StatefulWidget {
  const MyFind_Class({Key? key});

  @override
  State<MyFind_Class> createState() => _MyFind_ClassState();
}

class _MyFind_ClassState extends State<MyFind_Class> {  
  String selectedDate = "";  
  String countryValue = "";
  String? stateValue   = "";
  String? cityValue    = "";

  final FirebaseAuthHelper _authHelper = FirebaseAuthHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(           
      backgroundColor: const Color.fromRGBO(247, 225, 180, 1),
      body: Center(
        child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(246, 243,233, 1),              
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
            margin: const EdgeInsets.all(15.0),                  
            height: 600,
            child: Column(
              children: [                  
                Text('BUSCAR CLASE',
                  style: TextStyle(
                    color: Color.fromRGBO(35, 8, 113, 1),
                    fontSize: 40.0,
                    fontFamily: 'NerkoOne',
                  ),
                  textAlign: TextAlign.center,),   
                const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(''),
              ),                      
                CSCPicker(
                  ///Enable disable state dropdown [OPTIONAL PARAMETER]
                  showStates: true,

                  /// Enable disable city drop down [OPTIONAL PARAMETER]
                  showCities: false,

                  ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                  flagState: CountryFlag.DISABLE,

                  ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                      Border.all(color: Colors.grey.shade300, width: 1)),

                  ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade300,
                      border:
                      Border.all(color: Colors.grey.shade300, width: 1)),

                  ///placeholders for dropdown search field
                  countrySearchPlaceholder: "País",
                  stateSearchPlaceholder: "Localidad",
                  citySearchPlaceholder: "City",

                  ///labels for dropdown
                  countryDropdownLabel: "*País",
                  stateDropdownLabel: "*Localidad",
                  cityDropdownLabel: "*City",

                  ///Default Country
                  defaultCountry: CscCountry.Uruguay,

                  ///Disable country dropdown (Note: use it with default country)
                  //disableCountry: true,

                  ///Country Filter [OPTIONAL PARAMETER]
                //  countryFilter: [CscCountry.India,CscCountry.United_States,CscCountry.Canada],

                  ///selected item style [OPTIONAL PARAMETER]
                  selectedItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                  dropdownHeadingStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),

                  ///DropdownDialog Item style [OPTIONAL PARAMETER]
                  dropdownItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///Dialog box radius [OPTIONAL PARAMETER]
                  dropdownDialogRadius: 10.0,

                  ///Search bar radius [OPTIONAL PARAMETER]
                  searchBarRadius: 10.0,

                  ///triggers once country selected in dropdown
                  onCountryChanged: (value) {
                    setState(() {
                      ///store value in country variable
                      countryValue = value;
                    });
                  },

                  ///triggers once state selected in dropdown
                  onStateChanged: (value) {
                    setState(() {
                      ///store value in state variable
                      stateValue = value;
                    });
                  },

                  ///triggers once city selected in dropdown
                  onCityChanged: (value) {
                    setState(() {
                      ///store value in city variable
                      cityValue = value;
                    });
                  },
                ),                                                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(''),
                ),
                DateTimeFormField(
                  mode: DateTimeFieldPickerMode.date,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Fecha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  firstDate: DateTime.now().add(const Duration(days: 10)),
                  lastDate: DateTime.now().add(const Duration(days: 40)),
                  initialDate: DateTime.now().add(const Duration(days: 20)),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (DateTime? e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    print(value);
                    selectedDate = value.toString(); 
                  },
                ),             
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(''),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 191, 170, 1),
                    fixedSize: const Size.fromWidth(300),
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Ajusta el valor para controlar la cantidad de redondeo
                    ),
                  ),
                  child: const Text(
                    'BUSCAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'NerkoOne',
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 110, 108, 108),      // Choose the color of the shadow
                          blurRadius: 10.0,          // Adjust the blur radius for the shadow effect
                          offset: Offset(0.0, 4.0), // Set the horizontal and vertical offset for the shadow
                        ),
                      ],
                    ),
                  ),
                  onPressed: () async {                        

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => 
                          Available_Lessons(
                            teachersFilter: List.generate(
                                    20,
                                    (i) => User(
                                     uid:'Todo $i',
                                     email: 'A description of what needs to be done for Todo $i',
                                     displayName:'A description of what needs to be done for Todo $i',
                                     photoURL:'A description of what needs to be done for Todo $i',
                                     userType: UserType.profesor,
                                    ),
                                  ),
                          )
                      )
                    );
                  },
                ),              
              ],
            ),  
        ),                
      ),
    );
  }
}
