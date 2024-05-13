import 'package:dartz/dartz.dart';

extension GetRight on Either {
  R? getRight<R>() {
    if (this is Left) return null;
    return (this as Right).value;
  }
}

extension GetLeft on Either {
  L? getLeft<L>() {
    if (this is Right) return null;
    return (this as Left).value;
  }
}
