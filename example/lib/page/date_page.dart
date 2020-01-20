import 'package:flutter/material.dart';

import 'package:vf_plugin/vf_plugin.dart';

class DatePage extends StatefulWidget {
  DatePage();

  @override
  State<StatefulWidget> createState() {
    return _DatePageState();
  }
}

class _DatePageState extends State<DatePage> {
  DateFormat _dateFormat = DateFormat.NORMAL;

  bool isZH = true;

  String _checkResult = "";

  void inputCheck(DateFormat format) {
    setState(() {
      _checkResult = "Now:    " +
          DateUtil.getDateStrByMs(DateTime.now().millisecondsSinceEpoch,
              format: format) +
          "\n" +
          DateUtil.getWeekDay(DateTime.now()) +
          "   " +
          DateUtil.getZHWeekDay(DateTime.now());
    });
  }

  @override
  void initState() {
    super.initState();
    inputCheck(isZH ? DateFormat.ZH_NORMAL : DateFormat.NORMAL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VFTopBar(
        top: MediaQuery.of(context).padding.top,
        title: "时间日期",
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
                          Text("Is ZH",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (isZH == true),
                              activeColor: Colors.red,
                              onChanged: (value) {
                                setState(() {
                                  isZH = value;
                                });
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text("DEFAULT",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (_dateFormat == DateFormat.DEFAULT),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormat.DEFAULT;
                                    inputCheck(isZH
                                        ? DateFormat.ZH_DEFAULT
                                        : _dateFormat);
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
                          Text("NORMAL",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (_dateFormat == DateFormat.NORMAL),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormat.NORMAL;
                                    inputCheck(isZH
                                        ? DateFormat.ZH_NORMAL
                                        : _dateFormat);
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
                          Text("Y_M_D_H_M",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (_dateFormat ==
                                  DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat =
                                        DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE;
                                    inputCheck(isZH
                                        ? DateFormat
                                            .ZH_YEAR_MONTH_DAY_HOUR_MINUTE
                                        : _dateFormat);
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
                          Text("Y_M_D",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (_dateFormat == DateFormat.YEAR_MONTH_DAY),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormat.YEAR_MONTH_DAY;
                                    inputCheck(isZH
                                        ? DateFormat.ZH_YEAR_MONTH_DAY
                                        : _dateFormat);
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
                          Text("Y_M",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (_dateFormat == DateFormat.YEAR_MONTH),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormat.YEAR_MONTH;
                                    inputCheck(isZH
                                        ? DateFormat.ZH_YEAR_MONTH
                                        : _dateFormat);
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
                          Text("M_D",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (_dateFormat == DateFormat.MONTH_DAY),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormat.MONTH_DAY;
                                    inputCheck(isZH
                                        ? DateFormat.ZH_MONTH_DAY
                                        : _dateFormat);
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
                          Text("M_D_H_M",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (_dateFormat ==
                                  DateFormat.MONTH_DAY_HOUR_MINUTE),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat =
                                        DateFormat.MONTH_DAY_HOUR_MINUTE;
                                    inputCheck(isZH
                                        ? DateFormat.ZH_MONTH_DAY_HOUR_MINUTE
                                        : _dateFormat);
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
                          Text("H_M_S",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (_dateFormat ==
                                  DateFormat.HOUR_MINUTE_SECOND),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormat.HOUR_MINUTE_SECOND;
                                    inputCheck(isZH
                                        ? DateFormat.ZH_HOUR_MINUTE_SECOND
                                        : _dateFormat);
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
                          Text("H_M",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (_dateFormat == DateFormat.HOUR_MINUTE),
                              onChanged: (value) {
                                if (value) {
                                  setState(() {
                                    _dateFormat = DateFormat.HOUR_MINUTE;
                                    inputCheck(isZH
                                        ? DateFormat.ZH_HOUR_MINUTE
                                        : _dateFormat);
                                  });
                                }
                              })
                        ],
                      ),
                    )
                  ],
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
          ),
          ListView(shrinkWrap: true, children: <Widget>[Text("")])
        ],
      ),
    );
  }
}
