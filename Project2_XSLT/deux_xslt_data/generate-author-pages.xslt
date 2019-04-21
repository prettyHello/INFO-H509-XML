<?xml version="1.0" encoding="UTF-8" ?>

<!-- New XSLT document created with EditiX XML Editor (http://www.editix.com) at Wed Apr 03 12:14:08 CEST 2019 -->

<xsl:stylesheet version="2.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
	<xsl:output method="html" indent="yes"  use-character-maps="html-illegal-chars"/>
	<xsl:character-map name="html-illegal-chars">
		<xsl:output-character character="&#150;" string=" "/>
	</xsl:character-map>

	<!-- ############################ PARTIE I: Listing Variables  ############################ -->

	<xsl:variable name="SelectAuthors">
		<xsl:for-each select="*/*/author | */*/editor">
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
	<xsl:template match="/">
		<!-- ############################ PARTIE II: MAIN ############################ -->

		<xsl:for-each-group select="$SelectAuthors/author | $SelectAuthors/editor" group-by=".">
			<xsl:if test="position() ne 1"/>
			<xsl:variable name="NameAuthor">
				<xsl:value-of select="."/>
			</xsl:variable>
			<xsl:variable name="LastName">
				<xsl:value-of select="replace(tokenize(.,' ')[last()], '[^a-zA-Z0-9 -.]','=')"/>
			</xsl:variable>
			<xsl:variable name="firstName">
				<xsl:value-of select="substring-before(replace(replace(., '[^a-zA-Z0-9 -.]', '='), ' ','_'),$LastName)"/>
			</xsl:variable>
			<xsl:variable name="firstLetter">
				<xsl:value-of select="translate(substring($LastName, 1, 1), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
			</xsl:variable>
			<xsl:result-document method="html" href="a-tree/{$firstLetter}/{$LastName}.{$firstName}.html">
				<html>
					<head>
						<title>
							Publication of <xsl:value-of select="$NameAuthor"/>
						</title>
					</head>
					<body>
						<h1>
							<a href="../">HOME </a>
						</h1>
						<h1>
							<xsl:value-of select="$NameAuthor"/>
						</h1>
						<table border="1">
							<xsl:call-template name="SelectionYear">
								<xsl:with-param name="P_NameAuthor" select="$NameAuthor"/>
							</xsl:call-template>
						</table>
						<h1> Co-author index </h1>
						<table border="1">
							<xsl:call-template name="SelectionCo_auteur">
								<xsl:with-param name="P_NameAuthor" select="$NameAuthor"/>
								<xsl:with-param name="P_LastName" select="$LastName"/>
								<xsl:with-param name="P_firstName" select="$firstName"/>
							</xsl:call-template>
						</table>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each-group>
	</xsl:template>

	<!-- ############################ PARTIE III: LISTE DES TEMPLATES ############################ -->
	<!-- template pour sauvegarder la liste noms des autres author ou editor de l'auteur Courant (selectionner)  -->
	<xsl:template name="ListeAuteurs">
		<xsl:for-each select="author | editor">
			<xsl:element name="Author">
				<xsl:value-of select="."/>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>

	<!-- template pour afficher et regrouper par date les information du premier Tableau -->
	<xsl:template name="SelectionYear">
		<xsl:param name="P_NameAuthor"/>
		<xsl:variable name="GroupeYears">
			<xsl:for-each select="$dblps/dblp">
				<xsl:for-each select="*[author=$P_NameAuthor] | *[editor=$P_NameAuthor]">
					<xsl:element name="GroupeYear">
						<xsl:element name="year">
							<xsl:value-of select="year"/>
						</xsl:element>
						<xsl:element name="title">
							<xsl:value-of select="title"/>
						</xsl:element>
						<xsl:element name="booktitle">
							<xsl:value-of select="booktitle"/>
						</xsl:element>
						<xsl:element name="isbn">
							<xsl:value-of select="isbn"/>
						</xsl:element>
						<xsl:element name="journal">
							<xsl:value-of select="journal"/>
						</xsl:element>
						<xsl:element name="pages">
							<xsl:value-of select="pages"/>
						</xsl:element>
						<xsl:element name="volume">
							<xsl:value-of select="volume"/>
						</xsl:element>
						<xsl:element name="number">
							<xsl:value-of select="number"/>
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
			<xsl:variable name="Indexs" select="position()"/>
			<xsl:if test="position() ne 1"/>
			<xsl:variable name="Isyear" select="replace(., '\.$', '')"/>
			<tr>
				<th colspan="3" bgcolor="#FFFFCC">
					<xsl:value-of select="$Isyear"/>
				</th>
			</tr>
			<xsl:for-each select="$GroupeYears">
				<xsl:for-each select="GroupeYear[year=$Isyear]">
					<xsl:sort select="title" />
					<tr>
						<td align="right" valign="top">
							<xsl:variable name="Index" select="$Indexs + position() - 1"/>
							<xsl:for-each select="number(count($GroupeYears/GroupeYear/year))">
								<xsl:variable name="TotalPublisher" select="."/>
								<xsl:value-of select="$TotalPublisher - $Index + 1"/>
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
										<xsl:value-of select="replace(tokenize(.,' ')[last()], '[^a-zA-Z0-9 -.]','=')"/>
									</xsl:variable>
									<xsl:variable name="firstName">
										<xsl:value-of select="substring-before(replace(replace(., '[^a-zA-Z0-9 -.]', '='), ' ','_'),$LastName)"/>
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

												<xsl:if test="booktitle !='' ">
													 <xsl:text> </xsl:text><xsl:value-of select="booktitle"/>
												</xsl:if>

											<xsl:text> </xsl:text><xsl:value-of select="year"/>

												<xsl:if test="isbn !='' ">
													: <xsl:value-of select="isbn"/>
												</xsl:if>
												<xsl:if test="journal !='' ">
													<xsl:text> </xsl:text><xsl:value-of select="journal"/>
													<xsl:text> </xsl:text><xsl:value-of select="volume"/>
													(<xsl:value-of select="number"/>)
												</xsl:if>
												<xsl:if test="pages !='' ">
													: <xsl:value-of select="pages"/>
												</xsl:if>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:for-each-group>
	</xsl:template>

<!-- template pour afficher la liste des co_auteur et regrouper  les information du premier Tableau 2 -->

	<xsl:template name="SelectionCo_auteur">
		<xsl:param name="P_NameAuthor"/>
		<xsl:param name="P_LastName"/>
		<xsl:param name="P_firstName"/>
		<xsl:variable name="Co_authors">
			<xsl:for-each select="$dblps/dblp">
				<xsl:for-each select="*[author=$P_NameAuthor] | *[editor=$P_NameAuthor] ">
					<xsl:element name="ListeCo_author">
						<xsl:for-each select="author | editor">
							<xsl:if test="not(node()= $P_NameAuthor)">
								<xsl:element name="Co_author">
									<xsl:value-of select="."/>
								</xsl:element>
							</xsl:if>
						</xsl:for-each>
					</xsl:element>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:variable>
		<xsl:for-each-group select="$Co_authors/ListeCo_author/Co_author" group-by="replace(., '\.$', '')">
			<xsl:sort select="." order="ascending"/>

			<xsl:if test="position() ne 1"/>
			<xsl:variable name="IsCo_author" select="replace(., '\.$', '')"/>
			<tr>
				<td align="right">
					<xsl:variable name="LastName">
						<xsl:value-of select="replace(tokenize(.,' ')[last()], '[^a-zA-Z0-9 -.]','=')"/>
					</xsl:variable>
					<xsl:variable name="firstNameCo">
						<xsl:value-of select="substring-before(replace(replace(., '[^a-zA-Z0-9 -.]', '='), ' ','_'),$LastName)"/>
					</xsl:variable>
					<xsl:variable name="firstLetterCo">
						<xsl:value-of select="translate(substring($LastName, 1, 1), 'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
					</xsl:variable>
					<a href="../{$firstLetterCo}/{$LastName}.{$firstNameCo}.html">
						<xsl:value-of select="$IsCo_author"/>
					</a>
				</td>
				<td align="left">
					<xsl:for-each select="number(count($dblps/*/*[author=$P_NameAuthor] | *[editor=$P_NameAuthor] ))">
						<xsl:variable name="TotalCo_author" select="."/>
						<xsl:for-each select="$Co_authors/ListeCo_author">
							<xsl:variable name="Indexs" select="position()"/>
							<xsl:for-each select="Co_author">
								<xsl:variable name="PageArticle" select="$TotalCo_author - $Indexs + 1"/>
								<xsl:if test="$IsCo_author = .">
					[<a href="{$P_LastName}.{$P_firstName}.html#p{$PageArticle}">
									<xsl:value-of select="$PageArticle"/>
					 </a>]<xsl:text> </xsl:text>
				 		</xsl:if>
		</xsl:for-each>
	</xsl:for-each>
</xsl:for-each>



			</td>
			</tr>
		</xsl:for-each-group>
	</xsl:template>
</xsl:stylesheet>
