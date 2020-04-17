import 'dart:collection';
import 'package:catapp/models/receipt.dart';
import 'package:flutter/cupertino.dart';

class ReceiptNotifier with ChangeNotifier{
  List<Receipt> _receiptList =[];
  Receipt _currentReceipt;
  UnmodifiableListView<Receipt> get receiptList => UnmodifiableListView(_receiptList);
  Receipt get currentReceipt => _currentReceipt;

  set receiptList(List<Receipt> receiptList) {
    _receiptList = receiptList;
    notifyListeners();
  }

  set currentReceipt(Receipt receipt) {
    _currentReceipt = receipt;
    notifyListeners();
  }
}
