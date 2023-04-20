import 'package:flutter/material.dart';
import 'package:invoice_maker/Screen/dashScreen.dart';
import 'package:invoice_maker/Screen/invoice.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => Dash(),
      'final':(context) => InvoiceScreen()
    },
  ));
}