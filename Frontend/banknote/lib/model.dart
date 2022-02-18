import 'dart:convert';

import 'package:banknote/string_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppModel {
  Map<String, double> data;

  AppModel(this.data);

  Future<String> getPrediction(BuildContext context) async {
    var client = http.Client();

  //  await showDialog(
  //       context: context,
  //       builder: (_) {
  //         return Material(
  //                     child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(StringUrl.uri.toString()),
  //               const SizedBox(height:10),
  //               Text(json.encode(data)),
  //                 const SizedBox(height:10),
  //             ],
  //           ),
  //         );
  //       });

    var response = await client.post(StringUrl.uri,
        body: json.encode(data), headers: {'content-type': 'application/json'});

    String? predResult;

    try {
      if (response.statusCode == 200) {
        print('Data Gotten');
        var result = json.decode(response.body);

        //  await showDialog(
        // context: context,
        // builder: (_) {
        //   return Material(
        //               child: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(result.toString()),
                
        //       ],
        //     ),
        //   );
        // });

        predResult = result['prediction'];
      // }else{
      //        await showDialog(
      //   context: context,
      //   builder: (_) {
      //     return Material(
      //                 child: Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(response.statusCode.toString()
      //           ),
      //         ],
      //       ),
      //     );
      //   });
      // }
    }
    } catch (e) {
      print(e);
      print('hmm');

      //  await showDialog(
      //   context: context,
      //   builder: (_) {
      //     return Material(
      //                 child: Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(e.toString()
      //           ),
      //         ],
      //       ),
      //     );
      //   });

    }

    return predResult!;
  }
}
