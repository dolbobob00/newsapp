import 'package:flutter/material.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({super.key, required this.idOfNews});
  final String idOfNews;

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  Widget icon = Icon(Icons.share);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: () async {
        final scaffoldMessenger = ScaffoldMessenger.of(context);
        try {
          setState(() {
            icon = CircularProgressIndicator.adaptive();
          });
          await showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Simulation of sharing articleID: ${widget.idOfNews}'),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      child: Text('Yes'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('No'),
                    ),
                  ],
                ),
              );
            },
          );
        } catch (e) {
          if (!mounted) return;
          scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text(
                e.toString(),
              ),
            ),
          );
        }
        setState(
          () {
            icon = Icon(
              Icons.share,
            );
          },
        );
      },
    );
  }
}
