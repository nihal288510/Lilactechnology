import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const apiBaseLink = "test.vehup.com/api";
Future<http.Response> postJson(String suburl, Map<String, String> data) async {
  var url = Uri.parse("https://" + apiBaseLink + "/" + suburl);
  print('---------------------------------------');
  print(url);

  try {
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: convert.json.encode(data),
    );
    return response;
  } catch (e) {
    print("Error: $e");
    rethrow;
  }
}

Future<http.Response> postJson2(
    String suburl, Map<String, String> data, String token) async {
  var url = Uri.parse("https://" + apiBaseLink + "/" + suburl);
  print('---------------------------------------');
  print(url);

  try {
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: convert.json.encode(data),
    );
    return response;
  } catch (e) {
    print("Error: $e");
    rethrow;
  }
}
// Future<http.Response> getJson2(
//     String suburl, Map<String, String> data, String token) async {
//   var url = Uri.parse("https://" + apiBaseLink + "/" + suburl);
//   print('---------------------------------------');
//   print(url);

//   try {
//     var response = await http.post(
//       url,
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token",
//       },
//       body: convert.json.encode(data),
//     );
//     return response;
//   } catch (e) {
//     print("Error: $e");
//     rethrow;
//   }
// }

Future<http.Response> postJson3(
    String suburl, Map<String, dynamic> data) async {
  var url = await Uri.parse(
    "https://" + apiBaseLink + "/" + suburl,
    // {'q': '{https}'},
  );
  //print('---------------------------------------');
  print(url);

  const headercommon = {
    'Content-Type': 'application/json',
  };

  var response = await http.post(url,
      headers: headercommon, body: convert.json.encode(data));
  return response;
}

Future<http.Response> getJson(String suburl) async {
  var url = await Uri.parse(
    "https://" + apiBaseLink + "/" + suburl,
    // {'q': '{https}'},
  );
  print(url);

  url = Uri.parse("https://" + apiBaseLink + "/" + "/" + suburl);

  var response = await http.get(url);
  return response;
}

Future<http.Response> getJson2(String suburl, String token) async {
  var url = Uri.parse("https://" + apiBaseLink + "/" + suburl);
  print(url);

  var headers = {
    "Authorization": "Bearer $token",
  };

  var response = await http.get(url, headers: headers);
  return response;
}
