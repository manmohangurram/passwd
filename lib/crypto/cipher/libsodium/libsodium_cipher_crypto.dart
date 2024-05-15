import 'dart:typed_data';

import 'package:passwd/crypto/hash/libsodium/libsodium_hash_crypto.dart';
import 'package:sodium/sodium.dart';
import 'package:passwd/crypto/cipher/cipher_crypto.dart';
import 'package:passwd/crypto/cipher/models/cipher_key.dart';

class LibSodiumCipherCrypto extends CipherCrypto {
  LibSodiumCipherCrypto(this.sodium) {
    hashCrypto = LibsodiumHashCrypto(sodium);
  }

  final Sodium sodium;
  late LibsodiumHashCrypto hashCrypto;

  @override
  Future<List<int>> decrypt(List<int> cipher, CipherKeyNonce keyNonce) async {
    return sodium.crypto.aeadChaCha20Poly1305.decrypt(
        cipherText: Uint8List.fromList(cipher),
        nonce: Uint8List.fromList(keyNonce.nonce),
        key: sodium.secureCopy(Uint8List.fromList(keyNonce.key)));
    // final allocator = Arena();

    // final macBytesLen = sodium
    //     chachaBindings.crypto_secretbox_xchacha20poly1305_macbytes();
    // final cipherLen = cipher.length;

    // final messageLen = cipherLen - macBytesLen;

    // Pointer<UnsignedChar> messageBytesPointer = allocator.allocate(messageLen);

    // Pointer<Uint8> cipherBytesPointer = allocator.allocate(cipherLen);
    // PointerBytes.copyData(cipherBytesPointer, cipher);

    // Pointer<Uint8> nonceBytesPointer =
    //     allocator.allocate(keyNonce.nonce.length);
    // PointerBytes.copyData(nonceBytesPointer, keyNonce.nonce);

    // Pointer<Uint8> keyBytesPointer = allocator.allocate(keyNonce.key.length);
    // PointerBytes.copyData(keyBytesPointer, keyNonce.key);

    // chachaBindings.crypto_secretbox_xchacha20poly1305_open_easy(
    //     messageBytesPointer,
    //     cipherBytesPointer.cast(),
    //     cipherLen,
    //     nonceBytesPointer.cast(),
    //     keyBytesPointer.cast());

    // final message = Uint8List.fromList(
    //     messageBytesPointer.cast<Uint8>().asTypedList(messageLen));

    // allocator.releaseAll();

    // return message;
  }

  @override
  Future<Uint8List> encrypt(List<int> message, CipherKeyNonce keyNonce) async {
    return sodium.crypto.aeadChaCha20Poly1305.encrypt(
        message: Uint8List.fromList(message),
        nonce: Uint8List.fromList(keyNonce.nonce),
        key: sodium.secureCopy(Uint8List.fromList(keyNonce.key)));

    // final allocator = Arena();

    // final macBytesLen =
    //     chachaBindings.crypto_secretbox_xchacha20poly1305_macbytes();
    // final messageLen = message.length;

    // final cipherLen = macBytesLen + messageLen;

    // Pointer<UnsignedChar> cipherBytesPointer = allocator.allocate(cipherLen);

    // Pointer<Uint8> messageBytesPointer = allocator.allocate(messageLen);
    // PointerBytes.copyData(messageBytesPointer, message);

    // Pointer<Uint8> nonceBytesPointer =
    //     allocator.allocate(keyNonce.nonce.length);
    // PointerBytes.copyData(nonceBytesPointer, keyNonce.nonce);

    // Pointer<Uint8> keyBytesPointer = allocator.allocate(keyNonce.key.length);
    // PointerBytes.copyData(keyBytesPointer, keyNonce.key);

    // chachaBindings.crypto_secretbox_xchacha20poly1305_easy(
    //     cipherBytesPointer,
    //     messageBytesPointer.cast(),
    //     messageLen,
    //     nonceBytesPointer.cast(),
    //     keyBytesPointer.cast());

    // final cipher = Uint8List.fromList(
    //     cipherBytesPointer.cast<Uint8>().asTypedList(cipherLen));

    // allocator.releaseAll();

    // return cipher;
  }

  @override
  Future<CipherKeyNonce> generateCipherNonce(List<int> bytes) async {
    final keyBytesLen = sodium.crypto.aeadChaCha20Poly1305.keyBytes;
    final nonceBytesLen = sodium.crypto.aeadChaCha20Poly1305.nonceBytes;

    return hashCrypto.hash(bytes, keyBytesLen + nonceBytesLen).then((hash) =>
        CipherKeyNonce(
            hash.sublist(0, keyBytesLen), hash.sublist(keyBytesLen)));

    // final keyBytesLen =
    //     chachaBindings.crypto_secretbox_xchacha20poly1305_keybytes();

    // final nonceBytesLen =
    //     chachaBindings.crypto_secretbox_xchacha20poly1305_noncebytes();

    // return hashCrypto.hash(bytes, keyBytesLen + nonceBytesLen).then((hash) =>
    //     CipherKeyNonce(
    //         hash.sublist(0, keyBytesLen), hash.sublist(keyBytesLen)));
  }
}
