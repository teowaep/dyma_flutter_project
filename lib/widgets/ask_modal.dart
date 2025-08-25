import 'package:flutter/material.dart';

Future<void> askModal(BuildContext context, String question) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, _, _) {
        return AskModal(question: question);
      },
    ),
  );
}

class AskModal extends StatelessWidget {
  final String question;

  const AskModal({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      alignment: Alignment.center,
      child: Card(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(question),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, 'ok');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text('Ok'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, 'annuler');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text('Annuler'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
