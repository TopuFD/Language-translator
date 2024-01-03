import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:language_translator/admob/banner.dart';
import 'package:language_translator/admob/internstitial.dart';
import 'package:language_translator/custom/custom_widget.dart';
import 'package:language_translator/model/my_data_model.dart';
import 'package:speech_to_text_google_dialog/speech_to_text_google_dialog.dart';
import 'package:translator/translator.dart';

class Translator extends StatefulWidget {
  const Translator({super.key});

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  String from = "en";
  String to = "bn";
  String fromSelectedLanguage = "English";
  String toSelectedLanguage = "Bengali";
  String result = "";
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  final favouriteBox = Hive.box("Favourite");
  final historyBox = Hive.box("History");
  FlutterTts flutterTts = FlutterTts();
  bool isLoaded = false;
  final translator = GoogleTranslator();
  final bannerClass = BannerClass();
  final internstialClass = InterstitialClass();
  bool bannerAd = false;

  List<String> languages = [
    "English",
    "Bengali",
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
  // ============google translator method==============>
  translate() async {
    try {
      if (_key.currentState!.validate()) {
        setState(() {
          isLoaded = true;
        });
        // ignore: void_checks
        await translator
            .translate(controller.text, from: from, to: to)
            .then((value) {
          result = value.text;
          setState(() {});
          internstialClass.showInterstitialAd();
        }).then((value) {
          setState(() {
            isLoaded = false;
            final historyData =
                DataModel(title: controller.text, description: result);
            historyBox.add(historyData);
            historyData.save();
          });
        });
      }
    } catch (e) {
      setState(() {
        isLoaded = false;
      });
      return ReusableMethod().myToast("Write Something...");
    }
  }
  // ================Paste method==============>
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

  //=================Voice to text method==========>
  voiceToText() async {
    await SpeechToTextGoogleDialog.getInstance().showGoogleDialog(
        onTextReceived: (data) {
      setState(() {
        controller.text = data.toString();
      });
    }).then((value) {
      ReusableMethod().myToast("Converted");
    });
  }

  // ===============Speak to text method===========>
  speakText() async {
    await flutterTts.speak(result);
    flutterTts.setLanguage(to);
    flutterTts.setPitch(1.0);
    flutterTts.setSpeechRate(0.5);
  }

  @override
  void initState() {
    super.initState();
    internstialClass.myInterstitialAd();
    bannerClass.bannerAd.load().then((value) {
      Timer(const Duration(seconds: 1), () {
        setState(() {
          bannerAd = true;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    bannerClass.bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AdWidget(ad: bannerClass.bannerAd);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "Translator",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color.fromARGB(255, 3, 104, 7),
            centerTitle: true,
          ),
          backgroundColor: const Color.fromARGB(210, 232, 255, 233),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: bannerAd == true ? 50.h : 5.h,
                ),
                child: SingleChildScrollView(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              DropdownButton(
                                  underline: Container(),
                                  iconEnabledColor:
                                      const Color.fromARGB(255, 3, 104, 7),
                                  dropdownColor: Colors.white,
                                  iconSize: 40.sp,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: const Color.fromARGB(255, 3, 104, 7),
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  value: fromSelectedLanguage,
                                  items: languages.map((language) {
                                    return DropdownMenuItem(
                                      value: language,
                                      child: Text(language),
                                      onTap: () {
                                        if (language == languages.first) {
                                          from = languages.first;
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
                                    color: const Color.fromARGB(255, 3, 104, 7),
                                    fontWeight: FontWeight.bold),
                              ),
                              DropdownButton(
                                  underline: Container(),
                                  iconEnabledColor:
                                      const Color.fromARGB(255, 3, 104, 7),
                                  dropdownColor: Colors.white,
                                  iconSize: 40.sp,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: const Color.fromARGB(255, 3, 104, 7),
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  value: toSelectedLanguage,
                                  items: languages.map((language) {
                                    return DropdownMenuItem(
                                      value: language,
                                      child: Text(language),
                                      onTap: () {
                                        if (language == languages.first) {
                                          to = languageCodes.first;
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
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Form(
                                  key: _key,
                                  child: SingleChildScrollView(
                                    child: TextFormField(
                                      style: TextStyle(
                                          fontSize: 19.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 4,
                                      controller: controller,
                                      decoration: InputDecoration(
                                          hintText: "Write here...",
                                          hintStyle: TextStyle(
                                              fontSize: 19.sp,
                                              color: Colors.black,
                                              fontStyle: FontStyle.italic),
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
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomIconButton(
                                      iconData: Icons.paste,
                                      onPressed: () {
                                        pasteData();
                                      }),
                                  CustomIconButton(
                                      iconData: Icons.mic,
                                      onPressed: () {
                                        voiceToText();
                                        setState(() {});
                                      }),
                                  CustomIconButton(
                                      iconData: Icons.cancel,
                                      onPressed: () {
                                        controller.clear();
                                        setState(() {
                                          result = "";
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            translate();
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 6.h),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 3, 104, 7),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: isLoaded == true
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                        "Translate",
                                        style: TextStyle(
                                            fontSize: 23.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                        ),
                        Container(
                          height: 200.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            crossAxisAlignment: (to == "ur" || to == "ar")
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomIconButton(
                                        iconData: Icons.favorite,
                                        onPressed: () {
                                          final data = DataModel(
                                              title: controller.text,
                                              description: result);

                                          favouriteBox.add(data);
                                          data.save().then((value) {
                                            return ReusableMethod()
                                                .myToast("Add Favourite");
                                          });
                                        }),
                                    CustomIconButton(
                                        iconData: Icons.volume_up,
                                        onPressed: () {
                                          speakText();
                                        }),
                                    CustomIconButton(
                                        iconData: Icons.copy_all,
                                        onPressed: () {
                                          Clipboard.setData(
                                                  ClipboardData(text: result))
                                              .then((value) {
                                            return ReusableMethod()
                                                .myToast("Copyed");
                                          });
                                        }),
                                  ]),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(4.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.r),
                                          bottomRight: Radius.circular(10.r))),
                                  child: SingleChildScrollView(
                                    child: SelectableText(
                                      result,
                                      style: TextStyle(
                                          fontSize: 19.sp,
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
              ),
              Positioned(
                top: 4.0,
                left: 0.0,
                right: 0.0,
                child: SizedBox(
                  height: 50,
                  child: AdWidget(ad: bannerClass.bannerAd),
                ),
              ),
            ],
          )),
    );
  }
}
