import 'package:flutter/material.dart';
import 'package:invoice_maker/utils/productClass.dart';
TextEditingController txtpersonName = TextEditingController();
TextEditingController txtpersonNumber = TextEditingController();
List<ProductClass> productList = [];
int totalqty=0,totalamount=0;
class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  TextEditingController txtPName = TextEditingController();
  TextEditingController txtPQty = TextEditingController();
  TextEditingController txtPPrice = TextEditingController();
  var txtkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: SafeArea(
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
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,context: context, builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Invoice Details",
                            style: TextStyle(
                                fontFamily: 'popins',
                                color: Colors.black,
                                fontSize: 20,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: txtpersonName,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    label: Text(
                                      "Name",
                                      style: TextStyle(
                                          fontFamily: 'popins',
                                          color: Colors.black,
                                          fontSize: 15,
                                          letterSpacing: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        BorderSide(color: Colors.black))),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                controller: txtpersonNumber,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    label: Text(
                                      "Number",
                                      style: TextStyle(
                                          fontFamily: 'popins',
                                          color: Colors.black,
                                          fontSize: 15,
                                          letterSpacing: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        BorderSide(color: Colors.black))),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontFamily: 'popins',
                                              color: Colors.white,
                                              fontSize: 15,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(context, 'final');
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Done",
                                          style: TextStyle(
                                              fontFamily: 'popins',
                                              color: Colors.white,
                                              fontSize: 15,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },);
                    },
                    child: Icon(
                Icons.download,
                color: Colors.black,
                size: 25,
              ),
                  )),
            )
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 620,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "No.",
                                style: TextStyle(
                                    fontFamily: 'popins',
                                    color: Colors.black,
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                "Product",
                                style: TextStyle(
                                    fontFamily: 'popins',
                                    color: Colors.black,
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                "Qty",
                                style: TextStyle(
                                    fontFamily: 'popins',
                                    color: Colors.black,
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                "Price",
                                style: TextStyle(
                                    fontFamily: 'popins',
                                    color: Colors.black,
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          Divider(thickness: 2, color: Colors.black),
                          SizedBox(
                              height: 550,
                              width: double.infinity,
                              child: ListView.builder(
                                itemBuilder: (context, index) => showItem(index),
                                itemCount: productList.length,
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Product Details",
                              style: TextStyle(
                                  fontFamily: 'popins',
                                  color: Colors.black,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: txtPName,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                      label: Text(
                                        "Product Name",
                                        style: TextStyle(
                                            fontFamily: 'popins',
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black))),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller: txtPQty,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                      label: Text(
                                        "Product Qty",
                                        style: TextStyle(
                                            fontFamily: 'popins',
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black))),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller: txtPPrice,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                      label: Text(
                                        "Product Price",
                                        style: TextStyle(
                                            fontFamily: 'popins',
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black))),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                fontFamily: 'popins',
                                                color: Colors.white,
                                                fontSize: 15,
                                                letterSpacing: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        String? name=txtPName.text;
                                        int qty=int.parse(txtPQty.text);
                                        int price=int.parse(txtPPrice.text);
                                        int amount = qty*price;
                                        int finalamount = (amount+(amount*18/100)).toInt();
                                        ProductClass product = ProductClass(name: name,qty: qty,price: price,amount: finalamount);
                                        productList.add(product);
                                        totalqty=totalqty+qty;
                                        totalamount=totalamount+finalamount;
                                        Navigator.pop(context);
                                        setState(() {
                                        txtPName.clear();
                                        txtPQty.clear();
                                        txtPPrice.clear();
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Done",
                                            style: TextStyle(
                                                fontFamily: 'popins',
                                                color: Colors.white,
                                                fontSize: 15,
                                                letterSpacing: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Add Product",
                          style: TextStyle(
                              fontFamily: 'popins',
                              color: Colors.white,
                              fontSize: 15,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  Widget showItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 50,
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 25,width: 20,
            child: Center(
              child: Text("${index+1}",
              style: TextStyle(
              fontFamily: 'popins',
              color: Colors.black,
              fontSize: 15,
              letterSpacing: 1),),
            ),
          ),
          Container(
            height: 25,width: 150,
            child: Center(
              child: Text("${productList[index].name}",
              style: TextStyle(
              fontFamily: 'popins',
              color: Colors.black,
              fontSize: 15,
              letterSpacing: 1),),
            ),
          ),
          Container(
            height: 25,width: 60,
            child: Center(
              child: Text("${productList[index].qty}",
              style: TextStyle(
              fontFamily: 'popins',
              color: Colors.black,
              fontSize: 15,
              letterSpacing: 1),),
            ),
          ),
          Container(
            height: 25,width: 80,
            child: Center(
              child: Text("${productList[index].price}",
              style: TextStyle(
              fontFamily: 'popins',
              color: Colors.black,
              fontSize: 15,
              letterSpacing: 1),),
            ),
          ),
        ],
      ),
    );
  }
}
