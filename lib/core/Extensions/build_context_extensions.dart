import 'package:flutter/material.dart';
import 'package:rountiner/generated/l10n.dart';

extension BuildContextExtensions on BuildContext {
  S get s => S.of(this);
}

