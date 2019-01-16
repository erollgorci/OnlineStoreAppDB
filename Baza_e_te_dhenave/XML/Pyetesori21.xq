xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";
(:Products with their corresponding shipping companies with the condition that shipping price is less than 3:)

for $p in doc("DataBaseXML.xml")/OnlineApp/Products
for $s in doc("DataBaseXML.xml")/OnlineApp/Shippers
where $p/@ShippersID=$s/@ShippersID and $s/ShippCost<3
return
<rez>
{$p/ProductName}
{$s/CompanyName}
</rez>
