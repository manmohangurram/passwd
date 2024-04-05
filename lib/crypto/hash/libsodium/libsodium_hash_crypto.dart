import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:passwd/crypto/hash/hash_crypto.dart';
import 'package:passwd/crypto/hash/libsodium/blade2d_bindings.dart';
import 'package:passwd/utils/pointer_bytes.dart';

class LibsodiumHashCrypto extends HashCrypto {
  LibsodiumHashCrypto(DynamicLibrary dynamicLibrary) {
    bindings = Blake2dBindings(dynamicLibrary);
  }

  late Blake2dBindings bindings;

  @override
  Future<List<int>> hash(List<int> message, int hashLen) async {
    final allocator = Arena();

    Pointer<UnsignedChar> hashBytesPointer = allocator.allocate(hashLen);

    Pointer<Uint8> messageBytesPointer = allocator.allocate(message.length);
    PointerBytes.copyData(messageBytesPointer, message);

    bindings.crypto_generichash(hashBytesPointer, hashLen,
        messageBytesPointer.cast<UnsignedChar>(), message.length, nullptr, 0);

    var hash =
        Uint8List.fromList(hashBytesPointer.cast<Uint8>().asTypedList(hashLen));

    allocator.releaseAll();

    return hash;
  }
}
