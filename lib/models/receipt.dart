import 'package:intl/intl.dart';

class Receipt {
  int id_receipt;
  String expense_type;
  int id_category;
  int id_company;
  int id_person;
  int id_store;
  String payment_type;
  DateTime purchase_date;
  DateTime return_date;
  String survey_link;

  Receipt();

  Receipt.fromMap(Map<String, dynamic> data) {
    id_receipt = data['id_receipt'] ?? null;
    expense_type = data['expense_type'];
    id_category = data['id_category'] ?? null;
    id_company = data['id_company'] ?? null;
    id_person = data['id_person'] ?? null;

    id_store = data['id_store'] ?? null;
    payment_type = data['payment_type'];

    purchase_date = DateTime.parse(data['purchase_date'].toDate().toString());
    return_date = DateTime.parse(data['return_date'].toDate().toString());
    survey_link = data['survey_link'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id_receipt': id_receipt,
      'expense_type': expense_type,
      'id_category': id_category,
      'id_company': id_company,
      'id_person': id_person,
      'id_store': id_store,
      'payment_type': payment_type,
      'purchase_date': purchase_date,
      'return_date': return_date,
      'survey_link': survey_link
    };
  }
}
