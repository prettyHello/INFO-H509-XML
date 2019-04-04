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

<xsl:variable name="ELEMENTS">book</xsl:variable>

<!--
<xsl:variable name="authors">
	<xsl:for-each select="distinct-values(/dblp/*[name()=$ELEMENTS]/author)">
		<xsl:element name="author"><xsl:value-of select="."/></xsl:element>
	</xsl:for-each>
</xsl:variable>
 -->
<xsl:variable name="authors" select="distinct-values(/dblp/*[name()=$ELEMENTS]/author)" />
	

<xsl:variable name="article">
	<xsl:copy-of select="/dblp/*[name()=$ELEMENTS]"/>
</xsl:variable>

<xsl:for-each select="$authors">
	<xsl:variable name="author"><xsl:value-of select="."/></xsl:variable>
	<p> <xsl:value-of select="$author"/>- <xsl:value-of select="count($article/*[name()=$ELEMENTS][author=$author])"/> </p><xsl:text>&#xa;</xsl:text>
	<p><xsl:value-of select="$article/book[author=$author]/year"/><xsl:text>&#xa;</xsl:text></p>
	<!--
	<xsl:for-each select="$article/book[author=$authors/author]/year">
		<p><xsl:value-of select="."/><xsl:text>&#xa;</xsl:text></p>
	</xsl:for-each> -->
	
</xsl:for-each>

				<h1> ELEMENT article</h1>
				<xsl:apply-templates select="dblp/article/author" /> 
				<h1> ELEMENT inproceedings</h1>
				<xsl:apply-templates select="dblp/inproceedings/author"/>
				<h1> ELEMENT proceedings</h1>
				<xsl:apply-templates select="dblp/proceedings/author"/>
				<h1> ELEMENT book</h1>
				<xsl:apply-templates select="dblp/book/author"/>
				<h1> ELEMENT incollection</h1>
				<xsl:apply-templates select="dblp/incollection/author"/>
				<h1> ELEMENT phdthesis</h1>
				<xsl:apply-templates select="dblp/phdthesis/author"/>
				<h1> ELEMENT mastersthesis</h1>
				<xsl:apply-templates select="dblp/mastersthesis/author"/>
				<h1> ELEMENT www</h1>
				<xsl:apply-templates select="dblp/www/author"/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="author">
		<xsl:variable name="Num" select="position()"/>
		<xsl:variable name="VAR"><xsl:value-of select="$Num"/> <xsl:value-of select="."/> </xsl:variable>
		<p><xsl:value-of select="$VAR"/> </p>
	</xsl:template>
	
</xsl:stylesheet>




<!-- ####################################################################################################

<xsl:for-each select="dblp">
	
					<h1>Liste auteurs dans element article</h1>
					<xsl:for-each select="article">
						<xsl:choose>
							<xsl:when test="author">
								<xsl:variable name="Num" select="position()"/>
								<p>
									<xsl:value-of select="$Num"/> <xsl:value-of select="author"/>
								</p>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
					<h1>Liste auteurs dans element inproceedings</h1>
					<xsl:for-each select="inproceedings">
						<xsl:choose>
							<xsl:when test="author">
								<xsl:variable name="Num" select="position()"/>
								<p>
									<xsl:value-of select="concat('', $Num)"/> <xsl:value-of select="author"/>
								</p>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
					<h1>Liste auteurs dans element proceedings</h1>
					<xsl:for-each select="proceedings">
						<xsl:choose>
							<xsl:when test="author">
								<xsl:variable name="Num" select="position()"/>
								<p>
									<xsl:value-of select="concat('', $Num)"/> <xsl:value-of select="author"/>
								</p>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
					<h1>Liste auteurs dans element book</h1>
					<xsl:for-each select="book">
						<xsl:choose>
							<xsl:when test="author">
								<xsl:variable name="Num" select="position()"/>
								<p>
									<xsl:value-of select="concat('', $Num)"/> <xsl:value-of select="author"/>
								</p>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
					<h1>Liste auteurs dans element incollection</h1>
					<xsl:for-each select="incollection">
						<xsl:choose>
							<xsl:when test="author">
								<xsl:variable name="Num" select="position()"/>
								<p>
									<xsl:value-of select="concat('', $Num)"/> <xsl:value-of select="author"/>
								</p>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
					<h1>Liste auteurs dans element phdthesis</h1>
					<xsl:for-each select="phdthesis">
						<xsl:choose>
							<xsl:when test="author">
								<xsl:variable name="Num" select="position()"/>
								<p>
									<xsl:value-of select="concat('', $Num)"/> <xsl:value-of select="author"/>
								</p>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
					<h1>Liste auteurs dans element mastersthesis</h1>
					<xsl:for-each select="mastersthesis">
						<xsl:choose>
							<xsl:when test="author">
								<xsl:variable name="Num" select="position()"/>
								<p>
									<xsl:value-of select="concat('', $Num)"/> <xsl:value-of select="author"/>
								</p>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
					<h1>Liste auteurs dans element www</h1>
					<xsl:for-each select="www">
						<xsl:choose>
							<xsl:when test="author">
								<xsl:variable name="Num" select="position()"/>
								<p>
									<xsl:value-of select="concat('', $Num)"/> <xsl:value-of select="author"/>
								</p>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</xsl:for-each>
				
				-->
