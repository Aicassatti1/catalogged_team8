import 'package:flutter/material.dart';
import 'package:catapp/notifier/receipt_notifier.dart';
import 'package:provider/provider.dart';
import 'package:catapp/api/receipt_api.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    ReceiptNotifier receiptNotifier =
        Provider.of<ReceiptNotifier>(context, listen: false);
    getReceipts(receiptNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ReceiptNotifier receiptNotifier = Provider.of<ReceiptNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          // title: Text('Login'),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('List of Receipt'),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/catalogged-d9508.appspot.com/o/receipt1.jpeg?alt=media&token=fef1173e-9b17-4b1a-9e57-4dfffc126695',
                width: 120,
                fit: BoxFit.fitWidth,
              ),
              title: Text("Receipt " +
                  receiptNotifier.receiptList[index].id_receipt.toString() +
                  "-" +
                  receiptNotifier.receiptList[index].expense_type),
              subtitle: Text("Purchase Date: " +
                  receiptNotifier.receiptList[index].purchase_date.toString()),
            );
          },
          itemCount: receiptNotifier.receiptList.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.black,
            );
          },
        ));
  }
}
