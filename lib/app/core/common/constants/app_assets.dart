// ignore_for_file: library_private_types_in_public_api, unused_field

class AppAssets {
  static _AppImages images = _AppImages();
  static final AppSvgs svgs = AppSvgs();
}

class _AppImages {
  static const String _path = 'assets/images/';
}

class AppSvgs {
  static const String _path = 'assets/svgs/';

  final String notFound = '${_path}not_found.svg';
  final String logo = '${_path}logo.svg';
  final String brazil = '${_path}brazil.svg';
  final String spain = '${_path}spain.svg';
  final String unitedStates = '${_path}united-states.svg';
}
