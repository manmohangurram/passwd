import 'package:sodium/sodium.dart';
import 'package:flutter/foundation.dart';
import 'package:passwd/crypto/curve/curve_crypto.dart';
import 'package:passwd/crypto/curve/models/curve_keypair.dart';

class LibSodiumCurveCrypto implements CurveCrypto {
  LibSodiumCurveCrypto(this.sodium);

  final Sodium sodium;

  @override
  Future<CurveKeyPair> generateNewKeyPair() async {
    final keyPair = sodium.crypto.kx.keyPair();

    return CurveKeyPair(keyPair.secretKey.extractBytes(), keyPair.publicKey);

    // var allocator = Arena();

    // Pointer<UnsignedChar> publicKeyPointer =
    //     allocator.allocate(bindings.crypto_kx_publickeybytes());
    // Pointer<UnsignedChar> privateKeyPointer =
    //     allocator.allocate(bindings.crypto_kx_secretkeybytes());

    // bindings.crypto_kx_keypair(publicKeyPointer, privateKeyPointer);

    // var publicKey = Uint8List.fromList(publicKeyPointer
    //     .cast<Uint8>()
    //     .asTypedList(bindings.crypto_kx_publickeybytes()));
    // var privateKey = Uint8List.fromList(privateKeyPointer
    //     .cast<Uint8>()
    //     .asTypedList(bindings.crypto_kx_secretkeybytes()));

    // allocator.releaseAll();

    // return CurveKeyPair(privateKey, publicKey);
  }

  @override
  Future<List<int>> generateSharedKey(
      CurveKeyPair keyPair, List<int> publicKeyBytes) async {
    final sessionKeys = sodium.crypto.kx.clientSessionKeys(
        clientPublicKey: keyPair.publicKey,
        clientSecretKey: sodium.secureCopy(keyPair.privateKey),
        serverPublicKey: Uint8List.fromList(publicKeyBytes));

    return sessionKeys.rx.extractBytes();
    // var allocator = Arena();

    // Pointer<UnsignedChar> secretKeyPointer =
    //     allocator.allocate(bindings.crypto_kx_secretkeybytes());

    // Pointer<Uint8> clientPublicKeyPointer =
    //     allocator.allocate(bindings.crypto_kx_publickeybytes());
    // PointerBytes.copyData(clientPublicKeyPointer, keyPair.publicKey);

    // Pointer<Uint8> clientPrivateKeyPointer =
    //     allocator.allocate(bindings.crypto_kx_sessionkeybytes());
    // PointerBytes.copyData(clientPrivateKeyPointer, keyPair.privateKey);

    // Pointer<Uint8> serverPublicKeyPointer =
    //     allocator.allocate(bindings.crypto_kx_publickeybytes());
    // PointerBytes.copyData(serverPublicKeyPointer, publicKeyBytes);

    // bindings.crypto_kx_client_session_keys(
    //     secretKeyPointer,
    //     nullptr,
    //     clientPublicKeyPointer.cast<UnsignedChar>(),
    //     clientPrivateKeyPointer.cast<UnsignedChar>(),
    //     serverPublicKeyPointer.cast<UnsignedChar>());

    // var secretKey = Uint8List.fromList(secretKeyPointer
    //     .cast<Uint8>()
    //     .asTypedList(bindings.crypto_kx_secretkeybytes()));

    // allocator.releaseAll();

    // return secretKey;
  }
}
