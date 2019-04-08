<?xml version="1.0" encoding="UTF-8" ?>

<!-- New XSLT document created with EditiX XML Editor (http://www.editix.com) at Wed Apr 03 12:14:08 CEST 2019 -->

<xsl:stylesheet version="2.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
	<xsl:output method="xml" indent="yes"/>



	<xsl:variable name="SelectAuthors">
		<xsl:for-each select="*/*/author">
			<xsl:element name="author">
			<p><xsl:value-of select="."/></p>
			</xsl:element>
		</xsl:for-each>
	</xsl:variable>
	<xsl:template match="/">
		<html>
			<head>
				<title>recuperer tous les autheu</title>
			</head>
			<body>

	<!-- Variable qui contient le nom de tous les Auteurs du Document (meme les nom qui se repete) -->


<!--  <xsl:variable name="SelectAuthors" select="distinct-values(/dblp/*[name()=$ELEMENTS]/author)" /> -->
<!-- Variable qui contient les sous balise des balise principal -->
<xsl:variable name="CHEMIN1"><xsl:copy-of select="/dblp/article"/></xsl:variable>
<xsl:variable name="CHEMIN2"><xsl:copy-of select="/dblp/inproceedings"/></xsl:variable>
<xsl:variable name="CHEMIN3"><xsl:copy-of select="/dblp/proceedings"/></xsl:variable>
<xsl:variable name="CHEMIN4"><xsl:copy-of select="/dblp/book"/></xsl:variable>
<xsl:variable name="CHEMIN5"><xsl:copy-of select="/dblp/incollection"/></xsl:variable>
<xsl:variable name="CHEMIN6"><xsl:copy-of select="/dblp/phdthesis"/></xsl:variable>
<xsl:variable name="CHEMIN7"><xsl:copy-of select="/dblp/mastersthesis"/></xsl:variable>
<xsl:variable name="CHEMIN8"><xsl:copy-of select="/dblp/www"/></xsl:variable>


<!-- ############################ PRINCIPAL ############################ -->

<!-- boucle qui fait le trie et le slection des auteurs -->
<xsl:for-each select="$SelectAuthors/author">
	<xsl:variable name="NameAuthor">
		<xsl:value-of select="."/>
	</xsl:variable>



	<!-- variable qui contient le nombre d'occurence qu'apparait le nom d'un auteur dans chaque balise principal-->
	<xsl:variable name="NbreAuteurArticle"><xsl:value-of select="number(count($CHEMIN1/article[author=$NameAuthor]))"/></xsl:variable>
	<xsl:variable name="NbreAuteurInproceedings"><xsl:value-of select="number(count($CHEMIN2/inproceedings[author=$NameAuthor]))"/></xsl:variable>
	<xsl:variable name="NbreAuteurProceedings"><xsl:value-of select="number(count($CHEMIN3/proceedings[author=$NameAuthor]))"/></xsl:variable>
	<xsl:variable name="NbreAuteurBook"><xsl:value-of select="number(count($CHEMIN4/book[author=$NameAuthor]))"/></xsl:variable>
	<xsl:variable name="NbreAuteurIncollection"><xsl:value-of select="number(count($CHEMIN5/incollection[author=$NameAuthor]))"/></xsl:variable>
	<xsl:variable name="NbreAuteurPhdthesis"><xsl:value-of select="number(count($CHEMIN6/phdthesis[author=$NameAuthor]))"/></xsl:variable>
	<xsl:variable name="NbreAuteurMastersthesis"><xsl:value-of select="number(count($CHEMIN7/mastersthesis[author=$NameAuthor]))"/></xsl:variable>
	<xsl:variable name="NbreAuteurWww"><xsl:value-of select="number(count($CHEMIN8/www[author=$NameAuthor]))"/></xsl:variable>

	<!-- affiche chaque auheur distinct (sans les doublons) , avec le nombre total d'occurence qu'il apparait dans tous le document-->
	<h1><xsl:value-of select="$NameAuthor"/>  -( <xsl:value-of select="$NbreAuteurArticle + $NbreAuteurInproceedings + $NbreAuteurProceedings + $NbreAuteurBook + $NbreAuteurIncollection + $NbreAuteurPhdthesis + $NbreAuteurMastersthesis + $NbreAuteurWww"/> ) </h1>

	<table border="1">

	<!-- pour chaque Autheur distinct, affiche la liste decrossante des date des article auquel il son nom apparait-->
	<xsl:call-template name="SelectionYear">
		<xsl:with-param name="P_NameAuthor" select="$NameAuthor" />
		<xsl:with-param name="P_CHEMIN1" select="$CHEMIN1" />
		<xsl:with-param name="P_CHEMIN2" select="$CHEMIN2" />
		<xsl:with-param name="P_CHEMIN3" select="$CHEMIN3" />
		<xsl:with-param name="P_CHEMIN4" select="$CHEMIN4" />
		<xsl:with-param name="P_CHEMIN5" select="$CHEMIN5" />
		<xsl:with-param name="P_CHEMIN6" select="$CHEMIN6" />
		<xsl:with-param name="P_CHEMIN7" select="$CHEMIN7" />
		<xsl:with-param name="P_CHEMIN8" select="$CHEMIN8" />
	</xsl:call-template>

	</table>

	<h2> Co-author index </h2>

	<table border="1">

		<xsl:call-template name="SelectionCo_auteur">
			<xsl:with-param name="P_NameAuthor" select="$NameAuthor" />
			<xsl:with-param name="P_CHEMIN1" select="$CHEMIN1" />
			<xsl:with-param name="P_CHEMIN2" select="$CHEMIN2" />
			<xsl:with-param name="P_CHEMIN3" select="$CHEMIN3" />
			<xsl:with-param name="P_CHEMIN4" select="$CHEMIN4" />
			<xsl:with-param name="P_CHEMIN5" select="$CHEMIN5" />
			<xsl:with-param name="P_CHEMIN6" select="$CHEMIN6" />
			<xsl:with-param name="P_CHEMIN7" select="$CHEMIN7" />
			<xsl:with-param name="P_CHEMIN8" select="$CHEMIN8" />
		</xsl:call-template>

	</table>

</xsl:for-each>

			</body>
		</html>
	</xsl:template>

	<!-- ############################ LISTE DES TEMPLATE ############################ -->

	<!-- template pour afficher la liste des date -->


<xsl:variable name="Balises">
    <xsl:element name="Balise">article</xsl:element>
    <xsl:element name="Balise">inproceedings</xsl:element>
    <xsl:element name="Balise">proceedings</xsl:element>
    <xsl:element name="Balise">book</xsl:element>
    <xsl:element name="Balise">incollection</xsl:element>
    <xsl:element name="Balise">phdthesis</xsl:element>
    <xsl:element name="Balise">mastersthesis</xsl:element>
    <xsl:element name="Balise">www</xsl:element>
</xsl:variable>

	<xsl:template name="ListeAuteurs">

		<tr>
			<td>
			<xsl:for-each select="year">
				 <xsl:value-of select="position()"/>
			</xsl:for-each>
			</td>

			<td  valign="top">
			<xsl:if test="ee">
			<xsl:for-each select="ee">
				<xsl:variable name="Test" select="."/>
				 <a href="$Test">
				 <img alt="Electronic Edition" title="Electronic Edition" src="http://www.informatik.uni-trier.de/~ley/db/ee.gif" border="0" height="16" width="16"/></a>
			</xsl:for-each>
			</xsl:if>
			</td>

			<td>
			<xsl:for-each select="author">
				 <a href=" "> <xsl:value-of select="."/> </a>
			</xsl:for-each>

			<xsl:for-each select="title">
				 : <xsl:value-of select="."/>
			</xsl:for-each>
			</td>


		</tr>
	</xsl:template>

	<xsl:template name="ListeCo_Auteurs">

		<tr>
			<xsl:for-each select="author">
				<xsl:sort select="." data-type="number" order="descending" />
				<tr><th colspan="3" bgcolor="#FFFFCC"><xsl:value-of select="."/> </th></tr>
			</xsl:for-each>
		</tr>
	</xsl:template>


	<xsl:template name="SelectionYear">

		<xsl:param name="P_NameAuthor" />

		<xsl:param name="P_CHEMIN1" />
		<xsl:param name="P_CHEMIN2" />
		<xsl:param name="P_CHEMIN3" />
		<xsl:param name="P_CHEMIN4" />
		<xsl:param name="P_CHEMIN5" />
		<xsl:param name="P_CHEMIN6" />
		<xsl:param name="P_CHEMIN7" />
		<xsl:param name="P_CHEMIN8" />


	<xsl:for-each select="$P_CHEMIN1/article[author=$P_NameAuthor]">
		<xsl:sort select="year" data-type="number" order="descending" />
		<tr><th colspan="3" bgcolor="#FFFFCC"><xsl:value-of select="year"/> </th></tr>
	<xsl:call-template name="ListeAuteurs" />
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN2/inproceedings[author=$P_NameAuthor]">
		<xsl:sort select="year" data-type="number" order="descending" />
		<tr><th colspan="3" bgcolor="#FFFFCC"><xsl:value-of select="year"/> </th></tr>
	<xsl:call-template name="ListeAuteurs" />
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN3/proceedings[author=$P_NameAuthor]">
		<xsl:sort select="year" data-type="number" order="descending" />
		<tr><th colspan="3" bgcolor="#FFFFCC"><xsl:value-of select="year"/> </th></tr>
	<xsl:call-template name="ListeAuteurs" />
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN4/book[author=$P_NameAuthor]">
		<xsl:sort select="year" data-type="number" order="descending" />
		<tr><th colspan="3" bgcolor="#FFFFCC"><xsl:value-of select="year"/> </th></tr>
	<xsl:call-template name="ListeAuteurs" />
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN5/incollection[author=$P_NameAuthor]">
		<xsl:sort select="year" data-type="number" order="descending" />
		<tr><th colspan="3" bgcolor="#FFFFCC"><xsl:value-of select="year"/> </th></tr>
	<xsl:call-template name="ListeAuteurs" />
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN6/phdthesis[author=$P_NameAuthor]">
		<xsl:sort select="year" data-type="number" order="descending" />
		<tr><th colspan="3" bgcolor="#FFFFCC"><xsl:value-of select="year"/> </th></tr>
	<xsl:call-template name="ListeAuteurs" />
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN7/mastersthesis[author=$P_NameAuthor]">
		<xsl:sort select="year" data-type="number" order="descending" />
		<tr><th colspan="3" bgcolor="#FFFFCC"><xsl:value-of select="year"/> </th></tr>
	<xsl:call-template name="ListeAuteurs" />
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN8/www[author=$P_NameAuthor]">
		<xsl:sort select="year" data-type="number" order="descending" />
		<p><xsl:value-of select="year"/> </p>
	<xsl:call-template name="ListeAuteurs"/>
	</xsl:for-each>


	</xsl:template>

	<!--Liste co_auteur -->
	<xsl:template name="SelectionCo_auteur">

		<xsl:param name="P_NameAuthor" />

		<xsl:param name="P_CHEMIN1" />
		<xsl:param name="P_CHEMIN2" />
		<xsl:param name="P_CHEMIN3" />
		<xsl:param name="P_CHEMIN4" />
		<xsl:param name="P_CHEMIN5" />
		<xsl:param name="P_CHEMIN6" />
		<xsl:param name="P_CHEMIN7" />
		<xsl:param name="P_CHEMIN8" />

		<xsl:variable name="Co_authors">



<xsl:variable name="KeysAuthor" >
<xsl:if test="not(node()= $P_NameAuthor)">
		<p><xsl:value-of select="current()"/> </p>
		</xsl:if>
</xsl:variable>


	<xsl:for-each select="$P_CHEMIN1/article[author=$P_NameAuthor]">
	<xsl:for-each select="author">
		<xsl:if test="not(node()= $P_NameAuthor)">


					<xsl:element name="Co_author">
					<xsl:value-of select="."/>
					</xsl:element>


		</xsl:if>
	</xsl:for-each>
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN2/inproceedings[author=$P_NameAuthor]">
		<xsl:for-each select="author">
		<xsl:sort select="." data-type="text" order="ascending" />
		<xsl:if test="not(node()= $P_NameAuthor)">
			<xsl:element name="Co_author">
			<xsl:value-of select="."/>
			</xsl:element>
		</xsl:if>
	</xsl:for-each>
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN3/proceedings[author=$P_NameAuthor]">
		<xsl:for-each select="author">
		<xsl:sort select="." data-type="text" order="ascending" />
		<xsl:if test="not(node()= $P_NameAuthor)">
			<xsl:element name="Co_author">
			<xsl:value-of select="."/>
			</xsl:element>
		</xsl:if>
	</xsl:for-each>
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN4/book[author=$P_NameAuthor]">
	<xsl:for-each select="author">
		<xsl:if test="not(node()= $P_NameAuthor)">

					<xsl:element name="Co_author">
					<xsl:value-of select="."/>
					</xsl:element>

		</xsl:if>
	</xsl:for-each>
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN5/incollection[author=$P_NameAuthor]">
		<xsl:for-each select="author">
		<xsl:sort select="." data-type="text" order="ascending" />
		<xsl:if test="not(node()= $P_NameAuthor)">
			<xsl:element name="Co_author">
			<xsl:value-of select="."/>
			</xsl:element>
		</xsl:if>
	</xsl:for-each>
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN6/phdthesis[author=$P_NameAuthor]">
		<xsl:for-each select="author">
		<xsl:sort select="." data-type="text" order="ascending" />
		<xsl:if test="not(node()= $P_NameAuthor)">
			<xsl:element name="Co_author">
			<xsl:value-of select="."/>
			</xsl:element>
		</xsl:if>
	</xsl:for-each>
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN7/mastersthesis[author=$P_NameAuthor]">
		<xsl:for-each select="author">
		<xsl:sort select="." data-type="text" order="ascending" />
		<xsl:if test="not(node()= $P_NameAuthor)">
			<xsl:element name="Co_author">
			<xsl:value-of select="."/>
			</xsl:element>
		</xsl:if>
	</xsl:for-each>
	</xsl:for-each>

	<xsl:for-each select="$P_CHEMIN8/www[author=$P_NameAuthor]">
		<xsl:for-each select="author">
		<xsl:sort select="." data-type="text" order="ascending" />
		<xsl:if test="not(node()= $P_NameAuthor)">
			<xsl:element name="Co_author">
			<xsl:value-of select="."/>
			</xsl:element>		</xsl:if>
	</xsl:for-each>
	</xsl:for-each>

	</xsl:variable>

<xsl:for-each select="$Co_authors">
	<xsl:for-each select="Co_author">
	<xsl:sort select="." order="ascending"/>
	<p><xsl:value-of select="."/></p>
</xsl:for-each>
</xsl:for-each>




	</xsl:template>

</xsl:stylesheet>
