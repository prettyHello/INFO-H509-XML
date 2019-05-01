xquery version "1.0";

<authors_coauthors>
{

for $SelectAuthor in distinct-values( doc("dblp-excerpt.xml")//*/author )

return
  <author>
    <name> {data($SelectAuthor)}</name>

      <coauthors number="{number(count(distinct-values(doc("dblp-excerpt.xml")//*[author=$SelectAuthor]/author)))-1}">
      {
        for $Co_Author in distinct-values(doc("dblp-excerpt.xml")//*[author=$SelectAuthor]/author)
           return
            if ( $SelectAuthor != $Co_Author )
            then
            <coauthor>
              <name> {data($Co_Author)} </name>
              <nb_joint_pubs>
                {count(distinct-values(doc("dblp-excerpt.xml")//*[author=$SelectAuthor]/author[.=$Co_Author] ))}
              </nb_joint_pubs>
            </coauthor>
       }
       </coauthors>
  </author>
}

</authors_coauthors>
