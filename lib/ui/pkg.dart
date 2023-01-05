// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:provider/provider.dart';
import '../data/provider/user_provider.dart';
import '../util/shared_preferences_utils.dart';
import 'consumable_store.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/androidpublisher/v3.dart' as iap;
import '../../../util/constants.dart';
const bool _kAutoConsume = true;

const String _kConsumableId = 'tunesubscriptions';
const String _kUpgradeId = 'tunesubscriptions1';
const String _kSilverSubscriptionId = 'tunesubscriptions2';
const String _kGoldSubscriptionId = 'tunesubscriptions3';
const String _kloySubscriptionId = 'tunesubscriptions4';
const List<String> _kProductIds = <String>[
  _kConsumableId,
  _kUpgradeId,
  _kSilverSubscriptionId,
  _kGoldSubscriptionId,
  _kloySubscriptionId,
];
String? uid = "";
String verif = "";
String pstate = "";

int idx = 0;
class pkg extends StatefulWidget {
  @override
  _pkg createState() => _pkg();
}

class _pkg extends State<pkg> {
  UserProvider? _userProvider;
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<String> _notFoundIds = <String>[];
  List<ProductDetails> _products = <ProductDetails>[];
  List<PurchaseDetails> _purchases = <PurchaseDetails>[];
  List<String> _consumables = <String>[];
  bool _isAvailable = false;
  bool _purchasePending = false;
  bool _loading = true;
  String? _queryProductError;

