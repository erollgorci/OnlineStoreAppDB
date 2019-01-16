xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";
(:Customers with the products they bought excluding the cases where the unit price of product is >= 50:)
for $o in doc("DataBaseXML.xml")/OnlineApp/Orders
for $c in doc("DataBaseXML.xml")/OnlineApp/Customers
for $t in doc("DataBaseXML.xml")/OnlineApp/TN1
for $p in doc("DataBaseXML.xml")/OnlineApp/Products
where $c/@CustomersID=$o/@CustomersID and $o/@OrdersID=$t/@OrdersID and $t/@ProductsID=$p/@ProductsID and $p/UnitPrice<50
return 
<rez>{$c/FirstName}
{$p/ProductName}
{$p/UnitPrice}
</rez>
