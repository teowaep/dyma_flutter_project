import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String cityName;
  final String imagePath;
  final bool checked;
  final VoidCallback updateChecked;

  const CityCard({
    super.key,
    required this.cityName,
    required this.imagePath,
    required this.checked,
    required this.updateChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: SizedBox(
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Ink.image(
              fit: BoxFit.cover,
              image: AssetImage(imagePath),
              child: InkWell(onTap: updateChecked),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          checked ? Icons.star : Icons.star_border,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        cityName,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
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
