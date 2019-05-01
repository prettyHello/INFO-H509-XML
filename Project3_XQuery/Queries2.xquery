xquery version "1.0";

<Proceedings>
{
for $SelectProceedings in doc("dblp-excerpt.xml")//proceedings
return
  <proceedings>
    <proc_title>{data($SelectProceedings/title)}</proc_title>
      {
        for $Selecttitle in doc("dblp-excerpt.xml")//*[crossref=data($SelectProceedings/@key)]/title
        return <title>{data($Selecttitle)}</title>
      }
  </proceedings>
}
</Proceedings>
