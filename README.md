User Manual:
This is the frontend of blockchainn simulator.
The actual code of simulator in python can be found here- https://github.com/poojadev/blockchain_simulator



Accounts Tab 

-	User can create new account by inputting the number of account he/she wants the create. When he click on create account new account’s will be created and displayed in Account List 
-	New account balance will be 0 initially these account need’s to do  transactions with 1st four account created with balance 100 PDCoins

When user will click on account tab. List of accounts will be displayed.
initially there will 4 accounts with 100 PDCoins. Each account will show Public Key and account balance.  

When user will click on “Make transaction” button one dialog will appear .
In  order to  complete the transaction 
-	User need his Public key which will be displayed on the dialog already.
-	He need recipients public key which he can search through autocomplete 
-	He will need his account Private key- To get his account private key he need to click on “Show Private Key”
-	When he click on that button one dialog will appear which will display user private key
-	User just need to click on “Copy Private Key” button. Private key will be automatically copied to clipboard.
-	Once he Copy the Private Key he again need to click on “Make Transaction Button” 
-	The same transaction dialog will open where user need to choose recipient from autocomplete. Then he need to Paste his Private key and amount he wants to send.
-	When mining process is done account balance will be updated.
-	When  he fill all these details correctly and click on “Make Transaction” Button 
Transaction will be added to transaction list. (at this point user will see the dialog after transaction submission which will show in which block that transaction will be added).


Transaction Tab

-	When  user clicks on transaction tab he will be able to see all the added transaction with un-confirmed status. 
                 Note: status is un-confirmed because that transaction is added to blockchain yet.
-	On transaction Page user will be able to see transaction list and three buttons with node name i.e Node 5000 mine block
-	User can choose which node can mine the block
-	When user click on Node 5000 mine block button the block will be mined and new block will be generated.
-	And transaction list will be empty now because transaction’s are added to block





Nodes Tab
-	When user click on Node Tab Node wallets will be displayed with information such as node balance ,number of block mined etc.
-	When Node will mine the block he will get 100 coins reward for mining the block and his node account balance will be updated.
-	Initially Node 5000 will get 100 coins for creating genesis block so frist time Node 5000 mine block count will be 1
-	And his account balance will be 100.


Blocks Tab

-	When User clicks on Blocks tab there blockchain will be displayed.
-	Node 5000 blockchain
-	Node 5001 blockchain 
-	Node 5002 blockchain
All these node will have exact same blockchain 

When user click on any block he will be able to see block details like 
Hash, timestamp ,transaction list.

