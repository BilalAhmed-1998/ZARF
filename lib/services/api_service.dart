import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:zarf/invoice.dart';
import 'package:http/http.dart' as http;
import 'package:zarf/secret/key.dart';

class InvoiceData{
  String clientName="tobeentered";
  String clientIco="000";
  String clientAddress="to be entered";
  String clientCountry="to be entered";
  String clientCity="to be entered";
  double unitPrice=1749;


}

class ApiService {
  String base_url="https://moja.superfaktura.sk";
  String sandbox_url="https://sandbox.superfaktura.sk";
  final auth= "SFAPI email=zarfstudy@gmail.com&apikey=$apiKey&module=invoice1.0&company_id=73368";//526
  Future<String> createInvoice(InvoiceData ivData)async{
    final clientData=
    {
    "Client":{
        "name":"${ivData.clientName}",
        "ico": "${Random().nextInt(9999999)}",
        "address": "${ivData.clientAddress}",
        "country" :"${ivData.clientCountry}",
        "city":"${ivData.clientCity}"
         }
    };

    final invoiceBody={
      "Invoice":{
        "name": "ZarfInvoice",
        "bank_accounts": [
          {
            "bank_name": "Tatra banka, a.s.: 2947118174/1100",
            "iban": "SK41 1100 0000 0029 4711 8174",
            "swift": "TATRSKBX"
          }
        ],
      },
      "InvoiceItem":[
        {
          "description": "Premium Student Plan",
          "name": "Zarf Study",
          "tax": 0,
          "unit_price": ivData.unitPrice,
          "quantity": 1,
          "unit":"pc"
        }
      ],
      "Client":{

        "name":"${ivData.clientName}",
        "ico": "${Random().nextInt(9999999)}",
        "address": "${ivData.clientAddress}",
        "country" :"${ivData.clientCountry}",
        "city":"${ivData.clientCity}"

      },
      "MyData":{
        "address":"Jánošíkova 40A",
        "city":"Prešov",
        "country_id":"191",
        "dic":"2121597610",
        "ic_dph":"SK2121597610",
        "zip":"08001"
      }

    }
    ;

    try{
      // final cl = await http.post(
      //   Uri.parse("$sandbox_url/clients/create"),
      //   headers:{
      //     HttpHeaders.authorizationHeader: auth,
      //     HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
      //   },
      //   encoding: Encoding.getByName('utf-8'),
      //   body: {"data":jsonEncode(clientData)},
      //
      // );

      final res = await http.post(
        Uri.parse("$base_url/invoices/create"),
        headers:{
          HttpHeaders.authorizationHeader: auth,
          HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"data": jsonEncode(invoiceBody)},

      );
      print(res.statusCode);
      print(res.body);

        final responseJson = jsonDecode(res.body);
        print(responseJson["data"]["Invoice"]["id"]);
        print(responseJson["data"]["Invoice"]["name"]);

        return responseJson["data"]["Invoice"]["id"];
       //return Invoice.fromJson(responseJson);
    }catch (e){
      //print(e);
      throw e;
    }
  }
  Future<List<int>> getPDF(String id)async {
    final pdfInvoice = await http.get(
      Uri.parse("$base_url/ukr/invoices/pdf/$id/token:111/signature:1/bysquare:1"),
      headers: {
        HttpHeaders.authorizationHeader: auth,
        HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
      },
    );
    return pdfInvoice.bodyBytes;
  }
  Future sendPDFtoEmail(String id,String email)async {
    final clientData=
    {
    "Email":{
        "invoice_id":id,
        "to": email,
        "pdf_language":"eng"
     } 
    };
    final emailData=
    {
    "InvoiceEmail":{
    "invoice_id":id,
    "email":email,
    "subject":"subject",
    "message":"hello world"
      }
    };
    final send = await http.post(
      Uri.parse("$base_url/ukr/invoices/send"),
      headers: {
        HttpHeaders.authorizationHeader: auth,
        HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {"data": jsonEncode(clientData)},
    );
    if (send.statusCode==200){
      print("sent successful");
      final mark = await http.post(
        Uri.parse("$base_url/invoices/mark_as_sent"),
        headers: {
          HttpHeaders.authorizationHeader: auth,
          HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"data": jsonEncode(emailData)},

      );
      return true;
    }else{
      return false;
    }
  }
}
