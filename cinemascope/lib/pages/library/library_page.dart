import '../../material.dart';
import 'widgets/library_section_buttons.dart';
import 'widgets/library_section_lists.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppDrawerLeadingButton(),
        title: Text(context.i18n.pages.library),
        actions: const [
          const AppBarSearchButton(),
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              const LibrarySectionButtons(),
              const SizedBox(height: 20.0),
              const LibrarySectionLists(),
            ],
          ),
        ),
      ),
    );
  }
}
