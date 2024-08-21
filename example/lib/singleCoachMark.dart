import 'package:coachmaker/coachmaker.dart';
import 'package:flutter/material.dart';

class SingleCoachMark extends StatefulWidget {
  const SingleCoachMark({Key? key}) : super(key: key);

  @override
  _SingleCoachMarkState createState() => _SingleCoachMarkState();
}

class _SingleCoachMarkState extends State<SingleCoachMark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('single coachmark'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: CoachPoint(
                initial: '80',
                child: Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Text(
                      'Sorot aku kakak 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.red,
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Text(
                      'Sorot aku kakak',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.red,
                    height: 50,
                    width: 100,
                    child: Center(
                      child: Text(
                        'Sorot aku kakak',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var coachmaker = CoachMaker(
            buildContext: context,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            // firstDelay: Duration(seconds: 10),
            // duration: Duration(milliseconds: 600),
            initialList: [
              CoachModel(
                initial: '80',
                title: 'Keong Racun',
                maxWidth: 400,
                subtitle: [
                  'Dasar kau keong racun\nBaru kenal eh ngajak tidur\nNgomong nggak sopan santun\nKau anggap aku ayam kampung',
                ],
                // header: Image.network(
                //   'https://facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png?w=512&h=512',
                //   height: 50,
                //   width: 50,
                // ),
              ),
            ],
            nextStep: CoachMakerControl.next,
            skip: () {},
            // customNavigator: (onSkip, onNext) {
            //   return Row(
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           onSkip!();
            //         },
            //         icon: Icon(Icons.close),
            //       ),
            //       IconButton(
            //         onPressed: () {
            //           onNext();
            //         },
            //         icon: Icon(Icons.arrow_forward),
            //       )
            //     ],
            //   );
            // },
            // isActive: false,
            showSteps: false,
            buttonOptions: CoachButtonOptions(
              skipTitle: 'Lewati',
              buttonTitle: 'Lanjut',
              titleLastStep: 'Selesai bang',
              buttonStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                elevation: MaterialStateProperty.all(0),
              ),
            ),
          );

          coachmaker.show();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
