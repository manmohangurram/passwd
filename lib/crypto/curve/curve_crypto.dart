import 'package:passwd/crypto/curve/models/curve_keypair.dart';

abstract class CurveCrypto {
  Future<CurveKeyPair> generateNewKeyPair();
  Future<List<int>> generateSharedKey(
      CurveKeyPair keyPair, List<int> publicKeyBytes);
}
