import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:language_translator/ui/custom/custom_widget.dart';
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
    "Latin",
    "Italian",
  ];

  List<String> languageCodes = [
    "en",
    "bn",
    "hi",
    "ar",
    "de",
    "ru",
    "es",
    "ur",
    "la",
    "it"
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
      return ReusableMethod().myToast(e.toString()).then((value) {
        setState(() {
          isLoaded = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.black.withAlpha(88),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton(
                          iconEnabledColor: Colors.white,
                          dropdownColor: Colors.grey,
                          iconSize: 40,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
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
                          }),
                      const Text(
                        "To",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      DropdownButton(
                          iconEnabledColor: Colors.white,
                          dropdownColor: Colors.grey,
                          iconSize: 40,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
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
                          }),
                    ],
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Form(
                          key: _key,
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            maxLines: 3,
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
                        ),
                      )),
                ],
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
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomTextButton(
                              text: "Add Favorite", onPressed: () {}),
                          CustomTextButton(
                              text: "Add History", onPressed: () {}),
                          CustomTextButton(
                              text: "Copy All",
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: result))
                                    .then((value) {
                                  ReusableMethod().myToast("Copyed");
                                });
                              })
                        ]),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: SingleChildScrollView(
                        child: Text(
                          result,
                          style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
