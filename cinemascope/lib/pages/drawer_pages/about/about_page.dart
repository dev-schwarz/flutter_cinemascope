import '../../../material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: Text(
          'About',
          style: context.theme.textTheme.headline6,
        ),
      ),
    );
  }
}
