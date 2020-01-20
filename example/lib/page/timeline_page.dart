import 'package:flutter/material.dart';
import 'package:vf_plugin/vf_plugin.dart';

class TimelinePage extends StatefulWidget {
  TimelinePage();

  @override
  State<StatefulWidget> createState() {
    return _TimelinePageState();
  }
}

class ZHAliPayTimelineInfo implements TimelineInfo {
  String suffixAgo() => '前';

  String suffixAfter() => '后';

  String lessThanTenSecond() => '刚刚';

  String customYesterday() => '昨天';

  bool keepOneDay() => true;

  bool keepTwoDays() => false;

  String oneMinute(int minutes) => '$minutes分';

  String minutes(int minutes) => '$minutes分';

  String anHour(int hours) => '$hours小时';

  String hours(int hours) => '$hours小时';

  String oneDay(int days) => '$days天';

  String days(int days) => '$days天';

  DayFormat dayFormat() => DayFormat.Full;
}

class ENAliPayTimelineInfo implements TimelineInfo {
  String suffixAgo() => ' ago';

  String suffixAfter() => ' after';

  String lessThanTenSecond() => 'just now';

  String customYesterday() => 'Yesterday';

  bool keepOneDay() => true;

  bool keepTwoDays() => false;

  String oneMinute(int minutes) => 'a minute';

  String minutes(int minutes) => '$minutes minutes';

  String anHour(int hours) => 'an hour';

  String hours(int hours) => '$hours hours';

  String oneDay(int days) => 'a day';

  String days(int days) => '$days days';

  DayFormat dayFormat() => DayFormat.Full;
}

class _TimelinePageState extends State<TimelinePage> {
  bool isChinese = true;

  static const int weChat = 1;
  static const int weiBo = 2;
  static const int aliPay = 3;

  int dateType = aliPay;

  DayFormat _dayFormat = DayFormat.Full;

  List<int> dateTimeList = List();

  int _locTime = DateTime.now().millisecondsSinceEpoch;

  void _update() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    setLocaleInfo('zh_alipay', ZHAliPayTimelineInfo());
    setLocaleInfo('en_alipay', ENAliPayTimelineInfo());

//    _locTime = DateTime(2018, 10, 3, 16, 30, 30).millisecondsSinceEpoch;

    dateTimeList.add(_locTime - 2000);
    dateTimeList.add(_locTime - 1000 * 60 * 2);
    dateTimeList.add(_locTime - 1000 * 60 * 60 * 2);
    dateTimeList.add(_locTime - 1000 * 60 * 60 * 12);
    dateTimeList.add(_locTime - 1000 * 60 * 60 * 25);
    dateTimeList.add(_locTime - 1000 * 60 * 60 * 48);
    dateTimeList.add(_locTime - 1000 * 60 * 60 * 72);
    dateTimeList.add(DateTime(2018, 9, 18, 16, 16, 16).millisecondsSinceEpoch);
    dateTimeList.add(DateTime(2017, 9, 18, 16, 16, 16).millisecondsSinceEpoch);
  }

  String _getLocale() {
    String locale;
    switch (dateType) {
      case aliPay:
//        locale = isChinese ? 'zh_alipay' : 'en_alipay';
        locale = isChinese ? 'zh_normal' : 'en_normal';
        _dayFormat = DayFormat.Full;
        break;
      case weChat:
        locale = isChinese ? 'zh' : 'en';
        _dayFormat = DayFormat.Simple;
        break;
      case weiBo:
        locale = isChinese ? 'zh' : 'en';
        _dayFormat = DayFormat.Common;
        break;
    }
    return locale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VFTopBar(
        top: MediaQuery.of(context).padding.top,
        title: "时间显示",
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
                          Text("中文",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (isChinese == true),
                              activeColor: Colors.red,
                              onChanged: (value) {
                                isChinese = true;
                                _update();
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text("English",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (isChinese == false),
                              activeColor: Colors.red,
                              onChanged: (value) {
                                isChinese = false;
                                _update();
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
                          Text("支付宝",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (dateType == aliPay),
                              onChanged: (value) {
                                dateType = aliPay;
                                _update();
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text("微信",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (dateType == weChat),
                              onChanged: (value) {
                                dateType = weChat;
                                _update();
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text("微博",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[700])),
                          Checkbox(
                              value: (dateType == weiBo),
                              onChanged: (value) {
                                dateType = weiBo;
                                _update();
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Card(
              elevation: 4.0,
              margin: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: dateTimeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    int timeMillis = dateTimeList[index];
                    String timeline = TimelineUtil.format(timeMillis,
                        locTimeMillis: _locTime,
                        locale: _getLocale(),
                        dayFormat: _dayFormat);
                    return Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Text('$timeline'),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0)),
                            color: Colors.white,
                            border: Border.all(
                                width: 0.33, color: Color(0XFFEFEFEF))));
                  }),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
