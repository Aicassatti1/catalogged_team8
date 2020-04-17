import 'package:catapp/models/receipt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catapp/notifier/receipt_notifier.dart';

getReceipts(ReceiptNotifier receiptNotifier) async {
  QuerySnapshot snapshot =
      await Firestore.instance.collection('receipt').getDocuments();
  print(snapshot);
  List<Receipt> _receiptList = [];

  snapshot.documents.forEach((document) {
    Receipt receipt = Receipt.fromMap(document.data);
    print(receipt.expense_type);
    _receiptList.add(receipt);
  });
  receiptNotifier.receiptList = _receiptList;
}
