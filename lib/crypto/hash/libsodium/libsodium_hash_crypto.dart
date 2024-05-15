import 'dart:typed_data';

import 'package:sodium/sodium.dart';
import 'package:passwd/crypto/hash/hash_crypto.dart';

class LibsodiumHashCrypto extends HashCrypto {
  LibsodiumHashCrypto(this.sodium);

  final Sodium sodium;

  @override
  Future<List<int>> hash(List<int> message, int hashLen) async {
    return sodium.crypto.genericHash
        .call(message: Uint8List.fromList(message), outLen: hashLen);

    // final allocator = Arena();

    // Pointer<UnsignedChar> hashBytesPointer = allocator.allocate(hashLen);

    // Pointer<Uint8> messageBytesPointer = allocator.allocate(message.length);
    // PointerBytes.copyData(messageBytesPointer, message);

    // bindings.crypto_generichash(hashBytesPointer, hashLen,
    //     messageBytesPointer.cast<UnsignedChar>(), message.length, nullptr, 0);

    // var hash =
    //     Uint8List.fromList(hashBytesPointer.cast<Uint8>().asTypedList(hashLen));

    // allocator.releaseAll();

    // return hash;
  }
}
