import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vf_plugin/vf_plugin.dart';

class TimerPage extends StatefulWidget {
  TimerPage();

  @override
  State<StatefulWidget> createState() {
    return _TimerPageState();
  }
}

class _TimerPageState extends State<TimerPage> {
  VFTimer mVFTimer;
  VFTimer mCountDownVFTimer;

  int mTick = 0;
  String timerBtnTxt = "Start";

  int mCountDownTick = 0;
  String countDownBtnTxt = "Start";

  @override
  void initState() {
    super.initState();
    mVFTimer = VFTimer(mInterval: 1000);
    //mVFTimer.setInterval(1000);
    mVFTimer.setOnTimerCallback((int tick) {
      setState(() {
        mTick = tick;
      });
    });

    mCountDownVFTimer = VFTimer(mInterval: 1000, mTotalTime: 6 * 1000);
//    mCountDownVFTimer.setInterval(1000);
//    mCountDownVFTimer.setTotalTime(6 * 1000);
    mCountDownVFTimer.setOnTimerCallback((int tick) {
      double _tick = tick / 1000;
      if (_tick.toInt() == 0) {
        countDownBtnTxt = "Start";
        mCountDownVFTimer.setTotalTime(6 * 1000);
      }
      setState(() {
        mCountDownTick = _tick.toInt();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (mVFTimer != null) mVFTimer.cancel();
    if (mCountDownVFTimer != null) mCountDownVFTimer.cancel();
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
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.grey[50],
                      height: 100.0,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 100.0,
                            height: 100.0,
                            color: Colors.grey[100],
                            alignment: Alignment.center,
                            child: Text("Timer"),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('$mTick'),
                            ),
                            flex: 1,
                          ),
                          InkWell(
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                color: Colors.grey[100],
                                alignment: Alignment.center,
                                child: Text("$timerBtnTxt"),
                              ),
                              onTap: () {
                                if (mVFTimer.isActive()) {
                                  mTick = 0;
                                  mVFTimer.cancel();
                                  timerBtnTxt = "Start";
                                } else {
                                  mVFTimer.startTimer();
                                  timerBtnTxt = "Stop";
                                }
                                setState(() {});
                              })
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      color: Colors.grey[50],
                      height: 100.0,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 100.0,
                            height: 100.0,
                            color: Colors.grey[100],
                            alignment: Alignment.center,
                            child: Text("CountDown"),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('$mCountDownTick'),
                            ),
                            flex: 1,
                          ),
                          InkWell(
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                color: Colors.grey[100],
                                alignment: Alignment.center,
                                child: Text("$countDownBtnTxt"),
                              ),
                              onTap: () {
                                if (mCountDownVFTimer.isActive()) {
                                  mCountDownVFTimer.cancel();
                                  countDownBtnTxt = "Start";
                                } else {
                                  mCountDownVFTimer.startCountDown();
                                  countDownBtnTxt = "Stop";
                                }
                                setState(() {});
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
