xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";
(:Orders with their corresponding Customers:)
for $o in doc("DataBaseXML.xml")/OnlineApp/Orders
for $c in doc("DataBaseXML.xml")/OnlineApp/Customers
where $c/@CustomersID=$o/@CustomersID
return
<rez>

{$o/@OrdersID}

{$c/FirstName}
</rez>