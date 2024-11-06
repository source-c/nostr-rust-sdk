// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.5.1.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'key/public_key.dart';
import 'key/secret_key.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';


            

            

            
                // Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<_Keys>>
                abstract class Keys implements RustOpaqueInterface {
                    /// Generate random keys
///
/// This constructor use a random number generator that retrieves randomness from the operating system.
static Keys  generate()=>RustLib.instance.api.crateApiProtocolKeyKeysGenerate();


factory Keys({required SecretKey secretKey })=>RustLib.instance.api.crateApiProtocolKeyKeysNew(secretKey: secretKey);


/// Parse secret key from `hex` or `bech32`
static Keys  parse({required String secretKey })=>RustLib.instance.api.crateApiProtocolKeyKeysParse(secretKey: secretKey);


 Future<PublicKey>  publicKey();


 Future<SecretKey>  secretKey();



                    
                }
                
            