<?xml version="1.0" encoding="UTF-8" ?>

<!-- New XSLT document created with EditiX XML Editor (http://www.editix.com) at Wed Apr 03 12:14:08 CEST 2019 -->

<xsl:stylesheet version="2.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>recuperer tous les autheu</title>
			</head>
			<body>

	<!-- Variable qui contient le nom de tous les Auteurs du Document (meme les nom qui se repete) -->	
	<xsl:variable name="SelectAuthors">	
		<xsl:for-each select="dblp">
			<xsl:for-each select="distinct-values(/dblp/article/author)">
			<xsl:element name="author">
				<xsl:value-of select="."/>
			</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="distinct-values(/dblp/inproceedings/author)">
			<xsl:element name="author">
				<xsl:value-of select="."/>
			</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="distinct-values(/dblp/proceedings/author)">
			<xsl:element name="author">
				<xsl:value-of select="."/>
			</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="distinct-values(/dblp/book/author)">
			<xsl:element name="author">
				<xsl:value-of select="."/>
			</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="distinct-values(/dblp/incollection/author)">
			<xsl:element name="author">
				<xsl:value-of select="."/>
			</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="distinct-values(/dblp/phdthesis/author)">
			<xsl:element name="author">
				<xsl:value-of select="."/>
			</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="distinct-values(/dblp/mastersthesis/author)">
			<xsl:element name="author">
				<xsl:value-of select="."/>
			</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="distinct-values(/dblp/www/author)">
			<xsl:element name="author">
				<xsl:value-of select="."/>
			</xsl:element>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:variable>

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
	<p> <xsl:value-of select="$NameAuthor"/> - <xsl:value-of select="$NbreAuteurArticle + $NbreAuteurInproceedings + $NbreAuteurProceedings + $NbreAuteurBook + $NbreAuteurIncollection + $NbreAuteurPhdthesis + $NbreAuteurMastersthesis + $NbreAuteurWww"/> </p>
	
	
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
	<!--<xsl:for-each select="$CHEMIN1/article[author=$NameAuthor]/year"> 
		<xsl:sort select="." data-type="number" order="descending" />
		<xsl:variable name="VAR2"> <xsl:value-of select="."/> </xsl:variable>
		<p><xsl:value-of select="$VAR2"/> </p>
	</xsl:for-each> 
	
	<xsl:for-each select="$CHEMIN4/book[author=$NameAuthor]/year"> 
		<xsl:sort select="." data-type="number" order="descending" />
		<xsl:variable name="VAR2"> <xsl:value-of select="."/> </xsl:variable>
		<p><xsl:value-of select="$VAR2"/> </p>
	</xsl:for-each> -->
	
</xsl:for-each>

			</body>
		</html>
	</xsl:template>
	
	<!-- ############################ LISTE DES TEMPLATE ############################ -->
	
	<!-- template pour afficher la liste des date -->
	
	
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
		
		
	<xsl:for-each select="$P_CHEMIN1/article[author=$P_NameAuthor]/year"> 
		<xsl:sort select="." data-type="number" order="descending" />
		<xsl:variable name="VAR2"> <xsl:value-of select="."/> </xsl:variable>
		<p><xsl:value-of select="$VAR2"/> </p>
	</xsl:for-each> 
	
	<xsl:for-each select="$P_CHEMIN2/inproceedings[author=$P_NameAuthor]/year"> 
		<xsl:sort select="." data-type="number" order="descending" />
		<xsl:variable name="VAR2"> <xsl:value-of select="."/> </xsl:variable>
		<p><xsl:value-of select="$VAR2"/> </p>
	</xsl:for-each> 
	
	<xsl:for-each select="$P_CHEMIN3/proceedings[author=$P_NameAuthor]/year"> 
		<xsl:sort select="." data-type="number" order="descending" />
		<xsl:variable name="VAR2"> <xsl:value-of select="."/> </xsl:variable>
		<p><xsl:value-of select="$VAR2"/> </p>
	</xsl:for-each> 
	
	<xsl:for-each select="$P_CHEMIN4/book[author=$P_NameAuthor]/year"> 
		<xsl:sort select="." data-type="number" order="descending" />
		<xsl:variable name="VAR2"> <xsl:value-of select="."/> </xsl:variable>
		<p><xsl:value-of select="$VAR2"/> </p>
	</xsl:for-each> 
	
	<xsl:for-each select="$P_CHEMIN5/incollection[author=$P_NameAuthor]/year"> 
		<xsl:sort select="." data-type="number" order="descending" />
		<xsl:variable name="VAR2"> <xsl:value-of select="."/> </xsl:variable>
		<p><xsl:value-of select="$VAR2"/> </p>
	</xsl:for-each> 
	
	<xsl:for-each select="$P_CHEMIN6/phdthesis[author=$P_NameAuthor]/year"> 
		<xsl:sort select="." data-type="number" order="descending" />
		<xsl:variable name="VAR2"> <xsl:value-of select="."/> </xsl:variable>
		<p><xsl:value-of select="$VAR2"/> </p>
	</xsl:for-each> 
	
	<xsl:for-each select="$P_CHEMIN7/mastersthesis[author=$P_NameAuthor]/year"> 
		<xsl:sort select="." data-type="number" order="descending" />
		<xsl:variable name="VAR2"> <xsl:value-of select="."/> </xsl:variable>
		<p><xsl:value-of select="$VAR2"/> </p>
	</xsl:for-each> 
	
	<xsl:for-each select="$P_CHEMIN8/www[author=$P_NameAuthor]/year"> 
		<xsl:sort select="." data-type="number" order="descending" />
		<xsl:variable name="VAR2"> <xsl:value-of select="."/> </xsl:variable>
		<p><xsl:value-of select="$VAR2"/> </p>
	</xsl:for-each> 
			
	</xsl:template>
	
</xsl:stylesheet>