  @override
  void initState() {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
          _listenToPurchaseUpdated(purchaseDetailsList);
        }, onDone: () {
          _subscription.cancel();
        }, onError: (Object error) {
          // handle error here.
        });
    initStoreInfo();
    super.initState();
    gett2().then((data) {


    gett(uid).then((data) {
      setState(() {
        verif = data;
        idx = verif.indexOf(":");
        checkpur();
      });
    });
    });
  }
  Future<String?> gett2() async {
    uid = (await SharedPreferencesUtil.getUserId());

  }
  Future<void> initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      setState(() {
        _isAvailable = isAvailable;
        _products = <ProductDetails>[];
        _purchases = <PurchaseDetails>[];
        _notFoundIds = <String>[];
        _consumables = <String>[];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
      _inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    final ProductDetailsResponse productDetailResponse =
    await _inAppPurchase.queryProductDetails(_kProductIds.toSet());
    if (productDetailResponse.error != null) {
      setState(() {
        _queryProductError = productDetailResponse.error!.message;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = <PurchaseDetails>[];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _consumables = <String>[];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      setState(() {
        _queryProductError = null;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = <PurchaseDetails>[];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _consumables = <String>[];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    final List<String> consumables = await ConsumableStore.load();
    setState(() {
      _isAvailable = isAvailable;
      _products = productDetailResponse.productDetails;
      _notFoundIds = productDetailResponse.notFoundIDs;
      _consumables = consumables;
      _purchasePending = false;
      _loading = false;
    });
  }

  @override
  void dispose() {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
      _inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> stack = <Widget>[];
    if (_queryProductError == null) {
      stack.add(
        ListView(
          children: <Widget>[
            _buildConnectionCheckTile(),
            _buildConsumableBox(),
            //_otherPlansLabel(),
            _buildProductList(),

            _buildRestoreButton(),
          ],
        ),
      );
    } else {
      stack.add(Center(
        child: Text(_queryProductError!),
      ));
    }
    if (_purchasePending) {
      stack.add(
        Stack(
          children: const <Widget>[
            Opacity(
              opacity: 0.3,
              child: ModalBarrier(dismissible: false, color: Colors.grey),
            ),
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('IAP Example'),
        // ),
        body: Stack(
          children: stack,
        ),
      ),
    );
  }

  Card _buildConnectionCheckTile() {
    if (_loading) {
      return const Card(child: ListTile(title: Text('Trying to connect...')));
    }
    final Widget storeHeader = ListTile(
      leading: Icon(_isAvailable ? Icons.check : Icons.block,
          color: _isAvailable ? Colors.green : ThemeData.light().errorColor),
      title: Text(
          'The Tune store is ' + (_isAvailable ? 'available' : 'unavailable') + '.'),
    );
    final List<Widget> children = <Widget>[storeHeader];

    if (!_isAvailable) {
      children.addAll(<Widget>[
        const Divider(),
        ListTile(
          title: Text('Not connected',
              style: TextStyle(color: ThemeData.light().errorColor)),
          subtitle: const Text(
              'Unable to connect to the payments processor. Has this app been configured correctly? See the example README for instructions.'),
        ),
      ]);
    }
    return Card(child: Column(children: children));
  }

  Card _buildProductList() {
    if (_loading) {
      return const Card(
          child: ListTile(
              leading: CircularProgressIndicator(),
              title: Text('Fetching products...')));
    }
    if (!_isAvailable) {
      return const Card();
    }
    const ListTile productHeader = ListTile(title: Text('Subscriptions'));
    final ListTile productHeader2 = ListTile(subtitle:_standardPlanBox5() ,);

    final List<ListTile> productList = <ListTile>[];
    if (_notFoundIds.isNotEmpty) {
      productList.add(ListTile(
          title: Text('[${_notFoundIds.join(", ")}] not found',
              style: TextStyle(color: ThemeData.light().errorColor)),
          subtitle: const Text(
              'This app needs special configuration to run. Please see example/README.md for instructions.')));
    }

    // This loading previous purchases code is just a demo. Please do not use this as it is.
    // In your app you should always verify the purchase data using the `verificationData` inside the [PurchaseDetails] object before trusting it.
    // We recommend that you use your own server to verify the purchase data.
    final Map<String, PurchaseDetails> purchases =
    Map<String, PurchaseDetails>.fromEntries(
        _purchases.map((PurchaseDetails purchase) {
          if (purchase.pendingCompletePurchase) {
            _inAppPurchase.completePurchase(purchase);
          }
          return MapEntry<String, PurchaseDetails>(purchase.productID, purchase);
        }));
    productList.addAll(_products.map(
          (ProductDetails productDetails) {
        final PurchaseDetails? previousPurchase = purchases[productDetails.id];

        return ListTile(
            // title: Text(
            //   productDetails.title,
            // ),
            subtitle:

            productDetails.id=='tunesubscriptions'?_standardPlanBox():
            productDetails.id=='tunesubscriptions1'?_standardPlanBox1():
            productDetails.id=='tunesubscriptions2'?_standardPlanBox2():
            productDetails.id=='tunesubscriptions3'?_standardPlanBox3():
            productDetails.id=='tunesubscriptions4'?_standardPlanBox4():_standardPlanBox5()
            // Text(
            //
            //    // productDetails.id=='tunesubscriptions'?'':''
            //   // productDetails.description,
            // )
            ,
            trailing: previousPurchase != null
                ? IconButton(
                onPressed: () => confirmPriceChange(context),
                icon: const Icon(Icons.upgrade))
                : TextButton(
              child: Text(productDetails.price),
              style: TextButton.styleFrom(
                backgroundColor: Colors.green[800],
                primary: Colors.white,
              ),
              onPressed: () {
                late PurchaseParam purchaseParam;

                if (Platform.isAndroid) {
                  // NOTE: If you are making a subscription purchase/upgrade/downgrade, we recommend you to
                  // verify the latest status of you your subscription by using server side receipt validation
                  // and update the UI accordingly. The subscription purchase status shown
                  // inside the app may not be accurate.
                  final GooglePlayPurchaseDetails? oldSubscription =
                  _getOldSubscription(productDetails, purchases);

                  purchaseParam = GooglePlayPurchaseParam(
                      productDetails: productDetails,
                      applicationUserName: null,
                      changeSubscriptionParam: (oldSubscription != null)
                          ? ChangeSubscriptionParam(
                        oldPurchaseDetails: oldSubscription,
                        prorationMode: ProrationMode
                            .immediateWithTimeProration,
                      )
                          : null);
                } else {
                  purchaseParam = PurchaseParam(
                    productDetails: productDetails,
                    applicationUserName: null,
                  );
                }

                if (productDetails.id == _kConsumableId) {
                  _inAppPurchase.buyConsumable(
                      purchaseParam: purchaseParam,
                      autoConsume: _kAutoConsume || Platform.isIOS);
                } else {
                  _inAppPurchase.buyNonConsumable(
                      purchaseParam: purchaseParam);
                }
              },
            ));
      },
    ));

    return Card(
        child: Column(
            children: <Widget>[productHeader,productHeader2, const Divider()] + productList));


  }
  Widget _standardPlanBox() {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.redAccent[100],
          highlightColor: Colors.white,
          onTap: () => {print('Tapped')},
          child: Container(
            height: MediaQuery.of(context).size.width * 0.65,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]??Colors.white60),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: <Widget>[_buildPlanLabel('Bronze'),Image(image: new AssetImage('assets/images/bronze.png'),height:40,width:40,),]) ,

                _buildPlanPrice('Weekly'),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: _buildFeatureLabel('-Increase the Per day \n sending request count to 2'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Increase maximum pending requests\n count to 3'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Increase maximum pending requests count to 3'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Unlimited receive requests from other members'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Search results priority over free members'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Access to "Tune Chat"'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _standardPlanBox1() {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.redAccent[100],
          highlightColor: Colors.white,
          onTap: () => {print('Tapped')},
          child: Container(
            height: MediaQuery.of(context).size.width * 0.65,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]??Colors.white60),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               Row(children: <Widget>[_buildPlanLabel('Silver'),Image(image: new AssetImage('assets/images/silver.png'),height:40,width:40,),]) ,
                _buildPlanPrice('Weekly'),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: _buildFeatureLabel('-Increase the Per day sending request count to 3'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Increase maximum pending requests count to 4'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Increase accepted requests count sent \n by you within a month of period to 6'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Unlimited receive requests from other members'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Search results priority over free members'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Your account will be prioritized when matching proposals.'),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 5.0),
                //   child: _buildFeatureLabel(
                //       '-Access to "Tune Story"'),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Access to "Tune Chat"'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _standardPlanBox2() {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.redAccent[100],
          highlightColor: Colors.white,
          onTap: () => {print('Tapped')},
          child: Container(
            height: MediaQuery.of(context).size.width * 0.75,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]??Colors.white60),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: <Widget>[_buildPlanLabel('Gold'),Image(image: new AssetImage('assets/images/gold.png'),height:40,width:40,),]) ,

                _buildPlanPrice('Monthly'),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: _buildFeatureLabel('-Any time 15 extra sending requests'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Will receive normal free requests as same as before'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-No affect number of pending request limit which can be at once'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-No affect number of accepted requests limit send by you per mont'),
                ),   Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Unlimited receive requests from other members'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Search results priority over free members'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Your account will be prioritized when matching proposals.'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Access to "Tune Chat"'),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 5.0),
                //   child: _buildFeatureLabel(
                //       '-Access to "Tune Chat"'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _standardPlanBox3() {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.redAccent[100],
          highlightColor: Colors.white,
          onTap: () => {print('Tapped')},
          child: Container(
            height: MediaQuery.of(context).size.width * .80,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]??Colors.white60),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: <Widget>[_buildPlanLabel('Platinum'),Image(image: new AssetImage('assets/images/platinum.png'),height:40,width:40,),]) ,


                _buildPlanPrice('Monthly'),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: _buildFeatureLabel('-Any time 25 extra sending requests'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Will receive normal free requests as same as before'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-No affect number of pending request limit which can be at once'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-No affect number of accepted requests limit send by you per month'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Unlimited receive requests from other members'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Search results priority over free members'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Your account will be prioritized when matching proposals.'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Access to "Tune Chat"'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      'Access to send Messages before accept the request'),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 5.0),
                //   child: _buildFeatureLabel(
                //       '-Access to get the Video calls for your matches'),
                // ),Padding(
                //   padding: const EdgeInsets.only(top: 5.0),
                //   child: _buildFeatureLabel(
                //       '-Access to send Messages before accept the request'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _standardPlanBox4() {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.redAccent[100],
          highlightColor: Colors.white,
          onTap: () => {print('Tapped')},
          child: Container(
            height: MediaQuery.of(context).size.width * 0.85,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]??Colors.white60),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: <Widget>[_buildPlanLabel('Loyalty Member'),Image(image: new AssetImage('assets/images/loyalty.png'),height:40,width:40,),]) ,


                 _buildPlanPrice('Monthly'),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: _buildFeatureLabel('-Any time 50 extra sending requests '),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Will receive normal free requests as same as before'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-No affect number of pending request limit which can be at once'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-No affect number of accepted requests limit send by you per month'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Unlimited receive requests from other members'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Search results priority over free members'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Your account will be prioritized when matching proposals.'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Access to "Tune Chat"'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      'Access to send Messages before accept the request'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Be a top profile in your area to get more matches'),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 5.0),
                //   child: _buildFeatureLabel(
                //       '-Access to send Messages before accept the request'),
                // ),Padding(
                //   padding: const EdgeInsets.only(top: 5.0),
                //   child: _buildFeatureLabel(
                //       '-See who likes you'),
                // ),Padding(
                //   padding: const EdgeInsets.only(top: 5.0),
                //   child: _buildFeatureLabel(
                //       '-Loyalty member tag'),
                // ),Padding(
                //   padding: const EdgeInsets.only(top: 5.0),
                //   child: _buildFeatureLabel(
                //       '-Be a top profile in your area to get more matches'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _standardPlanBox5() {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.redAccent[100],
          highlightColor: Colors.white,
          onTap: () => {print('Tapped')},
          child: Container(
            height: MediaQuery.of(context).size.width * 0.45,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]??Colors.white60),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildPlanLabel('Free Package'),
                _buildPlanPrice('Monthly'),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: _buildFeatureLabel('-Can send 1 request per day'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Can have 2 pending sent requests at once'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Can have 2 accepted send requests per month'),
                ),Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Unlimited receive requests from other members'),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 5.0),
                //   child: _buildFeatureLabel(
                //       '-Search results priority over free members'),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-Access to "Tune Chat"'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanPrice(String price) {
    return Text(
      price,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w900, fontSize: 12),
      textAlign: TextAlign.center,
    );
  }

  ///build feature row label
  Widget _buildFeatureLabel(String label) {
    return Text(
      label,
      style: TextStyle(
          letterSpacing: 0.2,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 10),
      textAlign: TextAlign.start,
    );
  }

  Widget _buildPlanLabel(String label) {
    return Text(
      label,
      style: TextStyle(
          letterSpacing: 0.1,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16),
      textAlign: TextAlign.center,
    );
  }

  ///other plan label at bottom
  Widget _otherPlansLabel() {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.06),
      child:_standardPlanBox5(),
      // Text(
      //   'Other Plans',
      //   style: TextStyle(
      //       letterSpacing: 0.5,
      //       color: Colors.grey,
      //       fontWeight: FontWeight.w800,
      //       fontSize: 12),
      //   textAlign: TextAlign.center,
      // ),
    );
  }
  Card _buildConsumableBox() {
    if (_loading) {
      return const Card(
          child: ListTile(
              leading: CircularProgressIndicator(),
              title: Text('Fetching consumables...')));
    }
    if (!_isAvailable || _notFoundIds.contains(_kConsumableId)) {
      return const Card();
    }
    // if(pstate=="null"){
    //   pstate2="Free Package";
    //
    // }
    // if(pstate=="1"){
    //  if( verif.substring(0,idx).trim()=="tunesubscriptions"){
    //    pstate2="Bronze Package";
    //  }
    //  if( verif.substring(0,idx).trim()=="tunesubscriptions1"){
    //    pstate2="Silver Package";
    //  }
    //  if( verif.substring(0,idx).trim()=="tunesubscriptions2"){
    //    pstate2="Gold Package";
    //  }
    //  if( verif.substring(0,idx).trim()=="tunesubscriptions3"){
    //    pstate2="Platinum Package";
    //  }
    //  if( verif.substring(0,idx).trim()=="tunesubscriptions4"){
    //    pstate2="Loyalty Member Package";
    //  }
    // }
    // else{
    //   pstate2="Free Package";
    // }
    Widget pkgimg=Image(image: new AssetImage('assets/images/bronze.png'),height:20,width: 30,);
    if( pstate2=="Free Package"||pstate2==''){
      pkgimg=  Text(pstate2,style: TextStyle(
        fontSize: 40,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = Colors.blue[700]!,
      ),

      );
      //pkgimg=Image(image: new AssetImage('assets/images/bronze.png'),height:120,width: 120,);

    }
    if( pstate2=="Bronze Package"){
      pkgimg=Image(image: new AssetImage('assets/images/bronze.png'),height:120,width:120,);
    }
    if( pstate2=="Silver Package"){
      pkgimg=Image(image: new AssetImage('assets/images/silver.png'),height:120,width: 120,);

    }
    if( pstate2=="Gold Package"){
      pkgimg=Image(image: new AssetImage('assets/images/gold.png'),height:120,width: 120,);

    }
    if( pstate2=="Platinum Package"){
      pkgimg=Image(image: new AssetImage('assets/images/platinum.png'),height:120,width: 120,);

    }
    if( pstate2=="Loyalty Member Package"){
      pkgimg=Image(image: new AssetImage('assets/images/loyalty.png'),height:120,width: 120,);

    }
     ListTile consumableHeader =
    ListTile(title: Text('Purchased Package'), subtitle:
    // Text(pstate2,style: TextStyle(
    //   fontSize: 40,
    //   foreground: Paint()
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = 2
    //     ..color = Colors.blue[700]!,
    // ),
    //
    // ),
    pkgimg,

    );




    final List<Widget> tokens = _consumables.map((String id) {
      return GridTile(
        child: IconButton(
          icon: const Icon(
            Icons.stars,
            size: 42.0,
            color: Colors.orange,
          ),
          splashColor: Colors.yellowAccent,
          onPressed: () => consume(id),
        ),
      );
    }).toList();
    return Card(
        child: Column(children: <Widget>[
          consumableHeader,
          const Divider(),
          // GridView.count(
          //   crossAxisCount: 5,
          //   children: tokens,
          //   shrinkWrap: true,
          //   padding: const EdgeInsets.all(16.0),
          // )
        ]));
  }

  Widget _buildRestoreButton() {

    if (_loading) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            child: const Text('Restore purchases'),
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              primary: Colors.white,
            ),
            onPressed: () => _inAppPurchase.restorePurchases(),
          ),
        ],
      ),
    );
  }

  Future<void> consume(String id) async {
    await ConsumableStore.consume(id);
    final List<String> consumables = await ConsumableStore.load();
    setState(() {
      _consumables = consumables;
    });
  }

  void showPendingUI() {
    setState(() {
      _purchasePending = true;
    });
  }
  Future<String> setpay(PurchaseDetails purchaseDetails) async {
    await _userProvider!.setpay(purchaseDetails).then((response) {


      return response;
    });

    return "";
  }


  Future<void> deliverProduct(PurchaseDetails purchaseDetails) async {
    // IMPORTANT!! Always verify purchase details before delivering the product.
    setpay(purchaseDetails).then((data) {
      gett2().then((data) {


        gett(uid).then((data) {
          setState(() {
            verif = data;
            idx = verif.indexOf(":");
            checkpur();
          });
        });
      });
    });
    if (purchaseDetails.productID == _kConsumableId) {
      await ConsumableStore.save(purchaseDetails.purchaseID!);
      final List<String> consumables = await ConsumableStore.load();
      setState(() {
        _purchasePending = false;
        _consumables = consumables;
      });
    } else {
      setState(() {
        _purchases.add(purchaseDetails);
        _purchasePending = false;
      });
    }

  }
  Future<String> gett(String? mid) async {
    String   resp="";
    await _userProvider!.getpay(mid!).then((response) {
      resp = response;

      return response;
    });

    return resp;
  }

  void checkpur () {
    final accountCredentials = new auth.ServiceAccountCredentials.fromJson(r'''
{
  "private_key_id": "e4f01565bf992cb2356ebbf9ffb3fc89eef703f3",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC6HJBQeXAByDlI\nuZ3K4ZUojxRMEanWolBEkbyO7/Www0YJi3m4XPEHWtEBwAzWEGkKYHR0stm7IJMS\nfz0fDY3WolAz2S1/BfUtFaPTKsXjrxE04c2OOF0lDuhy6iHaRGuaTp6+Wu0t0wCT\nTmdonvOB9g8mb/Xx/KesnZjw92ZiiRfAr/1sd630MXk2k2sXgZEf6NFL1lB7gxaW\npEbcZeAsXBzxX5hmU05GHdjnasVUtWhvbHtKdfV2q0EvTF/fmDQ1LB/3KwVjcrZH\nAbidA/j5TRFzB/3cTTWc9zBDhsU2xTCF/91jRawCqv8Z0Iw5yf4TqaEn97nexdrH\nfngOVPzXAgMBAAECggEADq7jOd4i1pkn39N5HgEHJhCHvuqj1iGvKIHA+Rv4a840\nL9uXqlJ216g0FinDOX5I8z8h4PUdVXSf9dUhCtqkZpsercCEJOHg8oIjDy1wOGLe\n/ieUcpSC0MIo16weKJy+SonKX2VIEhX0FSsZ4Hit6IJztoodws42olk6sEQsiTh6\nJPCd3w2bADBYkyHYuFJggJJnw2OL+jkQ11/ZiOD5zbKcNDplG7vz90ILDJbcdESl\nRYplkUgUX1nU937YNbpP4QPqnoEYZwQ9rUdbOEd2uqO3BdK5drRYJjr6R1IIAf7E\nAaEsLx94n9uVzPZPwEnrllY8RYXNuOLJhNY5U8Mr7QKBgQDq3DzzGoly+5I/WPSi\nLVEyWF11ZZ2gZKpUKyvA1y7kIYnVeTytzaSQMhQpL9CdJ2E3UPtYBABMHJ3PjRG3\nVheR6ub2LY/K1odfptPlVzGt2bvezo8pbN0pobA81KLTEJ8iYU8OYyU5G3lNkwk+\nLXCtg9Gb1Sm0H4t+2t4aPf4/vQKBgQDK3QjSiWjX4kATi3Wl4IEulRi5EM+Uy4M5\nkpNWrQi09a8n0IjYH0boGmylHXoSPKwsDzvInE43xoW90ODiMJpsmnCNtLoBPDVM\nmT7oKPJza7GxtlVdgwdvmGVmbxkOPt2+T5vAKDk3mLuGq/siDVr6vtbTv+AOrKkf\nEYAmqJS+IwKBgFb07lgwRh3diVuNCx6U2tBiKVBTLFZ7jxkU1uFSitkKlecFOXM8\nhaah9Bb/ziSxtOvvPvBqotWLbt6u45VW+ekb6SHS4r9+SKcgtKnga9Nrn4SyRA1Z\nclV8uSz8qcCuEc1/6+5uxRRs2K/hNfXgiyyjdtNUzFkVqOdyD/P1ahKdAoGAVnUr\nnGcZuuBfRLUsF9z90XeTyNPkVFsD+1Z/2vH2AwGue76Bg/KYirUwVpKggwM+saxw\nY0hSgaznNQW/wkbKmbyceZhrqbkaUiIB0HobEpv0aHP4H9mHIsWFecmhmROr977/\n9z5tXEeIrJXBezrL6o/JCQf+muJ1VZtkzZUNh5cCgYBveqvMdMLHCOj6ArDDzJat\nHaqXyOmLhvcySug6lhgqRzD3oiZA3dhh8EEEwXdHoGJOKm1ieBnfszz6y7RO1TQ0\n+315ssikJQQ2jGd4wfKq7GxLpi8BZyDzXvGAPUVNP/qvQDqcnlPpfsnuCvV6sokG\n+nab31g9oql7DbQJibLmjA==\n-----END PRIVATE KEY-----\n",
  "client_email": "tune-460@tune-664be.iam.gserviceaccount.com",
  "client_id": "115847386689875001789.apps.googleusercontent.com",
  "type": "service_account"
}
''');
    final scopes = [iap.AndroidPublisherApi.androidpublisherScope];
    auth.clientViaServiceAccount(accountCredentials, scopes).then((client) {
    var api = new iap.AndroidPublisherApi(client);
    var per = api.purchases.subscriptions.get('com.icw.cygnus.cygnus', verif.substring(0,idx).trim(), verif.substring(idx+1).trim());
  //  per.whenComplete(() => print(json.encode(per.toString())));
    per.then((value) =>
    {
      //print(json.encode(value.paymentState.toString()))
      pstate = value.paymentState.toString(),
      if(pstate=="null"){
        pstate2="Free Package"

      },
      if(pstate=="1"){
        if( verif.substring(0,idx).trim()=="tunesubscriptions"){
          pstate2="Bronze Package"
        },
        if( verif.substring(0,idx).trim()=="tunesubscriptions1"){
          pstate2="Silver Package"
        },
        if( verif.substring(0,idx).trim()=="tunesubscriptions2"){
          pstate2="Gold Package"
        },
        if( verif.substring(0,idx).trim()=="tunesubscriptions3"){
          pstate2="Platinum Package"
        },
        if( verif.substring(0,idx).trim()=="tunesubscriptions4"){
          pstate2="Loyalty Member Package"
        }
      }
      else{
        pstate2="Free Package"
      }
   , setState(() {}),
    }

    );
    });
  }

  void handleError(IAPError error) {
    setState(() {
      _purchasePending = false;
    });
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    // IMPORTANT!! Always verify a purchase before delivering the product.
    // For the purpose of an example, we directly return true.
    return Future<bool>.value(true);
  }

  void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
    // handle invalid purchase here if  _verifyPurchase` failed.
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        showPendingUI();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          final bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            deliverProduct(purchaseDetails);
          } else {
            _handleInvalidPurchase(purchaseDetails);
            return;
          }
        }
        if (Platform.isAndroid) {
          if (!_kAutoConsume && purchaseDetails.productID == _kConsumableId) {
            final InAppPurchaseAndroidPlatformAddition androidAddition =
            _inAppPurchase.getPlatformAddition<
                InAppPurchaseAndroidPlatformAddition>();
            await androidAddition.consumePurchase(purchaseDetails);
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    }
  }

  Future<void> confirmPriceChange(BuildContext context) async {
    if (Platform.isAndroid) {
      final InAppPurchaseAndroidPlatformAddition androidAddition =
      _inAppPurchase
          .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
      final BillingResultWrapper priceChangeConfirmationResult =
      await androidAddition.launchPriceChangeConfirmationFlow(
        sku: 'purchaseId',
      );
      if (priceChangeConfirmationResult.responseCode == BillingResponse.ok) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Price change accepted'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            priceChangeConfirmationResult.debugMessage ??
                'Price change failed with code ${priceChangeConfirmationResult.responseCode}',
          ),
        ));
      }
    }
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iapStoreKitPlatformAddition =
      _inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iapStoreKitPlatformAddition.showPriceConsentIfNeeded();
    }
  }

  GooglePlayPurchaseDetails? _getOldSubscription(
      ProductDetails productDetails, Map<String, PurchaseDetails> purchases) {
    // This is just to demonstrate a subscription upgrade or downgrade.
    // This method assumes that you have only 2 subscriptions under a group, 'subscription_silver' & 'subscription_gold'.
    // The 'subscription_silver' subscription can be upgraded to 'subscription_gold' and
    // the 'subscription_gold' subscription can be downgraded to 'subscription_silver'.
    // Please remember to replace the logic of finding the old subscription Id as per your app.
    // The old subscription is only required on Android since Apple handles this internally
    // by using the subscription group feature in iTunesConnect.
    GooglePlayPurchaseDetails? oldSubscription;
    if (productDetails.id == _kSilverSubscriptionId &&
        purchases[_kGoldSubscriptionId] != null) {
      oldSubscription =
      purchases[_kGoldSubscriptionId]! as GooglePlayPurchaseDetails;
    } else if (productDetails.id == _kGoldSubscriptionId &&
        purchases[_kSilverSubscriptionId] != null) {
      oldSubscription =
      purchases[_kSilverSubscriptionId]! as GooglePlayPurchaseDetails;
    }
    return oldSubscription;
  }
}

/// Example implementation of the
/// [`SKPaymentQueueDelegate`](https://developer.apple.com/documentation/storekit/skpaymentqueuedelegate?language=objc).
///
/// The payment queue delegate can be implementated to provide information
/// needed to complete transactions.
class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}