// // To parse this JSON data, do
// //
// // final invoice = invoiceFromJson(jsonString);
//
// import 'dart:convert';
//
// Invoice invoiceFromJson(String str) => Invoice.fromJson(json.decode(str));
//
// String invoiceToJson(Invoice data) => json.encode(data.toJson());
//
// class Invoice {
//   Invoice({
//     this.data,
//     this.error,
//     this.errorMessage,
//   });
//
//   Data data;
//   int error;
//   String errorMessage;
//
//   factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
//     data: Data.fromJson(json["data"]),
//     error: json["error"],
//     errorMessage: json["error_message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": data.toJson(),
//     "error": error,
//     "error_message": errorMessage,
//   };
// }
//
// class Data {
//   Data({
//     this.the0,
//     this.client,
//     this.clientData,
//     this.invoice,
//     this.invoiceEmail,
//     this.invoiceExtra,
//     this.invoiceItem,
//     this.invoicePayment,
//     this.invoiceSetting,
//     this.logo,
//     this.myData,
//     this.paymentLink,
//     this.paypal,
//     this.postStamp,
//     this.relatedItems,
//     this.signature,
//     this.summary,
//     this.summaryInvoice,
//     this.tag,
//     this.unitCount,
//   });
//
//   The0 the0;
//   Client client;
//   Client clientData;
//   InvoiceClass invoice;
//   List<dynamic> invoiceEmail;
//   InvoiceExtra invoiceExtra;
//   List<InvoiceItem> invoiceItem;
//   List<dynamic> invoicePayment;
//   InvoiceSetting invoiceSetting;
//   List<Signature> logo;
//   MyData myData;
//   String paymentLink;
//   bool paypal;
//   List<dynamic> postStamp;
//   List<dynamic> relatedItems;
//   Signature signature;
//   Summary summary;
//   SummaryInvoice summaryInvoice;
//   List<dynamic> tag;
//   List<dynamic> unitCount;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     the0: The0.fromJson(json["0"]),
//     client: Client.fromJson(json["Client"]),
//     clientData: Client.fromJson(json["ClientData"]),
//     invoice: InvoiceClass.fromJson(json["Invoice"]),
//     invoiceEmail: List<dynamic>.from(json["InvoiceEmail"].map((x) => x)),
//     invoiceExtra: InvoiceExtra.fromJson(json["InvoiceExtra"]),
//     invoiceItem: List<InvoiceItem>.from(json["InvoiceItem"].map((x) => InvoiceItem.fromJson(x))),
//     invoicePayment: List<dynamic>.from(json["InvoicePayment"].map((x) => x)),
//     invoiceSetting: InvoiceSetting.fromJson(json["InvoiceSetting"]),
//     logo: List<Signature>.from(json["Logo"].map((x) => Signature.fromJson(x))),
//     myData: MyData.fromJson(json["MyData"]),
//     paymentLink: json["PaymentLink"],
//     paypal: json["Paypal"],
//     postStamp: List<dynamic>.from(json["PostStamp"].map((x) => x)),
//     relatedItems: List<dynamic>.from(json["RelatedItems"].map((x) => x)),
//     signature: Signature.fromJson(json["Signature"]),
//     summary: Summary.fromJson(json["Summary"]),
//     summaryInvoice: SummaryInvoice.fromJson(json["SummaryInvoice"]),
//     tag: List<dynamic>.from(json["Tag"].map((x) => x)),
//     unitCount: List<dynamic>.from(json["UnitCount"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "0": the0.toJson(),
//     "Client": client.toJson(),
//     "ClientData": clientData.toJson(),
//     "Invoice": invoice.toJson(),
//     "InvoiceEmail": List<dynamic>.from(invoiceEmail.map((x) => x)),
//     "InvoiceExtra": invoiceExtra.toJson(),
//     "InvoiceItem": List<dynamic>.from(invoiceItem.map((x) => x.toJson())),
//     "InvoicePayment": List<dynamic>.from(invoicePayment.map((x) => x)),
//     "InvoiceSetting": invoiceSetting.toJson(),
//     "Logo": List<dynamic>.from(logo.map((x) => x.toJson())),
//     "MyData": myData.toJson(),
//     "PaymentLink": paymentLink,
//     "Paypal": paypal,
//     "PostStamp": List<dynamic>.from(postStamp.map((x) => x)),
//     "RelatedItems": List<dynamic>.from(relatedItems.map((x) => x)),
//     "Signature": signature.toJson(),
//     "Summary": summary.toJson(),
//     "SummaryInvoice": summaryInvoice.toJson(),
//     "Tag": List<dynamic>.from(tag.map((x) => x)),
//     "UnitCount": List<dynamic>.from(unitCount.map((x) => x)),
//   };
// }
//
// class Client {
//   Client({
//     this.account,
//     this.address,
//     this.bankAccount,
//     this.bankAccountId,
//     this.bankAccountPrefix,
//     this.bankCode,
//     this.city,
//     this.comment,
//     this.clientCountry,
//     this.countryId,
//     this.created,
//     this.currency,
//     this.defaultVariable,
//     this.deliveryAddress,
//     this.deliveryCity,
//     this.clientDeliveryCountry,
//     this.deliveryCountryId,
//     this.deliveryName,
//     this.deliveryPhone,
//     this.deliveryState,
//     this.deliveryZip,
//     this.dic,
//     this.discount,
//     this.distance,
//     this.dontTravel,
//     this.dueDate,
//     this.email,
//     this.fax,
//     this.iban,
//     this.icDph,
//     this.ico,
//     this.id,
//     this.modified,
//     this.name,
//     this.notices,
//     this.phone,
//     this.state,
//     this.swift,
//     this.tags,
//     this.userId,
//     this.userProfileId,
//     this.uuid,
//     this.zip,
//     this.country,
//     this.deliveryCountry,
//   });
//
//   dynamic account;
//   String address;
//   String bankAccount;
//   String bankAccountId;
//   dynamic bankAccountPrefix;
//   String bankCode;
//   String city;
//   String comment;
//   String clientCountry;
//   String countryId;
//   DateTime created;
//   dynamic currency;
//   String defaultVariable;
//   String deliveryAddress;
//   String deliveryCity;
//   String clientDeliveryCountry;
//   String deliveryCountryId;
//   String deliveryName;
//   String deliveryPhone;
//   String deliveryState;
//   String deliveryZip;
//   String dic;
//   dynamic discount;
//   dynamic distance;
//   dynamic dontTravel;
//   dynamic dueDate;
//   String email;
//   String fax;
//   String iban;
//   String icDph;
//   String ico;
//   String id;
//   DateTime modified;
//   String name;
//   bool notices;
//   String phone;
//   String state;
//   String swift;
//   dynamic tags;
//   String userId;
//   String userProfileId;
//   dynamic uuid;
//   String zip;
//   Country country;
//   Country deliveryCountry;
//
//   factory Client.fromJson(Map<String, dynamic> json) => Client(
//     account: json["account"],
//     address: json["address"],
//     bankAccount: json["bank_account"],
//     bankAccountId: json["bank_account_id"],
//     bankAccountPrefix: json["bank_account_prefix"],
//     bankCode: json["bank_code"],
//     city: json["city"],
//     comment: json["comment"],
//     clientCountry: json["country"],
//     countryId: json["country_id"],
//     created: DateTime.parse(json["created"]),
//     currency: json["currency"],
//     defaultVariable: json["default_variable"],
//     deliveryAddress: json["delivery_address"],
//     deliveryCity: json["delivery_city"],
//     clientDeliveryCountry: json["delivery_country"],
//     deliveryCountryId: json["delivery_country_id"],
//     deliveryName: json["delivery_name"],
//     deliveryPhone: json["delivery_phone"],
//     deliveryState: json["delivery_state"],
//     deliveryZip: json["delivery_zip"],
//     dic: json["dic"],
//     discount: json["discount"],
//     distance: json["distance"],
//     dontTravel: json["dont_travel"],
//     dueDate: json["due_date"],
//     email: json["email"],
//     fax: json["fax"],
//     iban: json["iban"],
//     icDph: json["ic_dph"],
//     ico: json["ico"],
//     id: json["id"],
//     modified: DateTime.parse(json["modified"]),
//     name: json["name"],
//     notices: json["notices"],
//     phone: json["phone"],
//     state: json["state"],
//     swift: json["swift"],
//     tags: json["tags"],
//     userId: json["user_id"],
//     userProfileId: json["user_profile_id"],
//     uuid: json["uuid"],
//     zip: json["zip"],
//     country: json["Country"] == null ? null : Country.fromJson(json["Country"]),
//     deliveryCountry: json["DeliveryCountry"] == null ? null : Country.fromJson(json["DeliveryCountry"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "account": account,
//     "address": address,
//     "bank_account": bankAccount,
//     "bank_account_id": bankAccountId,
//     "bank_account_prefix": bankAccountPrefix,
//     "bank_code": bankCode,
//     "city": city,
//     "comment": comment,
//     "country": clientCountry,
//     "country_id": countryId,
//     "created": created.toIso8601String(),
//     "currency": currency,
//     "default_variable": defaultVariable,
//     "delivery_address": deliveryAddress,
//     "delivery_city": deliveryCity,
//     "delivery_country": clientDeliveryCountry,
//     "delivery_country_id": deliveryCountryId,
//     "delivery_name": deliveryName,
//     "delivery_phone": deliveryPhone,
//     "delivery_state": deliveryState,
//     "delivery_zip": deliveryZip,
//     "dic": dic,
//     "discount": discount,
//     "distance": distance,
//     "dont_travel": dontTravel,
//     "due_date": dueDate,
//     "email": email,
//     "fax": fax,
//     "iban": iban,
//     "ic_dph": icDph,
//     "ico": ico,
//     "id": id,
//     "modified": modified.toIso8601String(),
//     "name": name,
//     "notices": notices,
//     "phone": phone,
//     "state": state,
//     "swift": swift,
//     "tags": tags,
//     "user_id": userId,
//     "user_profile_id": userProfileId,
//     "uuid": uuid,
//     "zip": zip,
//     "Country": country == null ? null : country.toJson(),
//     "DeliveryCountry": deliveryCountry == null ? null : deliveryCountry.toJson(),
//   };
// }
//
// class Country {
//   Country({
//     this.eu,
//     this.id,
//     this.iso,
//     this.name,
//   });
//
//   bool eu;
//   String id;
//   String iso;
//   String name;
//
//   factory Country.fromJson(Map<String, dynamic> json) => Country(
//     eu: json["eu"],
//     id: json["id"],
//     iso: json["iso"],
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "eu": eu,
//     "id": id,
//     "iso": iso,
//     "name": name,
//   };
// }
//
// class InvoiceClass {
//   InvoiceClass({
//     this.accountingDate,
//     this.amount,
//     this.amountPaid,
//     this.clientData,
//     this.clientId,
//     this.comment,
//     this.constant,
//     this.countryExchangeRate,
//     this.created,
//     this.delivery,
//     this.deliveryType,
//     this.demo,
//     this.deposit,
//     this.discount,
//     this.due,
//     this.estimateId,
//     this.exchangeRate,
//     this.flag,
//     this.headerComment,
//     this.homeCurrency,
//     this.id,
//     this.importId,
//     this.importParentId,
//     this.importType,
//     this.internalComment,
//     this.invoiceCurrency,
//     this.invoiceNo,
//     this.invoiceNoFormatted,
//     this.invoiceNoFormattedLength,
//     this.invoiceNoFormattedRaw,
//     this.issuedBy,
//     this.issuedByEmail,
//     this.issuedByPhone,
//     this.issuedByWeb,
//     this.itemsData,
//     this.itemsName,
//     this.lang,
//     this.mask,
//     this.modified,
//     this.myData,
//     this.name,
//     this.orderNo,
//     this.paid,
//     this.parentId,
//     this.paydate,
//     this.paymentType,
//     this.proformaId,
//     this.recurring,
//     this.rounding,
//     this.sequenceId,
//     this.showItemsWithDph,
//     this.showSpecialVat,
//     this.specialVatScheme,
//     this.specific,
//     this.status,
//     this.summaryInvoice,
//     this.tags,
//     this.taxDocument,
//     this.taxdate,
//     this.token,
//     this.type,
//     this.userId,
//     this.userProfileId,
//     this.variable,
//     this.variableRaw,
//     this.vat,
//     this.vatTransfer,
//   });
//
//   DateTime accountingDate;
//   String amount;
//   String amountPaid;
//   String clientData;
//   String clientId;
//   String comment;
//   String constant;
//   String countryExchangeRate;
//   DateTime created;
//   dynamic delivery;
//   String deliveryType;
//   String demo;
//   String deposit;
//   String discount;
//   DateTime due;
//   dynamic estimateId;
//   int exchangeRate;
//   String flag;
//   String headerComment;
//   String homeCurrency;
//   String id;
//   dynamic importId;
//   dynamic importParentId;
//   dynamic importType;
//   String internalComment;
//   String invoiceCurrency;
//   String invoiceNo;
//   String invoiceNoFormatted;
//   String invoiceNoFormattedLength;
//   String invoiceNoFormattedRaw;
//   String issuedBy;
//   String issuedByEmail;
//   String issuedByPhone;
//   String issuedByWeb;
//   String itemsData;
//   dynamic itemsName;
//   dynamic lang;
//   String mask;
//   DateTime modified;
//   String myData;
//   String name;
//   dynamic orderNo;
//   String paid;
//   dynamic parentId;
//   dynamic paydate;
//   dynamic paymentType;
//   dynamic proformaId;
//   dynamic recurring;
//   String rounding;
//   String sequenceId;
//   bool showItemsWithDph;
//   bool showSpecialVat;
//   dynamic specialVatScheme;
//   String specific;
//   String status;
//   dynamic summaryInvoice;
//   dynamic tags;
//   dynamic taxDocument;
//   dynamic taxdate;
//   String token;
//   String type;
//   String userId;
//   String userProfileId;
//   String variable;
//   String variableRaw;
//   String vat;
//   dynamic vatTransfer;
//
//   factory InvoiceClass.fromJson(Map<String, dynamic> json) => InvoiceClass(
//     accountingDate: DateTime.parse(json["accounting_date"]),
//     amount: json["amount"],
//     amountPaid: json["amount_paid"],
//     clientData: json["client_data"],
//     clientId: json["client_id"],
//     comment: json["comment"],
//     constant: json["constant"],
//     countryExchangeRate: json["country_exchange_rate"],
//     created: DateTime.parse(json["created"]),
//     delivery: json["delivery"],
//     deliveryType: json["delivery_type"],
//     demo: json["demo"],
//     deposit: json["deposit"],
//     discount: json["discount"],
//     due: DateTime.parse(json["due"]),
//     estimateId: json["estimate_id"],
//     exchangeRate: json["exchange_rate"],
//     flag: json["flag"],
//     headerComment: json["header_comment"],
//     homeCurrency: json["home_currency"],
//     id: json["id"],
//     importId: json["import_id"],
//     importParentId: json["import_parent_id"],
//     importType: json["import_type"],
//     internalComment: json["internal_comment"],
//     invoiceCurrency: json["invoice_currency"],
//     invoiceNo: json["invoice_no"],
//     invoiceNoFormatted: json["invoice_no_formatted"],
//     invoiceNoFormattedLength: json["invoice_no_formatted_length"],
//     invoiceNoFormattedRaw: json["invoice_no_formatted_raw"],
//     issuedBy: json["issued_by"],
//     issuedByEmail: json["issued_by_email"],
//     issuedByPhone: json["issued_by_phone"],
//     issuedByWeb: json["issued_by_web"],
//     itemsData: json["items_data"],
//     itemsName: json["items_name"],
//     lang: json["lang"],
//     mask: json["mask"],
//     modified: DateTime.parse(json["modified"]),
//     myData: json["my_data"],
//     name: json["name"],
//     orderNo: json["order_no"],
//     paid: json["paid"],
//     parentId: json["parent_id"],
//     paydate: json["paydate"],
//     paymentType: json["payment_type"],
//     proformaId: json["proforma_id"],
//     recurring: json["recurring"],
//     rounding: json["rounding"],
//     sequenceId: json["sequence_id"],
//     showItemsWithDph: json["show_items_with_dph"],
//     showSpecialVat: json["show_special_vat"],
//     specialVatScheme: json["special_vat_scheme"],
//     specific: json["specific"],
//     status: json["status"],
//     summaryInvoice: json["summary_invoice"],
//     tags: json["tags"],
//     taxDocument: json["tax_document"],
//     taxdate: json["taxdate"],
//     token: json["token"],
//     type: json["type"],
//     userId: json["user_id"],
//     userProfileId: json["user_profile_id"],
//     variable: json["variable"],
//     variableRaw: json["variable_raw"],
//     vat: json["vat"],
//     vatTransfer: json["vat_transfer"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "accounting_date": "${accountingDate.year.toString().padLeft(4, '0')}-${accountingDate.month.toString().padLeft(2, '0')}-${accountingDate.day.toString().padLeft(2, '0')}",
//     "amount": amount,
//     "amount_paid": amountPaid,
//     "client_data": clientData,
//     "client_id": clientId,
//     "comment": comment,
//     "constant": constant,
//     "country_exchange_rate": countryExchangeRate,
//     "created": created.toIso8601String(),
//     "delivery": delivery,
//     "delivery_type": deliveryType,
//     "demo": demo,
//     "deposit": deposit,
//     "discount": discount,
//     "due": "${due.year.toString().padLeft(4, '0')}-${due.month.toString().padLeft(2, '0')}-${due.day.toString().padLeft(2, '0')}",
//     "estimate_id": estimateId,
//     "exchange_rate": exchangeRate,
//     "flag": flag,
//     "header_comment": headerComment,
//     "home_currency": homeCurrency,
//     "id": id,
//     "import_id": importId,
//     "import_parent_id": importParentId,
//     "import_type": importType,
//     "internal_comment": internalComment,
//     "invoice_currency": invoiceCurrency,
//     "invoice_no": invoiceNo,
//     "invoice_no_formatted": invoiceNoFormatted,
//     "invoice_no_formatted_length": invoiceNoFormattedLength,
//     "invoice_no_formatted_raw": invoiceNoFormattedRaw,
//     "issued_by": issuedBy,
//     "issued_by_email": issuedByEmail,
//     "issued_by_phone": issuedByPhone,
//     "issued_by_web": issuedByWeb,
//     "items_data": itemsData,
//     "items_name": itemsName,
//     "lang": lang,
//     "mask": mask,
//     "modified": modified.toIso8601String(),
//     "my_data": myData,
//     "name": name,
//     "order_no": orderNo,
//     "paid": paid,
//     "parent_id": parentId,
//     "paydate": paydate,
//     "payment_type": paymentType,
//     "proforma_id": proformaId,
//     "recurring": recurring,
//     "rounding": rounding,
//     "sequence_id": sequenceId,
//     "show_items_with_dph": showItemsWithDph,
//     "show_special_vat": showSpecialVat,
//     "special_vat_scheme": specialVatScheme,
//     "specific": specific,
//     "status": status,
//     "summary_invoice": summaryInvoice,
//     "tags": tags,
//     "tax_document": taxDocument,
//     "taxdate": taxdate,
//     "token": token,
//     "type": type,
//     "user_id": userId,
//     "user_profile_id": userProfileId,
//     "variable": variable,
//     "variable_raw": variableRaw,
//     "vat": vat,
//     "vat_transfer": vatTransfer,
//   };
// }
//
// class InvoiceExtra {
//   InvoiceExtra({
//     this.pickupPointId,
//   });
//
//   String pickupPointId;
//
//   factory InvoiceExtra.fromJson(Map<String, dynamic> json) => InvoiceExtra(
//     pickupPointId: json["pickup_point_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "pickup_point_id": pickupPointId,
//   };
// }
//
// class InvoiceItem {
//   InvoiceItem({
//     this.accountingDetail,
//     this.description,
//     this.discount,
//     this.discountDescription,
//     this.discountNoVat,
//     this.discountNoVatTotal,
//     this.discountWithVat,
//     this.discountWithVatTotal,
//     this.hideInAutocomplete,
//     this.id,
//     this.invoiceId,
//     this.itemPrice,
//     this.itemPriceNoDiscount,
//     this.itemPriceVat,
//     this.itemPriceVatNoDiscount,
//     this.name,
//     this.ordernum,
//     this.quantity,
//     this.sku,
//     this.stockItemId,
//     this.tax,
//     this.taxDeposit,
//     this.unit,
//     this.unitPrice,
//     this.unitPriceDiscount,
//     this.unitPriceVat,
//     this.unitPriceVatNoDiscount,
//     this.userId,
//     this.userProfileId,
//   });
//
//   AccountingDetail accountingDetail;
//   String description;
//   int discount;
//   String discountDescription;
//   int discountNoVat;
//   int discountNoVatTotal;
//   int discountWithVat;
//   int discountWithVatTotal;
//   dynamic hideInAutocomplete;
//   String id;
//   String invoiceId;
//   int itemPrice;
//   int itemPriceNoDiscount;
//   int itemPriceVat;
//   int itemPriceVatNoDiscount;
//   String name;
//   String ordernum;
//   dynamic quantity;
//   dynamic sku;
//   dynamic stockItemId;
//   int tax;
//   dynamic taxDeposit;
//   String unit;
//   int unitPrice;
//   int unitPriceDiscount;
//   int unitPriceVat;
//   int unitPriceVatNoDiscount;
//   String userId;
//   String userProfileId;
//
//   factory InvoiceItem.fromJson(Map<String, dynamic> json) => InvoiceItem(
//     accountingDetail: AccountingDetail.fromJson(json["AccountingDetail"]),
//     description: json["description"],
//     discount: json["discount"],
//     discountDescription: json["discount_description"],
//     discountNoVat: json["discount_no_vat"],
//     discountNoVatTotal: json["discount_no_vat_total"],
//     discountWithVat: json["discount_with_vat"],
//     discountWithVatTotal: json["discount_with_vat_total"],
//     hideInAutocomplete: json["hide_in_autocomplete"],
//     id: json["id"],
//     invoiceId: json["invoice_id"],
//     itemPrice: json["item_price"],
//     itemPriceNoDiscount: json["item_price_no_discount"],
//     itemPriceVat: json["item_price_vat"],
//     itemPriceVatNoDiscount: json["item_price_vat_no_discount"],
//     name: json["name"],
//     ordernum: json["ordernum"],
//     quantity: json["quantity"],
//     sku: json["sku"],
//     stockItemId: json["stock_item_id"],
//     tax: json["tax"],
//     taxDeposit: json["tax_deposit"],
//     unit: json["unit"],
//     unitPrice: json["unit_price"],
//     unitPriceDiscount: json["unit_price_discount"],
//     unitPriceVat: json["unit_price_vat"],
//     unitPriceVatNoDiscount: json["unit_price_vat_no_discount"],
//     userId: json["user_id"],
//     userProfileId: json["user_profile_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "AccountingDetail": accountingDetail.toJson(),
//     "description": description,
//     "discount": discount,
//     "discount_description": discountDescription,
//     "discount_no_vat": discountNoVat,
//     "discount_no_vat_total": discountNoVatTotal,
//     "discount_with_vat": discountWithVat,
//     "discount_with_vat_total": discountWithVatTotal,
//     "hide_in_autocomplete": hideInAutocomplete,
//     "id": id,
//     "invoice_id": invoiceId,
//     "item_price": itemPrice,
//     "item_price_no_discount": itemPriceNoDiscount,
//     "item_price_vat": itemPriceVat,
//     "item_price_vat_no_discount": itemPriceVatNoDiscount,
//     "name": name,
//     "ordernum": ordernum,
//     "quantity": quantity,
//     "sku": sku,
//     "stock_item_id": stockItemId,
//     "tax": tax,
//     "tax_deposit": taxDeposit,
//     "unit": unit,
//     "unit_price": unitPrice,
//     "unit_price_discount": unitPriceDiscount,
//     "unit_price_vat": unitPriceVat,
//     "unit_price_vat_no_discount": unitPriceVatNoDiscount,
//     "user_id": userId,
//     "user_profile_id": userProfileId,
//   };
// }
//
// class AccountingDetail {
//   AccountingDetail({
//     this.analyticsAccount,
//     this.documentId,
//     this.documentItemId,
//     this.id,
//     this.itemType,
//     this.operation,
//     this.order,
//     this.place,
//     this.preconfidence,
//     this.syntheticAccount,
//     this.type,
//     this.userProfileId,
//   });
//
//   String analyticsAccount;
//   String documentId;
//   String documentItemId;
//   String id;
//   String itemType;
//   String operation;
//   String order;
//   String place;
//   String preconfidence;
//   String syntheticAccount;
//   String type;
//   String userProfileId;
//
//   factory AccountingDetail.fromJson(Map<String, dynamic> json) => AccountingDetail(
//     analyticsAccount: json["analytics_account"],
//     documentId: json["document_id"],
//     documentItemId: json["document_item_id"],
//     id: json["id"],
//     itemType: json["item_type"],
//     operation: json["operation"],
//     order: json["order"],
//     place: json["place"],
//     preconfidence: json["preconfidence"],
//     syntheticAccount: json["synthetic_account"],
//     type: json["type"],
//     userProfileId: json["user_profile_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "analytics_account": analyticsAccount,
//     "document_id": documentId,
//     "document_item_id": documentItemId,
//     "id": id,
//     "item_type": itemType,
//     "operation": operation,
//     "order": order,
//     "place": place,
//     "preconfidence": preconfidence,
//     "synthetic_account": syntheticAccount,
//     "type": type,
//     "user_profile_id": userProfileId,
//   };
// }
//
// class InvoiceSetting {
//   InvoiceSetting({
//     this.bysquare,
//     this.language,
//     this.onlinePayment,
//     this.paymentInfo,
//     this.paypal,
//     this.signature,
//   });
//
//   bool bysquare;
//   String language;
//   bool onlinePayment;
//   bool paymentInfo;
//   bool paypal;
//   bool signature;
//
//   factory InvoiceSetting.fromJson(Map<String, dynamic> json) => InvoiceSetting(
//     bysquare: json["bysquare"],
//     language: json["language"],
//     onlinePayment: json["online_payment"],
//     paymentInfo: json["payment_info"],
//     paypal: json["paypal"],
//     signature: json["signature"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "bysquare": bysquare,
//     "language": language,
//     "online_payment": onlinePayment,
//     "payment_info": paymentInfo,
//     "paypal": paypal,
//     "signature": signature,
//   };
// }
//
// class Signature {
//   Signature({
//     this.alternative,
//     this.basename,
//     this.checksum,
//     this.created,
//     this.signatureDefault,
//     this.deleteFlag,
//     this.dirname,
//     this.externFile,
//     this.foreignKey,
//     this.group,
//     this.id,
//     this.mobilePath,
//     this.model,
//     this.modified,
//     this.path,
//     this.size,
//   });
//
//   dynamic alternative;
//   String basename;
//   String checksum;
//   DateTime created;
//   bool signatureDefault;
//   bool deleteFlag;
//   String dirname;
//   String externFile;
//   String foreignKey;
//   String group;
//   String id;
//   String mobilePath;
//   String model;
//   DateTime modified;
//   String path;
//   String size;
//
//   factory Signature.fromJson(Map<String, dynamic> json) => Signature(
//     alternative: json["alternative"],
//     basename: json["basename"],
//     checksum: json["checksum"],
//     created: DateTime.parse(json["created"]),
//     signatureDefault: json["default"],
//     deleteFlag: json["delete_flag"],
//     dirname: json["dirname"],
//     externFile: json["extern_file"],
//     foreignKey: json["foreign_key"],
//     group: json["group"],
//     id: json["id"],
//     mobilePath: json["mobile_path"] == null ? null : json["mobile_path"],
//     model: json["model"],
//     modified: DateTime.parse(json["modified"]),
//     path: json["path"],
//     size: json["size"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "alternative": alternative,
//     "basename": basename,
//     "checksum": checksum,
//     "created": created.toIso8601String(),
//     "default": signatureDefault,
//     "delete_flag": deleteFlag,
//     "dirname": dirname,
//     "extern_file": externFile,
//     "foreign_key": foreignKey,
//     "group": group,
//     "id": id,
//     "mobile_path": mobilePath == null ? null : mobilePath,
//     "model": model,
//     "modified": modified.toIso8601String(),
//     "path": path,
//     "size": size,
//   };
// }
//
// class MyData {
//   MyData({
//     this.bankAccount,
//     this.logo,
//     this.logoRaw,
//     this.signature,
//     this.signatureRaw,
//     this.address,
//     this.businessRegister,
//     this.city,
//     this.companyName,
//     this.country,
//     this.countryId,
//     this.dic,
//     this.icDph,
//     this.ico,
//     this.id,
//     this.taxPayer,
//     this.userId,
//     this.zip,
//   });
//
//   List<BankAccount> bankAccount;
//   String logo;
//   List<Signature> logoRaw;
//   String signature;
//   Signature signatureRaw;
//   String address;
//   String businessRegister;
//   String city;
//   String companyName;
//   Country country;
//   int countryId;
//   String dic;
//   String icDph;
//   String ico;
//   String id;
//   String taxPayer;
//   String userId;
//   String zip;
//
//   factory MyData.fromJson(Map<String, dynamic> json) => MyData(
//     bankAccount: List<BankAccount>.from(json["BankAccount"].map((x) => BankAccount.fromJson(x))),
//     logo: json["Logo"],
//     logoRaw: List<Signature>.from(json["LogoRaw"].map((x) => Signature.fromJson(x))),
//     signature: json["Signature"],
//     signatureRaw: Signature.fromJson(json["SignatureRaw"]),
//     address: json["address"],
//     businessRegister: json["business_register"],
//     city: json["city"],
//     companyName: json["company_name"],
//     country: Country.fromJson(json["country"]),
//     countryId: json["country_id"],
//     dic: json["dic"],
//     icDph: json["ic_dph"],
//     ico: json["ico"],
//     id: json["id"],
//     taxPayer: json["tax_payer"],
//     userId: json["user_id"],
//     zip: json["zip"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "BankAccount": List<dynamic>.from(bankAccount.map((x) => x.toJson())),
//     "Logo": logo,
//     "LogoRaw": List<dynamic>.from(logoRaw.map((x) => x.toJson())),
//     "Signature": signature,
//     "SignatureRaw": signatureRaw.toJson(),
//     "address": address,
//     "business_register": businessRegister,
//     "city": city,
//     "company_name": companyName,
//     "country": country.toJson(),
//     "country_id": countryId,
//     "dic": dic,
//     "ic_dph": icDph,
//     "ico": ico,
//     "id": id,
//     "tax_payer": taxPayer,
//     "user_id": userId,
//     "zip": zip,
//   };
// }
//
// class BankAccount {
//   BankAccount({
//     this.account,
//     this.bankCode,
//     this.bankName,
//     this.countryId,
//     this.iban,
//     this.showAccount,
//     this.swift,
//   });
//
//   String account;
//   String bankCode;
//   String bankName;
//   String countryId;
//   String iban;
//   bool showAccount;
//   String swift;
//
//   factory BankAccount.fromJson(Map<String, dynamic> json) => BankAccount(
//     account: json["account"],
//     bankCode: json["bank_code"],
//     bankName: json["bank_name"],
//     countryId: json["country_id"],
//     iban: json["iban"],
//     showAccount: json["show_account"],
//     swift: json["swift"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "account": account,
//     "bank_code": bankCode,
//     "bank_name": bankName,
//     "country_id": countryId,
//     "iban": iban,
//     "show_account": showAccount,
//     "swift": swift,
//   };
// }
//
// class Summary {
//   Summary({
//     this.discount,
//     this.invoiceTotal,
//     this.vatBaseSeparate,
//     this.vatBaseTotal,
//     this.vatSeparate,
//     this.vatTotal,
//   });
//
//   double discount;
//   double invoiceTotal;
//   Vat vatBaseSeparate;
//   int vatBaseTotal;
//   Vat vatSeparate;
//   double vatTotal;
//
//   factory Summary.fromJson(Map<String, dynamic> json) => Summary(
//     discount: json["discount"].toDouble(),
//     invoiceTotal: json["invoice_total"].toDouble(),
//     vatBaseSeparate: Vat.fromJson(json["vat_base_separate"]),
//     vatBaseTotal: json["vat_base_total"],
//     vatSeparate: Vat.fromJson(json["vat_separate"]),
//     vatTotal: json["vat_total"].toDouble(),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "discount": discount,
//     "invoice_total": invoiceTotal,
//     "vat_base_separate": vatBaseSeparate.toJson(),
//     "vat_base_total": vatBaseTotal,
//     "vat_separate": vatSeparate.toJson(),
//     "vat_total": vatTotal,
//   };
// }
//
// class Vat {
//   Vat({
//     this.the20,
//   });
//
//   double the20;
//
//   factory Vat.fromJson(Map<String, dynamic> json) => Vat(
//     the20: json["20"].toDouble(),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "20": the20,
//   };
// }
//
// class SummaryInvoice {
//   SummaryInvoice({
//     this.vatBaseSeparateNegative,
//     this.vatBaseSeparatePositive,
//     this.vatSeparateNegative,
//     this.vatSeparatePositive,
//   });
//
//   Vat vatBaseSeparateNegative;
//   Vat vatBaseSeparatePositive;
//   Vat vatSeparateNegative;
//   Vat vatSeparatePositive;
//
//   factory SummaryInvoice.fromJson(Map<String, dynamic> json) => SummaryInvoice(
//     vatBaseSeparateNegative: Vat.fromJson(json["vat_base_separate_negative"]),
//     vatBaseSeparatePositive: Vat.fromJson(json["vat_base_separate_positive"]),
//     vatSeparateNegative: Vat.fromJson(json["vat_separate_negative"]),
//     vatSeparatePositive: Vat.fromJson(json["vat_separate_positive"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "vat_base_separate_negative": vatBaseSeparateNegative.toJson(),
//     "vat_base_separate_positive": vatBaseSeparatePositive.toJson(),
//     "vat_separate_negative": vatSeparateNegative.toJson(),
//     "vat_separate_positive": vatSeparatePositive.toJson(),
//   };
// }
//
// class The0 {
//   The0({
//     this.toPay,
//     this.toPayInInvoiceCurrency,
//     this.total,
//   });
//
//   String toPay;
//   String toPayInInvoiceCurrency;
//   String total;
//
//   factory The0.fromJson(Map<String, dynamic> json) => The0(
//     toPay: json["to_pay"],
//     toPayInInvoiceCurrency: json["to_pay_in_invoice_currency"],
//     total: json["total"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "to_pay": toPay,
//     "to_pay_in_invoice_currency": toPayInInvoiceCurrency,
//     "total": total,
//   };
// }
