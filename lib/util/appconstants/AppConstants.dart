// ignore: file_names
import 'package:flutter/material.dart';

class AppConstants {
  static const String noInfo = "No info available";
  // ignore: constant_identifier_names
  static const String UserAuthFailed =
      "Sorry your email id and password does not match";
  // ignore: constant_identifier_names
  static const String NoInternetConnection =
      "Please check your internet connection";

  static String userEmail = "";
  static String apikey="254262770d92a0093530187811949c34";

  // ignore: constant_identifier_names

   //static const String BASE_URL = "http://127.0.0.1:5000/";
  // ws://127.0.0.1:63740/NArcq-_mZbg=/ws
  //
  static const String BASE_URL="http://178.62.253.125/node_one";

  // 192.168.151.216
  // 169.254.89.51
  //static const String BASE_URL="https://covid-19.dataflowkit.com/";
  static const String GET_CHAIN="/get_chain";
  static const String CONNECT_NODE="/connect_node";
  static const String GET_CONNECTED_NODES="/get_nodes";
  static const String REPLACE_CHAIN="/replace_chain";
  static const String CREATE_WALLET="/create_wallet/";
  static const String GET_USER_ACCOUNTS="/get_user_accounts";
  static const String GET_NODE_ACCOUNTS="/get_node_accounts";
  static const String GET_ALL_TRANSACTIONS="/get_transactions";
  static const String GET_ALL_NODE_ACCOUNT="/get_node_accounts";
  static const String CLEAR_BLOCKCHAIN="/clear_blockchain";

  static const String API_KEY="5AE042CE-D75C-4546-B417-77D962527CD2";


  /*
    Market APis
   */
  late String asset_id_base;
  static const String Marekt_API_BASE_URL="https://api.coingecko.com/api/v3/coins/";
  static const String GET_ASSET_DETAILS="/markets?vs_currency=";
  static const String GET_CURRENCY_EXCHANGE_RATE="/exchangerate/";


  static const String MINE_BLOCK="/mine_block";
  static const String ADD_TRANSACTION="/add_transaction";
  static const String BASE_URL_NODE1 = "http://178.62.253.125/node_two";
  static const String BASE_URL_NODE2 = "http://178.62.253.125/node_three";
  //static const String BASE_URL_NODE = "178.62.253.125/node_one/";

  //  static const String BASE_URL_NODE = "http://178.62.253.125/node_one";

  /*
     Firebase fields
   */

  /*** Wallet creation fields */
  /*
       Transaction_Status_Flag
       1=unconfirmed
       2=confirmed
   */
 static const String Account_Details="account_deatils";
 static const String Private_Key="private_key";
 static const String Public_key="public_key";
 static const String Coins="coins";
  static const String Coin_Name="coin_name";
  static const String Gas_limit="gas_limit";
 static const String Wallet_Flag="flag";
 static const String Wallet_CretedOn="wallet_date";
 static const String Node_Number="node_index";



  /*

  */
  static const String Transactions= "transaction_details";
  static const String Transaction_Count="transaction_count";
  static const String Transaction_Status_Flag="status";
  static const String Transaction_DateTime="transaction_date";
  static const String Transaction_From="transaction_from";
  static const String Transaction_To="transaction_to";
  static const String Transaction_Amount="amount";
  static const String Transaction_Hash="transaction_hash";



/** Block Details*
 *
 */
static const String Block_Details="blockDetails";
static const String Block_index="block_index";
static const String Previous_hash="previous_hash";
static const String Current_block_hash="current_hash";
static const String Proof="proof";
static const String Block_CreatedOn="block_created_on";
static const TransactionDetails="transactions";
static const String Block_Reward="reward_amount";

/*
   Node details
 */
static const String Node_Deatils="node_details";
static const String Node_Balanace="node_balance";
static const String Node_Public_Key="node_pubic_key";
static const String Node_Private_Key="node_private_key";
static const String Node_Reward="node_reward";
static const String Mined_Block_Count="mined_block_count";
static const String Node_Name="node_name";

  late BuildContext context;

   AppConstants(this.context);
   Future<void> startLoading() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SimpleDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent, // can change this to your prefered color
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(color: Colors.black),
            )
          ],
        );
      },
    );
  }

  Future<void> stopLoading() async {
    Navigator.of(context).pop();
  }

}