xquery version "1.0";
declare namespace mylocal = "http://mynamespace.com";

declare function mylocal:Liste_co_autor($SelectAuthor as xs:string?, $other_Co_Author as xs:string?)
as xs:string?
{
 let $var := 0 
  
 for  $Compare_Author in distinct-values(doc("dblp-excerpt.xml")//*[author=$SelectAuthor]/author)
 where not($Compare_Author = $SelectAuthor)
 
 return  
 if ($Compare_Author = $other_Co_Author)
then 
let $var := 1

return 
if  ($var = 0)
then
<distance author1="{data($SelectAuthor)}" author2="{data($other_Co_Author)}" distance="2"/> 
  
};

<distances>

{
for $SelectAuthor in distinct-values( doc("dblp-excerpt.xml")//*/author ),  $Co_Author in distinct-values(doc("dblp-excerpt.xml")//*[author=$SelectAuthor]/author) 

order by $SelectAuthor

return ( 
if  (data($SelectAuthor) != data($Co_Author)) 
 then  
 <distance author1="{data($SelectAuthor)}" author2="{data($Co_Author)}" distance="1"/> ,
 
 
 for $other_Co_Author in distinct-values(doc("dblp-excerpt.xml")//*[author=$Co_Author]/author)
 return 
 if  ($SelectAuthor != $other_Co_Author) 
 then  
mylocal:Liste_co_autor($SelectAuthor, $other_Co_Author) 
 
)



}

</distances>
