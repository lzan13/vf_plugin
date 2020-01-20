import 'package:flutter/material.dart';

import 'package:vf_plugin/vf_plugin.dart';

class RegexPage extends StatefulWidget {
  RegexPage();

  @override
  State<StatefulWidget> createState() {
    return RegexPageState();
  }
}

class RegexPageState extends State<RegexPage> {
  bool isOpen = false;

  String _inputText = "";
  String _checkResult = "";

  String regexType = "";

  static const String regexMobileSimple = "MobileSimple";
  static const String regexMobileExact = "MobileExact";
  static const String regexTel = "Tel";
  static const String regexIdCard15 = "IdCard15";
  static const String regexIdCard18 = "IdCard18";
  static const String regexEmail = "Email";
  static const String regexUrl = "Url";
  static const String regexZh = "Zh";
  static const String regexDate = "Date";
  static const String regexIp = "Ip";

  @override
  void initState() {
    super.initState();
    regexType = regexMobileSimple;
  }

  void inputCheck(String input) {
    _inputText = input;
    bool isCorrent = false;
    switch (regexType) {
      case regexMobileSimple:
        isCorrent = VFReg.isMobileSimple(input);
        break;
      case regexMobileExact:
        isCorrent = VFReg.isMobileExact(input);
        break;
      case regexTel:
        isCorrent = VFReg.isTel(input);
        break;
      case regexIdCard15:
        isCorrent = VFReg.isIDCard15(input);
        break;
      case regexIdCard18:
        isCorrent = VFReg.isIDCard18(input);
        break;
      case regexEmail:
        isCorrent = VFReg.isEmail(input);
        break;
      case regexUrl:
        isCorrent = VFReg.isURL(input);
        break;
      case regexZh:
        isCorrent = VFReg.isZh(input);
        break;
      case regexDate:
        isCorrent = VFReg.isDate(input);
        break;
      case regexIp:
        isCorrent = VFReg.isIP(input);
        break;
    }

    setState(() {
      _checkResult = regexType + " is   " + isCorrent.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VFTopBar(
        top: MediaQuery.of(context).padding.top,
        title: "定时器",
        titleColor: VFColors.white,
        leftIcon: Icons.arrow_back,
      ),
      body: Column(
        children: <Widget>[
          Card(
            elevation: 4.0,
            margin: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text(regexMobileSimple,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (regexType == regexMobileSimple),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    regexType = regexMobileSimple;
                                    inputCheck(_inputText);
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text(regexMobileExact,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (regexType == regexMobileExact),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    regexType = regexMobileExact;
                                    inputCheck(_inputText);
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text(regexTel,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (regexType == regexTel),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    regexType = regexTel;
                                    inputCheck(_inputText);
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text(regexDate,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (regexType == regexDate),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    regexType = regexDate;
                                    inputCheck(_inputText);
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text(regexIp,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (regexType == regexIp),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    regexType = regexIp;
                                    inputCheck(_inputText);
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text(regexIdCard15,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (regexType == regexIdCard15),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    regexType = regexIdCard15;
                                    inputCheck(_inputText);
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text(regexIdCard18,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (regexType == regexIdCard18),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    regexType = regexIdCard18;
                                    inputCheck(_inputText);
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text(regexEmail,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (regexType == regexEmail),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    regexType = regexEmail;
                                    inputCheck(_inputText);
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text(regexUrl,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (regexType == regexUrl),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    regexType = regexUrl;
                                    inputCheck(_inputText);
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text(regexZh,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (regexType == regexZh),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    regexType = regexZh;
                                    inputCheck(_inputText);
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextField(
                    autofocus: false,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[900]),
                    decoration: InputDecoration(
                        hintText: "请输入...",
                        hintStyle: TextStyle(fontSize: 14.0)),
                    onChanged: (value) {
                      inputCheck(value);
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  height: 66.0,
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '$_checkResult',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
