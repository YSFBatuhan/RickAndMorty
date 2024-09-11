import 'package:deneme/episodes/episodeScreenOne.dart';
import 'package:deneme/episodes/episodeScreenThree.dart';
import 'package:deneme/episodes/episodesScreenTwo.dart';
import 'package:flutter/material.dart';

class Seasons extends StatelessWidget {
  const Seasons({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 28,color: Colors.white70);
    return Scaffold(
      backgroundColor: Colors.black,
      
        appBar: AppBar(
          title: Text('Seasons'),
          centerTitle: true,
        ),
        body: Padding(
          
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              
              margin: EdgeInsets.all(60),
              padding: EdgeInsets.all(60),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image: DecorationImage(image: AssetImage('assets/images/portalgun.jpg'),fit: BoxFit.cover),color: Colors.white.withOpacity(0.2)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
             
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SeasonWidget(
                    textStyle: textStyle,
                    i: 1,
                    route:
                        SeasonOne(), 
                  ),
                  Divider(color: Colors.grey.shade800,),
                  SeasonWidget(
                    textStyle: textStyle,
                    i: 2,
                    route:
                        SeasonTwo(), 
                  ),
                  Divider(color: Colors.grey.shade800,),

                  SeasonWidget(
                    textStyle: textStyle,
                    i: 3,
                    route:
                        SeasonThree(), 
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class SeasonWidget extends StatelessWidget {
  const SeasonWidget(
      {super.key,
      required this.textStyle,
      required this.i,
      required this.route});

  final TextStyle textStyle;
  final int i;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route,
            ));
      },
      child: Text(
        "Season $i",
        style: textStyle,
      ),
    );
  }
}
