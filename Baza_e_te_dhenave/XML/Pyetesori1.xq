xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";
(:Data about table Customers:)
for $c in doc("DataBaseXML.xml")/OnlineApp/Customers
return
<rez>{$c}</rez>