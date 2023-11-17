import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:language_translator/ui/custom/custom_widget.dart';
import 'package:speech_to_text/speech_to_text.dart';
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
  bool isListening = false;
  FlutterTts flutterTts = FlutterTts();
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

  pasteData() async {
    ClipboardData? clipboardData =
        await Clipboard.getData(Clipboard.kTextPlain);

    if (clipboardData != null) {
      setState(() {
        controller.text = clipboardData.text ?? '';
      });
    } else {
      ReusableMethod().myToast("Clipboard is Empty");
    }
  }

  voiceToText() async {
    if (isListening == true) {
      var availble = await SpeechToText().initialize();
      if (availble) {
        SpeechToText().listen(
          onResult: (value) {
            setState(() {
              controller.text = value.recognizedWords;
            });
          },
        ).then((value) {
          setState(() {
            isListening = false;
          });
        });
      }
    }
  }

  speakText() async {
    await flutterTts.speak(result);
    flutterTts.setLanguage(to);
    flutterTts.setPitch(1.0);
    flutterTts.setSpeechRate(0.5);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Translator"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white38,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black54,
                                width: 1.r,
                                style: BorderStyle.solid)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DropdownButton(
                              underline: Container(),
                              iconEnabledColor: Colors.black,
                              dropdownColor: Colors.white,
                              iconSize: 40.sp,
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
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
                          Text(
                            "To",
                            style: TextStyle(
                                fontSize: 25.sp,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                          DropdownButton(
                              underline: Container(),
                              iconEnabledColor: Colors.black,
                              dropdownColor: Colors.white,
                              iconSize: 40.sp,
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
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
                    ),
                    Container(
                        height: 170.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Form(
                            key: _key,
                            child: SingleChildScrollView(
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                maxLines: 5,
                                controller: controller,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return null;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomIconButton(
                            iconData: Icons.paste,
                            onPressed: () {
                              pasteData();
                            }),
                        CustomIconButton(
                            iconData: Icons.mic,
                            onPressed: () {
                              setState(() {
                                isListening = true;
                              });
                              voiceToText();
                            }),
                        CustomIconButton(
                            iconData: Icons.cancel,
                            onPressed: () {
                              controller.clear();
                            }),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 100.w, vertical: 15.h))),
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
                      : Text(
                          "Translate",
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        )),
              Container(
                height: 250.h,
                width: double.infinity,
                margin: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                        border: const Border(
                            bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomIconButton(
                                iconData: Icons.favorite, onPressed: () {}),
                            CustomIconButton(
                                iconData: Icons.volume_up,
                                onPressed: () {
                                  speakText();
                                }),
                            CustomIconButton(
                                iconData: Icons.copy_all,
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(text: result))
                                      .then((value) {
                                    return ReusableMethod().myToast("Copyed");
                                  });
                                }),
                          ]),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r))),
                        child: SingleChildScrollView(
                          child: SelectableText(
                            result,
                            style: TextStyle(
                                fontSize: 22.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
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
      ),
    );
  }
}
