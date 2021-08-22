part of 'base.dart';

class NullPage extends StatelessWidget {
  const NullPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Textheading2(text: '404'),
          Textbody(text: 'page not found'),
        ],
      ),
    );
  }
}
