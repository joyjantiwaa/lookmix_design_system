import 'package:flutter/foundation.dart';

/// Controller สำหรับจัดการสถานะเปิด/ปิด
class DisclosureController extends ValueNotifier<bool> {
  DisclosureController({bool initialState = false}) : super(initialState);

  bool get isOpen => value;

  void open() => value = true;
  void close() => value = false;
  void toggle() => value = !value;

  /// ให้เรียกได้จากภายนอกถ้าต้องการ
  set setIsOpen(bool newValue) => value = newValue;
}
