import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:translator/translator.dart';

class Translator extends StatefulWidget {
  const Translator({super.key});

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  List<String> languages = [
    "English",
    "Bangla",
    "Hindi",
    "Arabic",
    "German",
    "Russian",
    "Spanish",
    "Urdu",
    "lapanese",
    "Italian",
  ];

  List<String> languageCodes = [
    "en",
    "bn",
    "hi",
    "de",
    "ru",
    "es",
    "ur",
    "ja",
    "it",
  ];
  String from = "en";
  String to = "bn";
  String fromSelectedLanguage = "English";
  String toSelectedLanguage = "Bangla";
  String result = "";
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  var isLoaded = false;

  final translator = GoogleTranslator();
  translate() async {
    try {
      await translator
          .translate(controller.text, from: from, to: to)
          .then((value) {
        result = value.text;
        setState(() {});
      }).then((value) {
        setState(() {
          isLoaded = false;
        });
      });
    } catch (e) {
      return Fluttertoast.showToast(
              msg: e.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0)
          .then((value) {
        setState(() {
          isLoaded = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 114, 114),
      appBar: AppBar(
        title: const Text("Translator App",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black.withAlpha(98),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "From",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      DropdownButton(
                          value: fromSelectedLanguage,
                          items: languages.map((language) {
                            return DropdownMenuItem(
                              value: language,
                              child: Text(language),
                              onTap: () {
                                if (language == languages[0]) {
                                  from = languageCodes[0];
                                } else if (language == languages[1]) {
                                  from = languageCodes[1];
                                } else if (language == languages[2]) {
                                  from = languageCodes[2];
                                } else if (language == languages[3]) {
                                  from = languageCodes[3];
                                } else if (language == languages[4]) {
                                  from = languageCodes[4];
                                } else if (language == languages[5]) {
                                  from = languageCodes[5];
                                } else if (language == languages[6]) {
                                  from = languageCodes[6];
                                } else if (language == languages[7]) {
                                  from = languageCodes[7];
                                } else if (language == languages[8]) {
                                  from = languageCodes[8];
                                } else if (language == languages.last) {
                                  from = languageCodes.last;
                                }
                                setState(() {});
                              },
                            );
                          }).toList(),
                          onChanged: (value) {
                            fromSelectedLanguage = value!;
                          })
                    ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "To",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      DropdownButton(
                          value: toSelectedLanguage,
                          items: languages.map((language) {
                            return DropdownMenuItem(
                              value: language,
                              child: Text(language),
                              onTap: () {
                                if (language == languages[0]) {
                                  to = languageCodes[0];
                                } else if (language == languages[1]) {
                                  to = languageCodes[1];
                                } else if (language == languages[2]) {
                                  to = languageCodes[2];
                                } else if (language == languages[3]) {
                                  to = languageCodes[3];
                                } else if (language == languages[4]) {
                                  to = languageCodes[4];
                                } else if (language == languages[5]) {
                                  to = languageCodes[5];
                                } else if (language == languages[6]) {
                                  to = languageCodes[6];
                                } else if (language == languages[7]) {
                                  to = languageCodes[7];
                                } else if (language == languages[8]) {
                                  to = languageCodes[8];
                                } else if (language == languages.last) {
                                  to = languageCodes.last;
                                }
                                setState(() {});
                              },
                            );
                          }).toList(),
                          onChanged: (value) {
                            toSelectedLanguage = value!;
                          })
                    ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15))),
                onPressed: () {
                  setState(() {
                    isLoaded = true;
                  });
                  if (_key.currentState!.validate()) {
                    // ignore: void_checks
                    return translate();
                  } else {
                    setState(() {
                      isLoaded = false;
                    });
                  }
                },
                child: isLoaded == true
                    ? const CircularProgressIndicator(
                        color: Colors.blue,
                      )
                    : const Text(
                        "Translate",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      )),
            Container(
              height: 250,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(child: Text(result)),
            )
          ],
        ),
      ),
    );
  }
}
