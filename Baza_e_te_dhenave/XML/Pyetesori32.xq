xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

(:Shipping companies with the products that they will be shipping and the arrival date:)
for $t in doc("DataBaseXML.xml")/OnlineApp/TN1
for $p in doc("DataBaseXML.xml")/OnlineApp/Products
for $s in doc("DataBaseXML.xml")/OnlineApp/Shippers
where $t/@ProductsID=$p/@ProductsID and $p/@ShippersID=$s/@ShippersID
return
<rez>
{$t/@OrdersID}
{$p/ProductName}
{$s/CompanyName}
{$t/ArrivalDate}
</rez>