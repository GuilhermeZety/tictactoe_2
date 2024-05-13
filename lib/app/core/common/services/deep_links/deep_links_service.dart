import 'dart:async';
import 'dart:developer';

import 'package:tictactoe/app/core/common/extensions/string_extension.dart';
import 'package:uni_links/uni_links.dart';

class DeepLinksService {
  StreamSubscription? _subscription;

  Future verifyInit() async {
    String? link = await getInitialLink();

    if (link != null) {
      Map<String, dynamic> params = getParamsFromLink(link) ?? {};
      log('Params: $params', name: 'DeepLinksService');
    }
  }

  Future setStream() async {
    _subscription = linkStream.listen(
      (String? link) {
        log('Link: $link', name: 'DeepLinksService');
      },
      onError: (err, stt) {
        log('Error: $err', stackTrace: stt, name: 'DeepLinksService', error: err);
      },
    );
  }

  void dispose() {
    _subscription?.cancel();
  }

  Map<String, dynamic>? getParamsFromLink(String link) {
    return link.getQueryParameters();
  }
}
