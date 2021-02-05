import 'package:flutter/material.dart';

import '../../db/EQ.dart';
import '../../utils/MediaQuery.dart';

class SecondRightPage extends StatefulWidget {
  @override
  SecondRightPageState createState() => new SecondRightPageState();
}

class SecondRightPageState extends State<SecondRightPage> with AutomaticKeepAliveClientMixin<SecondRightPage> {
  @override
  bool get wantKeepAlive => true;

  // rightEQ: futurebuilder의 future에 바로 getrightEQData를 넣을 경우 값 변화가 안되므로 
  // 값을 한 번만 로딩하기 위해 future 변수를 만듬.
  List<double> _sliderValue = [];
  Future rightEQ;

  @override
  void initState() {
    super.initState();
    rightEQ = getRightEQData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final double _mediaHeight = MediaQuery.of(context).size.height;
    final List<double> _mediaHeightList = getSencondPageHeight(_mediaHeight);

    return FutureBuilder<List<double>>(
      future: rightEQ,
      builder: (context, snapshot) {
        if( snapshot.hasData ) {
          _sliderValue = snapshot.data;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                 children: <Widget>[
                   Container(
                     height: _mediaHeightList[0],
                     child: RotatedBox(
                       quarterTurns: -1,
                       child: Slider(
                         value: _sliderValue[0],
                         max: 500,
                         min: 0,
                         divisions: 500,
                         label: _sliderValue[0].toString(),
                         onChanged: (double value) { _setSliderValue(value, 0); },
                         onChangeEnd: (double value) async {
                           await upsertRightEQData(_sliderValue);
                         },
                       ),
                     ),
                   ),

                   Text('125')
                 ],
               ),

              Column(
                 children: <Widget>[
                   Container(
                     height: _mediaHeightList[0],
                     child: RotatedBox(
                       quarterTurns: -1,
                       child: Slider(
                         value: _sliderValue[1],
                         max: 500,
                         min: 0,
                         divisions: 500,
                         label: _sliderValue[1].toString(),
                         onChanged: (double value) { _setSliderValue(value, 1); },
                         // 스크롤을 처음 시작할 때 한 번 끌날 때 한 번 총 두번 불러지는 버그 존재
                         onChangeEnd: (double value) async {
                           await upsertRightEQData(_sliderValue);
                         },
                       ),
                     ),
                   ),

                   Text('250')
                 ],
               ),

              Column(
                 children: <Widget>[
                   Container(
                     height: _mediaHeightList[0],
                     child: RotatedBox(
                       quarterTurns: -1,
                       child: Slider(
                         value: _sliderValue[2],
                         max: 500,
                         min: 0,
                         divisions: 500,
                         label: _sliderValue[2].toString(),
                         onChanged: (double value) { _setSliderValue(value, 2); },
                         onChangeEnd: (double value) async {
                           await upsertRightEQData(_sliderValue);
                         },
                       ),
                     ),
                   ),

                   Text('500')
                 ],
               ),

              Column(
                 children: <Widget>[
                   Container(
                     height: _mediaHeightList[0],
                     child: RotatedBox(
                       quarterTurns: -1,
                       child: Slider(
                         value: _sliderValue[3],
                         max: 500,
                         min: 0,
                         divisions: 500,
                         label: _sliderValue[3].toString(),
                         onChanged: (double value) { _setSliderValue(value, 3); },
                         onChangeEnd: (double value) async {
                           await upsertRightEQData(_sliderValue);
                         },
                       ),
                     ),
                   ),

                   Text('1K')
                 ],
               ),

              Column(
                 children: <Widget>[
                   Container(
                     height: _mediaHeightList[0],
                     child: RotatedBox(
                       quarterTurns: -1,
                       child: Slider(
                         value: _sliderValue[4],
                         max: 500,
                         min: 0,
                         divisions: 500,
                         label: _sliderValue[4].toString(),
                         onChanged: (double value) { _setSliderValue(value, 4); },
                         onChangeEnd: (double value) async {
                           await upsertRightEQData(_sliderValue);
                         },
                       ),
                     ),
                   ),

                   Text('2K')
                 ],
               ),

              Column(
                 children: <Widget>[
                   Container(
                     height: _mediaHeightList[0],
                     child: RotatedBox(
                       quarterTurns: -1,
                       child: Slider(
                         value: _sliderValue[5],
                         max: 500,
                         min: 0,
                         divisions: 500,
                         label: _sliderValue[5].toString(),
                         onChanged: (double value) { _setSliderValue(value, 5); },
                         onChangeEnd: (double value) async {
                           await upsertRightEQData(_sliderValue);
                         },
                       ),
                     ),
                   ),

                   Text('4K')
                 ],
               ),

              Column(
                 children: <Widget>[
                   Container(
                     height: _mediaHeightList[0],
                     child: RotatedBox(
                       quarterTurns: -1,
                       child: Slider(
                         value: _sliderValue[6],
                         max: 500,
                         min: 0,
                         divisions: 500,
                         label: _sliderValue[6].toString(),
                         onChanged:   (double value) { _setSliderValue(value, 6); },
                         onChangeEnd: (double value) async {
                           await upsertRightEQData(_sliderValue);
                         },
                       ),
                     ),
                   ),

                   Text('8K'),
                 ],
               ),
            ],
          );
        }

        else return Text('');
      }
    );
  }

  void _setSliderValue(double value, int index) {
    // tap으로 값 변화 방지 && 스크롤 속도 조절
    if( (_sliderValue[index] - value).abs() < 50 ) {
        setState( () { _sliderValue[index] = value; });
      }
  }
}