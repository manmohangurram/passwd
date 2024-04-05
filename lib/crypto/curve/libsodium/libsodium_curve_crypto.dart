import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:passwd/crypto/curve/curve_crypto.dart';
import 'package:passwd/crypto/curve/libsodium/curve25519_bindings.dart';
import 'package:passwd/crypto/curve/models/curve_keypair.dart';
import 'package:passwd/utils/pointer_bytes.dart';

class LibSodiumCurveCrypto implements CurveCrypto {
  LibSodiumCurveCrypto(DynamicLibrary dynamicLibrary) {
    bindings = Curve25519Bindings(dynamicLibrary);
  }

  late Curve25519Bindings bindings;

  @override
  Future<CurveKeyPair> generateNewKeyPair() async {
    var allocator = Arena();

    Pointer<UnsignedChar> publicKeyPointer =
        allocator.allocate(bindings.crypto_kx_publickeybytes());
    Pointer<UnsignedChar> privateKeyPointer =
        allocator.allocate(bindings.crypto_kx_secretkeybytes());

    bindings.crypto_kx_keypair(publicKeyPointer, privateKeyPointer);

    var publicKey = Uint8List.fromList(publicKeyPointer
        .cast<Uint8>()
        .asTypedList(bindings.crypto_kx_publickeybytes()));
    var privateKey = Uint8List.fromList(privateKeyPointer
        .cast<Uint8>()
        .asTypedList(bindings.crypto_kx_secretkeybytes()));

    allocator.releaseAll();

    return CurveKeyPair(privateKey, publicKey);
  }

  @override
  Future<List<int>> generateSharedKey(
      CurveKeyPair keyPair, List<int> publicKeyBytes) async {
    var allocator = Arena();

    Pointer<UnsignedChar> secretKeyPointer =
        allocator.allocate(bindings.crypto_kx_secretkeybytes());

    Pointer<Uint8> clientPublicKeyPointer =
        allocator.allocate(bindings.crypto_kx_publickeybytes());
    PointerBytes.copyData(clientPublicKeyPointer, keyPair.publicKey);

    Pointer<Uint8> clientPrivateKeyPointer =
        allocator.allocate(bindings.crypto_kx_sessionkeybytes());
    PointerBytes.copyData(clientPrivateKeyPointer, keyPair.privateKey);

    Pointer<Uint8> serverPublicKeyPointer =
        allocator.allocate(bindings.crypto_kx_publickeybytes());
    PointerBytes.copyData(serverPublicKeyPointer, publicKeyBytes);

    bindings.crypto_kx_client_session_keys(
        secretKeyPointer,
        nullptr,
        clientPublicKeyPointer.cast<UnsignedChar>(),
        clientPrivateKeyPointer.cast<UnsignedChar>(),
        serverPublicKeyPointer.cast<UnsignedChar>());

    var secretKey = Uint8List.fromList(secretKeyPointer
        .cast<Uint8>()
        .asTypedList(bindings.crypto_kx_secretkeybytes()));

    allocator.releaseAll();

    return secretKey;
  }
}
