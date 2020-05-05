import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:movie/actions/base_api.dart';
import 'package:movie/models/base_api_model/payment_client_token.dart';
import 'package:movie/models/base_api_model/purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<CheckOutPageState> buildEffect() {
  return combineEffects(<Object, Effect<CheckOutPageState>>{
    CheckOutPageAction.action: _onAction,
    CheckOutPageAction.selectPaymentMethod: _selectPaymentMethod,
    CheckOutPageAction.pay: _onPay,
  });
}

void _onAction(Action action, Context<CheckOutPageState> ctx) {}
Future _selectPaymentMethod(
    Action action, Context<CheckOutPageState> ctx) async {
  ctx.dispatch(CheckOutPageActionCreator.loading(true));
  PaymentClientToken _clientNonce = await _getToken(ctx.state.user.uid);
  ctx.dispatch(CheckOutPageActionCreator.loading(false));
  if (_clientNonce?.token == null)
    return Toast.show('Something wrong', ctx.context,
        gravity: Toast.CENTER, duration: 5);
  final request = BraintreeDropInRequest(
    vaultManagerEnabled: true,
    clientToken: _clientNonce.token,
    collectDeviceData: true,
    venmoEnabled: true,
    maskCardNumber: true,
    maskSecurityCode: true,
    cardEnabled: true,
    googlePaymentRequest: BraintreeGooglePaymentRequest(
      totalPrice: ctx.state.checkoutData.amount.toString(),
      currencyCode: 'USD',
      billingAddressRequired: false,
    ),
    paypalRequest: BraintreePayPalRequest(
      amount: ctx.state.checkoutData.amount.toString(),
      displayName: 'Example company',
    ),
  );
  BraintreeDropInResult result = await BraintreeDropIn.start(request);
  if (result != null)
    ctx.dispatch(CheckOutPageActionCreator.updatePaymentMethod(result));
}

void _onPay(Action action, Context<CheckOutPageState> ctx) async {
  ctx.dispatch(CheckOutPageActionCreator.loading(true));
  if (ctx.state.user == null || ctx.state.braintreeDropInResult == null) {
    ctx.dispatch(CheckOutPageActionCreator.loading(false));
    return Toast.show('empty payment method', ctx.context,
        gravity: Toast.CENTER, duration: 5);
  }
  final _r = await BaseApi.createPurchase(Purchase(
      userId: ctx.state.user.uid,
      amount: ctx.state.checkoutData.amount,
      paymentMethodNonce:
          ctx.state.braintreeDropInResult.paymentMethodNonce.nonce));
  ctx.dispatch(CheckOutPageActionCreator.loading(false));
  if (_r == null)
    return Toast.show('Something wrong', ctx.context,
        gravity: Toast.CENTER, duration: 5);
  if (_r['status'])
    Toast.show('payed', ctx.context, gravity: Toast.CENTER, duration: 5);
  else
    Toast.show(_r['message'], ctx.context, gravity: Toast.CENTER, duration: 5);
  print(_r);
}

Future<PaymentClientToken> _getToken(String uid) async {
  PaymentClientToken _clientNonce = PaymentClientToken.fromParams(
      expiredTime: DateTime.now().millisecondsSinceEpoch);
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final _token = preferences.getString('PaymentToken');
  if (_token != null) _clientNonce = PaymentClientToken(_token);
  if (_token == null || _clientNonce.isExpired()) {
    var r = await BaseApi.getPaymentToken(uid);
    if (r != null) {
      _clientNonce = PaymentClientToken.fromParams(
          token: r, expiredTime: DateTime.now().millisecondsSinceEpoch);
      preferences.setString('PaymentToken', _clientNonce.toString());
    } else
      _clientNonce = PaymentClientToken.fromParams(
          expiredTime: DateTime.now().millisecondsSinceEpoch);
  }
  return _clientNonce;
}