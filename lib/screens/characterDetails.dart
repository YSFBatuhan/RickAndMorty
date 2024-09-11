import 'package:deneme/models/character_model.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final CharacterModel characterModel;
  Details({required this.characterModel});

  var nameStyle = TextStyle(fontSize: 32, color: Colors.black);
  var identityTitleStyle = TextStyle(fontSize: 20, color: Colors.white);
  var style = TextStyle(fontSize: 20, color: Colors.white);
  var speciesStyle = TextStyle(fontSize: 22, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withAlpha(234),
        appBar: AppBar(
          title: Text(characterModel.name),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(characterModel.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(characterModel.name, style: nameStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(characterModel.species, style: speciesStyle),
                            SizedBox(width: 20),
                            Text(characterModel.status, style: speciesStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 10)],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Identity",
                        style: nameStyle,
                        textAlign: TextAlign.left,
                      ),
                      Divider(),
                      buildIdentityRow("Name", characterModel.name, color: Colors.amber),
                      Divider(),
                      buildIdentityRow("STATUS", characterModel.status, color: Colors.green),
                      Divider(),
                      buildIdentityRow("TYPE", characterModel.type ?? "N/A", color: Colors.deepPurpleAccent),
                      Divider(),
                      buildIdentityRow("SPECIES", characterModel.species, color: Colors.lightBlueAccent),
                      Divider(),
                      buildIdentityRow("GENDER", characterModel.gender, icon: characterModel.gender == "Male" ? Icons.male : Icons.female, color: characterModel.gender == "Male" ? Colors.cyanAccent.shade100 :  Colors.pinkAccent.shade100),
                      Divider(),
                      buildIdentityRow("ORIGIN", characterModel.originName, color: Colors.pink),
                      Divider(),
                      buildIdentityRow("LOCATION", characterModel.locationName, color: Colors.tealAccent),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIdentityRow(String title, String value, {IconData? icon, required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2), // Adjust opacity for visibility
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(blurRadius: 1, color: color, offset: Offset(1, 4), spreadRadius: 3)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(title.toUpperCase(), style: identityTitleStyle),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(value, style: style, textAlign: TextAlign.end),
                  ),
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        icon,
                        color: icon == Icons.male ? Colors.blue[700] : Colors.pink[100],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
