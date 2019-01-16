xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

(:Cities which bought jewelery:)
for $o in doc("DataBaseXML.xml")/OnlineApp/Orders
for $t in doc("DataBaseXML.xml")/OnlineApp/TN1
for $p in doc("DataBaseXML.xml")/OnlineApp/Products
where $o/@OrdersID=$t/@OrdersID and $t/@ProductsID=$p/@ProductsID and $p/Category="jewelery"
return $o/ShippCity



            