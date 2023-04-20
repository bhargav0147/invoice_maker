import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:invoice_maker/Screen/dashScreen.dart';

GlobalKey globalKey = GlobalKey();

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Center(
          child: Icon(
            Icons.shopping_bag,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SelectableText(
              "Patel",
              style: TextStyle(
                  fontFamily: 'popins',
                  color: Colors.black,
                  fontSize: 25,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5),
            SelectableText(
              "Suit & Saree",
              style: TextStyle(
                  fontFamily: 'popins',
                  color: Colors.black,
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Center(
                child: InkWell(
              onTap: () async {
                RenderRepaintBoundary boundary = globalKey.currentContext!
                    .findRenderObject()! as RenderRepaintBoundary;

                var image = await boundary.toImage();
                ByteData? bytdata = await image.toByteData(format: ImageByteFormat.png);
                Uint8List uint8List = bytdata!.buffer.asUint8List();

                await ImageGallerySaver.saveImage(uint8List);
                print(uint8List);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Invoice Saved"),
                  duration: Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.white,));
              },
              child: Icon(
                Icons.save,
                color: Colors.black,
                size: 25,
              ),
            )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: RepaintBoundary(
          key: globalKey,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name : ${txtpersonName.text}",
                  style: TextStyle(
                      fontFamily: 'popins',
                      color: Colors.black,
                      fontSize: 18,
                      letterSpacing: 1),
                ),
                SizedBox(height: 5),
                Text(
                  "Number : ${txtpersonNumber.text}",
                  style: TextStyle(
                      fontFamily: 'popins',
                      color: Colors.black,
                      fontSize: 18,
                      letterSpacing: 1),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 520,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 25,
                                    width: 150,
                                    child: Center(
                                      child: Text(
                                        "Product",
                                        style: TextStyle(
                                            fontFamily: 'popins',
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 25,
                                    width: 60,
                                    child: Center(
                                      child: Text(
                                        "Qty",
                                        style: TextStyle(
                                            fontFamily: 'popins',
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    child: Center(
                                      child: Text(
                                        "Price",
                                        style: TextStyle(
                                            fontFamily: 'popins',
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    child: Center(
                                      child: Text(
                                        "Tax",
                                        style: TextStyle(
                                            fontFamily: 'popins',
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    child: Center(
                                      child: Text(
                                        "Amount",
                                        style: TextStyle(
                                            fontFamily: 'popins',
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(thickness: 2, color: Colors.black),
                              SizedBox(
                                  height: 455,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) =>
                                        showItem(index),
                                    itemCount: productList.length,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            "Total Qty :",
                            style: TextStyle(
                                fontFamily: 'popins',
                                color: Colors.black,
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "$totalqty",
                            style: TextStyle(
                                fontFamily: 'popins',
                                color: Colors.black,
                                fontSize: 16,
                                letterSpacing: 1),
                          ),
                          Spacer(),
                          Text(
                            "Total Amount :",
                            style: TextStyle(
                                fontFamily: 'popins',
                                color: Colors.black,
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "$totalamount",
                            style: TextStyle(
                                fontFamily: 'popins',
                                color: Colors.black,
                                fontSize: 16,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget showItem(int index) {
    return Container(
      height: 50,
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 25,
            width: 150,
            child: Center(
              child: Text(
                "${productList[index].name}",
                style: TextStyle(
                    fontFamily: 'popins',
                    color: Colors.black,
                    fontSize: 15,
                    letterSpacing: 1),
              ),
            ),
          ),
          Container(
            height: 25,
            width: 60,
            child: Center(
              child: Text(
                "${productList[index].qty}",
                style: TextStyle(
                    fontFamily: 'popins',
                    color: Colors.black,
                    fontSize: 15,
                    letterSpacing: 1),
              ),
            ),
          ),
          Container(
            height: 25,
            width: 80,
            child: Center(
              child: Text(
                "${productList[index].price}",
                style: TextStyle(
                    fontFamily: 'popins',
                    color: Colors.black,
                    fontSize: 15,
                    letterSpacing: 1),
              ),
            ),
          ),
          Container(
            height: 25,
            width: 80,
            child: Center(
              child: Text(
                "18%",
                style: TextStyle(
                    fontFamily: 'popins',
                    color: Colors.black,
                    fontSize: 15,
                    letterSpacing: 1),
              ),
            ),
          ),
          Container(
            height: 25,
            width: 80,
            child: Center(
              child: Text(
                "${productList[index].amount}",
                style: TextStyle(
                    fontFamily: 'popins',
                    color: Colors.black,
                    fontSize: 15,
                    letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
