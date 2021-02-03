part of 'initial_page.dart';

class _Logo extends StatelessWidget {
  const _Logo({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.scaffoldBackgroundColor,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30.0),
              Icon(
                Icons.movie_filter_outlined,
                color: _InitialWidgetsConstants.secondaryColor
                    .withOpacity(_InitialWidgetsConstants.secondaryOpacity),
                size: 90.0,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Cinemascope',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: _InitialWidgetsConstants.secondaryColor,
                  fontSize: 36.0,
                  letterSpacing: 4.0,
                  shadows: const <Shadow>[
                    const Shadow(
                      offset: const Offset(2.0, 2.0),
                      color: _InitialWidgetsConstants.tertiaryColor,
                      blurRadius: 20.0,
                    ),
                    const Shadow(
                      offset: const Offset(1.0, 1.0),
                      color: _InitialWidgetsConstants.tertiaryColor,
                      blurRadius: 60.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60.0),
              child,
            ],
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
            child: Align(
              alignment: const Alignment(1.0, 1.0),
              child: const _PoweredBy(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PoweredBy extends StatelessWidget {
  const _PoweredBy();

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _InitialWidgetsConstants.secondaryOpacity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: const Text(
              'Powered by',
              style: const TextStyle(
                color: _InitialWidgetsConstants.tertiaryColor,
                fontSize: 16.0,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w300,
                shadows: const <Shadow>[
                  const Shadow(
                    offset: const Offset(1.0, 1.0),
                    color: _InitialWidgetsConstants.secondaryColor,
                    blurRadius: 8.0,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Image.asset(
            _imageTmdbLogo,
            width: MediaQuery.of(context).size.width / 2.0,
          ),
        ],
      ),
    );
  }

  static const _imageTmdbLogo = 'assets/images/primary-long-blue.png';
}
