import 'dart:ffi';

class PointerBytes {
  static void copyData(Pointer<Uint8> pointer, List<int> data) {
    for (int i = 0; i < data.length; i++) {
      pointer[i] = data[i];
    }
  }
}
