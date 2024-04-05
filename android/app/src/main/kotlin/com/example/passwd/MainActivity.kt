package com.example.passwd

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

// fun ByteArray.toHexString() = joinToString("") { "%02x".format(it) }

// fun String.decodeHex(): ByteArray {
//     return chunked(2).map { it.toInt(16).toByte() }.toByteArray()
// }

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), LIBSODIUM_CHANNEL).setMethodCallHandler { call, result ->
        //     when (call.method) {
        //         "generateX25519KeyPair" -> {
        //             result.success(generateX25519KeyPair())
        //         }
        //         "generateShareKey" -> {
        //             val senderPublicKey: String? = call.argument("senderPublicKey")
        //             val senderPrivateKey: String? = call.argument("senderPrivateKey")
        //             val receiverPublicKey: String? = call.argument("receiverPublicKey")
        //             result.success(generateShareKey(senderPublicKey!!.decodeHex(), senderPrivateKey!!.decodeHex(), receiverPublicKey!!.decodeHex()))
        //         }
        //         else -> result.notImplemented()
        //     }
        // }
    }

    // fun generateX25519KeyPair(): List<String> {
    //     val publicKey = ByteArray(32)
    //     val privateKey = ByteArray(32)
    //     LibsodiumBridge.generateX25519KeyPair(publicKey, privateKey)
    //     val publicKeystring = publicKey.toHexString()
    //     val privateKeystring = privateKey.toHexString()
    //     return listOf<String>(publicKeystring, privateKeystring)
    // }

    // fun generateShareKey(senderPublicKey: ByteArray?, senderPrivateKey: ByteArray?, receiverPublicKey: ByteArray?): String {
    //     val sharedKey = ByteArray(32)
    //     print("calling c shared key")
    //     LibsodiumBridge.generateShareKey(sharedKey, senderPublicKey, senderPrivateKey, receiverPublicKey)
    //     val sharedKeyString = sharedKey.toHexString()
    //     return sharedKeyString
    // }
}
