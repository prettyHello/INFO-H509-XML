<?xml version="1.0" encoding="UTF-8" ?>

<!-- New XSLT document created with EditiX XML Editor (http://www.editix.com) at Wed Apr 03 12:14:08 CEST 2019 -->

<xsl:stylesheet version="2.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
	<xsl:output method="html" indent="yes" encoding="UTF-8" use-character-maps="html-illegal-chars"/>
	<xsl:character-map name="html-illegal-chars">
		<xsl:output-character character="" string="–"/><!-- EN DASH in CP1252 -->
	</xsl:character-map>
	<xsl:variable name="SelectAuthors">
		<xsl:for-each select="*/*/author">
			<xsl:element name="author">
				<xsl:value-of select="."/>
			</xsl:element>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="dblps">
		<xsl:for-each select="*/*">
			<xsl:element name="dblp">
				<xsl:copy-of select="."/>
			</xsl:element>
		</xsl:for-each>
	</xsl:variable>
	<xsl:template match="/"><!-- Variable qui contient le nom de tous les Auteurs du Document (meme les nom qui se repete) --><!--  <xsl:variable name="SelectAuthors" select="distinct-values(/dblp/*[name()=$ELEMENTS]/author)" /> --><!-- Variable qui contient les sous balise des balise principal -->
		<!-- ############################ PRINCIPAL ############################ --><!-- boucle qui fait le trie et le slection des auteurs -->
		<xsl:for-each-group select="$SelectAuthors/author" group-by=".">
			<xsl:if test="position() ne 1"/>
			<xsl:variable name="NameAuthor">
				<xsl:value-of select="."/>
			</xsl:variable>
			<xsl:variable name="LastName">
				<xsl:value-of select="tokenize(.,' ')[last()]"/>
			</xsl:variable>
			<xsl:variable name="firstName">
				<xsl:value-of select="substring-before(replace(replace(., '[^a-zA-Z0-9 -.]', '='), ' ','.'),$LastName)"/>
			</xsl:variable>
			<xsl:variable name="firstLetter">
				<xsl:value-of select="translate(substring($LastName, 1, 1), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
			</xsl:variable>
			<xsl:result-document method="html" href="a-tree/{$firstLetter}/{$LastName}.{$firstName}.html">
				<html>
					<head>
						<title>
							<xsl:value-of select="$NameAuthor"/>
						</title>
					</head>
					<body><!-- affiche chaque auheur distinct (sans les doublons) , avec le nombre total d'occurence qu'il apparait dans tous le document-->
						<h1>
							<a href="../">HOME </a>
						</h1>
						<h1>
							<xsl:value-of select="$NameAuthor"/>
						</h1><!-- pour chaque Autheur distinct, affiche la liste decrossante des date des article auquel il son nom apparait-->
						<table border="1">
							<xsl:call-template name="SelectionYear">
								<xsl:with-param name="P_NameAuthor" select="$NameAuthor"/>
							</xsl:call-template>
						</table>
						<h1> Co-author index </h1>
						<table border="1">
							<xsl:call-template name="SelectionCo_auteur">
								<xsl:with-param name="P_NameAuthor" select="$NameAuthor"/>
							</xsl:call-template>
						</table>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each-group>
	</xsl:template><!-- ############################ LISTE DES TEMPLATE ############################ --><!-- template pour afficher la liste des date -->
	<xsl:template name="ListeAuteurs">
		<xsl:for-each select="author">
			<xsl:element name="Author">
				<xsl:value-of select="."/>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="SelectionYear">
		<xsl:param name="P_NameAuthor"/>
		<xsl:variable name="GroupeYears">
			<xsl:for-each select="$dblps/dblp">
				<xsl:for-each select="*[author=$P_NameAuthor]">
					<xsl:element name="GroupeYear">
						<xsl:element name="year">
							<xsl:value-of select="year"/>
						</xsl:element>
						<xsl:element name="title">
							<xsl:value-of select="title"/>
						</xsl:element>
						<xsl:element name="ListeCoAuteurs">
							<xsl:call-template name="ListeAuteurs"/>
						</xsl:element>
						<xsl:element name="ee">
							<xsl:value-of select="ee"/>
						</xsl:element>
					</xsl:element>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:variable>
		<xsl:for-each-group select="$GroupeYears/GroupeYear/year" group-by="replace(., '\.$', '')">
			<xsl:sort select="." data-type="number" order="descending"/>
			<xsl:variable name="Numpublishers" select="position()"/>
			<xsl:if test="position() ne 1"/>
			<xsl:variable name="Isyear" select="replace(., '\.$', '')"/>
			<tr>
				<th colspan="3" bgcolor="#FFFFCC">
					<xsl:value-of select="$Isyear"/>
				</th>
			</tr>
			<xsl:for-each select="$GroupeYears">
				<xsl:for-each select="GroupeYear[year=$Isyear]">
					<tr>
						<td align="right" valign="top">
							<xsl:variable name="Numpublisher" select="$Numpublishers + position() - 1"/>
							<xsl:for-each select="number(count($GroupeYears/GroupeYear/year))">
								<xsl:variable name="Totalpublishers" select="."/>
								<xsl:value-of select="$Totalpublishers - $Numpublisher + 1"/>
							</xsl:for-each>
						</td>
						<td>
							<xsl:if test="ee !='' ">
								<xsl:variable name="Test">
									<xsl:value-of select="ee"/>
								</xsl:variable>
								<a href="{$Test}">
									<img alt="Electronic Edition" title="Electronic Edition" src="http://www.informatik.uni-trier.de/~ley/db/ee.gif" border="0" height="16" width="16"/>
								</a>
							</xsl:if>
						</td>
						<td>
							<xsl:for-each select="ListeCoAuteurs">
								<xsl:for-each select="Author">
									<xsl:variable name="LastName">
										<xsl:value-of select="tokenize(.,' ')[last()]"/>
									</xsl:variable>
									<xsl:variable name="firstName">
										<xsl:value-of select="substring-before(replace(replace(., '[^a-zA-Z0-9 -.]', '='), ' ','.'),$LastName)"/>
									</xsl:variable>
									<xsl:variable name="firstLetter">
										<xsl:value-of select="translate(substring($LastName, 1, 1), 'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="$P_NameAuthor != .">
											<a href="../{$firstLetter}/{$LastName}.{$firstName}.html">
												<xsl:value-of select="."/>
											</a>,
</xsl:when>
										<xsl:when test="$P_NameAuthor = .">
											<xsl:value-of select="."/>,
</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</xsl:for-each>
												: <xsl:value-of select="title"/>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:for-each-group>
	</xsl:template><!--Liste co_auteur -->
	<xsl:template name="SelectionCo_auteur">
		<xsl:param name="P_NameAuthor"/>
		<xsl:variable name="Co_authors">
			<xsl:for-each select="$dblps/dblp">
				<xsl:for-each select="*[author=$P_NameAuthor]">
					<xsl:for-each select="author">
						<xsl:if test="not(node()= $P_NameAuthor)">
							<xsl:element name="Co_author">
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:variable>
		<xsl:for-each-group select="$Co_authors/Co_author" group-by="replace(., '\.$', '')">
			<xsl:sort select="." order="ascending"/>
			<xsl:variable name="Numpublishers" select="position()"/>
			<xsl:if test="position() ne 1"/>
			<xsl:variable name="IsCo_author" select="replace(., '\.$', '')"/>
			<tr>
				<td align="right">
					<xsl:variable name="LastName">
						<xsl:value-of select="tokenize(.,' ')[last()]"/>
					</xsl:variable>
					<xsl:variable name="firstName">
						<xsl:value-of select="substring-before(replace(replace(., '[^a-zA-Z0-9 -.]', '='), ' ','.'),$LastName)"/>
					</xsl:variable>
					<xsl:variable name="firstLetter">
						<xsl:value-of select="translate(substring($LastName, 1, 1), 'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
					</xsl:variable>
					<a href="../{$firstLetter}/{$LastName}.{$firstName}.html">
						<xsl:value-of select="$IsCo_author"/>
					</a>
				</td>
				<td align="left"> [<a href="#p3"> X</a>] </td>
			</tr>
		</xsl:for-each-group>
	</xsl:template>
</xsl:stylesheet>
