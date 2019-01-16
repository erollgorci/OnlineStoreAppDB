xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";


(:Customers and the orders they made including information like productID,quantity and arrival date:)
for $o in doc("DataBaseXML.xml")/OnlineApp/Orders
for $c in doc("DataBaseXML.xml")/OnlineApp/Customers
for $t in doc("DataBaseXML.xml")/OnlineApp/TN1
where $c/@CustomersID=$o/@CustomersID and $o/@OrdersID=$t/@OrdersID
return
<rez>

{$o/@OrdersID}
{$t/@ProductsID}
{$c/FirstName}
{$t/Quantity}
{$t/ArrivalDate}
</rez>