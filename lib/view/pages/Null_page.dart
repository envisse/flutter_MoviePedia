part of 'base.dart';

class NullPage extends StatelessWidget {
  const NullPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextComponent(textcomp: Textcomp.heading2, text: '404'),
          TextComponent(textcomp: Textcomp.body, text: 'Page not found'),
        ],
      ),
    );
  }
}
