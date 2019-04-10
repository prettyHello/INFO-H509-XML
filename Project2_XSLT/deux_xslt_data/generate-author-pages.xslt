<?xml version="1.0" encoding="UTF-8" ?>

<!-- New XSLT document created with EditiX XML Editor (http://www.editix.com) at Wed Apr 03 12:14:08 CEST 2019 -->

<xsl:stylesheet version="2.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
	<xsl:output method="html" indent="yes" encoding="UTF-8" use-character-maps="html-illegal-chars"/>

	<xsl:character-map name="html-illegal-chars">
		<xsl:output-character character="&#127;" string=""/><!-- DEL in CP1252 -->
		<xsl:output-character character="&#128;" string="&#x20AC;"/><!-- EURO SIGN in CP1252 -->
		<xsl:output-character character="&#129;" string=""/><!-- UNDEFINED in CP1252 -->
		<xsl:output-character character="&#130;" string="&#x201A;"/><!-- SINGLE LOW-9 QUOTATION MARK in CP1252 -->
		<xsl:output-character character="&#131;" string="&#x0192;"/><!-- LATIN SMALL LETTER F WITH HOOK in CP1252 -->
		<xsl:output-character character="&#132;" string="&#x201E;"/><!-- DOUBLE LOW-9 QUOTATION MARK in CP1252 -->
		<xsl:output-character character="&#133;" string="&#x2026;"/><!-- HORIZONTAL ELLIPSIS in CP1252 -->
		<xsl:output-character character="&#134;" string="&#x2020;"/><!-- DAGGER in CP1252 -->
		<xsl:output-character character="&#135;" string="&#x2021;"/><!-- DOUBLE DAGGER in CP1252 -->
		<xsl:output-character character="&#136;" string="&#x02C6;"/><!-- MODIFIER LETTER CIRCUMFLEX ACCENT in CP1252 -->
		<xsl:output-character character="&#137;" string="&#x2030;"/><!-- PER MILLE SIGN in CP1252 -->
		<xsl:output-character character="&#138;" string="&#x0160;"/><!-- LATIN CAPITAL LETTER S WITH CARON in CP1252 -->
		<xsl:output-character character="&#139;" string="&#x2039;"/><!-- SINGLE LEFT-POINTING ANGLE QUOTATION MARK in CP1252 -->
		<xsl:output-character character="&#140;" string="&#x0152;"/><!-- LATIN CAPITAL LIGATURE OE in CP1252 -->
		<xsl:output-character character="&#141;" string="&#x02D8;"/><!-- BREVE in CP1252 -->
		<xsl:output-character character="&#142;" string="&#x017D;"/><!-- LATIN CAPITAL LETTER Z WITH CARON in CP1252 -->
		<xsl:output-character character="&#143;" string=""/><!-- UNDEFINED in CP1252 -->
		<xsl:output-character character="&#144;" string=""/><!-- UNDEFINED in CP1252 -->
		<xsl:output-character character="&#145;" string="&#x2018;"/><!-- LEFT SINGLE QUOTATION MARK in CP1252 -->
		<xsl:output-character character="&#146;" string="&#x2019;"/><!-- RIGHT SINGLE QUOTATION MARK in CP1252 -->
		<xsl:output-character character="&#147;" string="&#x201C;"/><!-- LEFT DOUBLE QUOTATION MARK in CP1252 -->
		<xsl:output-character character="&#148;" string="&#x201D;"/><!-- RIGHT DOUBLE QUOTATION MARK in CP1252 -->
		<xsl:output-character character="&#149;" string="&#x2022;"/><!-- BULLET in CP1252 -->
		<xsl:output-character character="&#150;" string="&#x2013;"/><!-- EN DASH in CP1252 -->
		<xsl:output-character character="&#151;" string="&#x2014;"/><!-- EM DASH in CP1252 -->
		<xsl:output-character character="&#152;" string="&#x02DC;"/><!-- SMALL TILDE in CP1252 -->
		<xsl:output-character character="&#153;" string="&#x2122;"/><!-- TRADE MARK SIGN in CP1252 -->
		<xsl:output-character character="&#154;" string="&#x0161;"/><!-- LATIN SMALL LETTER S WITH CARON in CP1252 -->
		<xsl:output-character character="&#155;" string="&#x203A;"/><!-- SINGLE RIGHT-POINTING ANGLE QUOTATION MARK in CP1252 -->
		<xsl:output-character character="&#156;" string="&#x0153;"/><!-- LATIN SMALL LIGATURE OE in CP1252 -->
		<xsl:output-character character="&#157;" string="&#x02DD;"/><!-- DOUBLE ACUTE ACCENT in CP1252 -->
		<xsl:output-character character="&#158;" string="&#x017E;"/><!-- LATIN SMALL LETTER Z WITH CARON in CP1252 -->
		<xsl:output-character character="&#159;" string="&#x0178;"/><!-- LATIN CAPITAL LETTER Y WITH DIAERESIS in CP1252 -->
		<xsl:output-character character="&#127;" string=" "/>
   <xsl:output-character character="&#128;" string=" "/>
   <xsl:output-character character="&#129;" string=" "/>
   <xsl:output-character character="&#130;" string=" "/>
   <xsl:output-character character="&#131;" string=" "/>
   <xsl:output-character character="&#132;" string=" "/>
   <xsl:output-character character="&#133;" string=" "/>
   <xsl:output-character character="&#134;" string=" "/>
   <xsl:output-character character="&#135;" string=" "/>
   <xsl:output-character character="&#136;" string=" "/>
   <xsl:output-character character="&#137;" string=" "/>
   <xsl:output-character character="&#138;" string=" "/>
   <xsl:output-character character="&#139;" string=" "/>
   <xsl:output-character character="&#140;" string=" "/>
   <xsl:output-character character="&#141;" string=" "/>
   <xsl:output-character character="&#142;" string=" "/>
   <xsl:output-character character="&#143;" string=" "/>
   <xsl:output-character character="&#144;" string=" "/>
   <xsl:output-character character="&#145;" string=" "/>
   <xsl:output-character character="&#146;" string=" "/>
   <xsl:output-character character="&#147;" string=" "/>
   <xsl:output-character character="&#148;" string=" "/>
   <xsl:output-character character="&#149;" string=" "/>
   <xsl:output-character character="&#150;" string=" "/>
   <xsl:output-character character="&#151;" string=" "/>
   <xsl:output-character character="&#152;" string=" "/>
   <xsl:output-character character="&#153;" string=" "/>
   <xsl:output-character character="&#154;" string=" "/>
   <xsl:output-character character="&#155;" string=" "/>
   <xsl:output-character character="&#156;" string=" "/>
   <xsl:output-character character="&#157;" string=" "/>
   <xsl:output-character character="&#158;" string=" "/>
   <xsl:output-character character="&#159;" string=" "/>
	</xsl:character-map>


	<xsl:variable name="SelectAuthors">
		<xsl:for-each select="*/*/author">
			<xsl:element name="author">

					<xsl:value-of select="."/>

			</xsl:element>
		</xsl:for-each>
	</xsl:variable>

	<xsl:template match="/">


				<!-- Variable qui contient le nom de tous les Auteurs du Document (meme les nom qui se repete) --><!--  <xsl:variable name="SelectAuthors" select="distinct-values(/dblp/*[name()=$ELEMENTS]/author)" /> --><!-- Variable qui contient les sous balise des balise principal -->
				<xsl:variable name="CHEMIN1">
					<xsl:copy-of select="/dblp/article"/>
				</xsl:variable>
				<xsl:variable name="CHEMIN2">
					<xsl:copy-of select="/dblp/inproceedings"/>
				</xsl:variable>
				<xsl:variable name="CHEMIN3">
					<xsl:copy-of select="/dblp/proceedings"/>
				</xsl:variable>
				<xsl:variable name="CHEMIN4">
					<xsl:copy-of select="/dblp/book"/>
				</xsl:variable>
				<xsl:variable name="CHEMIN5">
					<xsl:copy-of select="/dblp/incollection"/>
				</xsl:variable>
				<xsl:variable name="CHEMIN6">
					<xsl:copy-of select="/dblp/phdthesis"/>
				</xsl:variable>
				<xsl:variable name="CHEMIN7">
					<xsl:copy-of select="/dblp/mastersthesis"/>
				</xsl:variable>
				<xsl:variable name="CHEMIN8">
					<xsl:copy-of select="/dblp/www"/>
				</xsl:variable>

				<!-- ############################ PRINCIPAL ############################ --><!-- boucle qui fait le trie et le slection des auteurs -->


					<xsl:for-each-group select="$SelectAuthors/author" group-by=".">


										<xsl:if test="position() ne 1">
										</xsl:if>



					<xsl:variable name="NameAuthor">
						<xsl:value-of select="."/>
					</xsl:variable>

					<xsl:variable name="PureNameAuthor">
      			<xsl:value-of select="replace(replace(., '[^a-zA-Z0-9 -.]', '='), ' ','_')"/>
					</xsl:variable>

					<xsl:variable name="firstLetter">
      			<xsl:value-of select="translate(substring($PureNameAuthor, 1, 1), 'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
					</xsl:variable>


					<xsl:result-document method="html" href="a-tree/{$firstLetter}/{$PureNameAuthor}.html">


					<html>
						<head>
							<title><xsl:value-of select="$NameAuthor"/></title>
						</head>
						<body>


					<!-- variable qui contient le nombre d'occurence qu'apparait le nom d'un auteur dans chaque balise principal-->
					<xsl:variable name="NbreAuteurArticle">
						<xsl:value-of select="number(count($CHEMIN1/article[author=$NameAuthor]))"/>
					</xsl:variable>
					<xsl:variable name="NbreAuteurInproceedings">
						<xsl:value-of select="number(count($CHEMIN2/inproceedings[author=$NameAuthor]))"/>
					</xsl:variable>
					<xsl:variable name="NbreAuteurProceedings">
						<xsl:value-of select="number(count($CHEMIN3/proceedings[author=$NameAuthor]))"/>
					</xsl:variable>
					<xsl:variable name="NbreAuteurBook">
						<xsl:value-of select="number(count($CHEMIN4/book[author=$NameAuthor]))"/>
					</xsl:variable>
					<xsl:variable name="NbreAuteurIncollection">
						<xsl:value-of select="number(count($CHEMIN5/incollection[author=$NameAuthor]))"/>
					</xsl:variable>
					<xsl:variable name="NbreAuteurPhdthesis">
						<xsl:value-of select="number(count($CHEMIN6/phdthesis[author=$NameAuthor]))"/>
					</xsl:variable>
					<xsl:variable name="NbreAuteurMastersthesis">
						<xsl:value-of select="number(count($CHEMIN7/mastersthesis[author=$NameAuthor]))"/>
					</xsl:variable>
					<xsl:variable name="NbreAuteurWww">
						<xsl:value-of select="number(count($CHEMIN8/www[author=$NameAuthor]))"/>
					</xsl:variable>

					<!-- affiche chaque auheur distinct (sans les doublons) , avec le nombre total d'occurence qu'il apparait dans tous le document-->
					<h1>
						<xsl:value-of select="$NameAuthor"/>  - <xsl:value-of select="$firstLetter"/> -( <xsl:value-of select="$NbreAuteurArticle + $NbreAuteurInproceedings + $NbreAuteurProceedings + $NbreAuteurBook + $NbreAuteurIncollection + $NbreAuteurPhdthesis + $NbreAuteurMastersthesis + $NbreAuteurWww"/> ) </h1><!-- pour chaque Autheur distinct, affiche la liste decrossante des date des article auquel il son nom apparait-->




					<table border="1">
						<xsl:call-template name="SelectionYear">
							<xsl:with-param name="P_NameAuthor" select="$NameAuthor"/>
							<xsl:with-param name="P_CHEMIN1" select="$CHEMIN1"/>
							<xsl:with-param name="P_CHEMIN2" select="$CHEMIN2"/>
							<xsl:with-param name="P_CHEMIN3" select="$CHEMIN3"/>
							<xsl:with-param name="P_CHEMIN4" select="$CHEMIN4"/>
							<xsl:with-param name="P_CHEMIN5" select="$CHEMIN5"/>
							<xsl:with-param name="P_CHEMIN6" select="$CHEMIN6"/>
							<xsl:with-param name="P_CHEMIN7" select="$CHEMIN7"/>
							<xsl:with-param name="P_CHEMIN8" select="$CHEMIN8"/>
						</xsl:call-template>
					</table>
					<h1> Co-author index </h1>
					<table border="1">
						<xsl:call-template name="SelectionCo_auteur">
							<xsl:with-param name="P_NameAuthor" select="$NameAuthor"/>
							<xsl:with-param name="P_CHEMIN1" select="$CHEMIN1"/>
							<xsl:with-param name="P_CHEMIN2" select="$CHEMIN2"/>
							<xsl:with-param name="P_CHEMIN3" select="$CHEMIN3"/>
							<xsl:with-param name="P_CHEMIN4" select="$CHEMIN4"/>
							<xsl:with-param name="P_CHEMIN5" select="$CHEMIN5"/>
							<xsl:with-param name="P_CHEMIN6" select="$CHEMIN6"/>
							<xsl:with-param name="P_CHEMIN7" select="$CHEMIN7"/>
							<xsl:with-param name="P_CHEMIN8" select="$CHEMIN8"/>
						</xsl:call-template>
					</table>

				</body>
			</html>

</xsl:result-document>

</xsl:for-each-group>




	</xsl:template>

	<!-- ############################ LISTE DES TEMPLATE ############################ --><!-- template pour afficher la liste des date -->

	<xsl:template name="ListeAuteurs">

		<xsl:for-each select="author">
			<xsl:element name="Author">
			 <xsl:value-of select="."/>
			</xsl:element>
		</xsl:for-each>

	</xsl:template>

	<xsl:template name="ListeCo_Auteurs">
		<tr>
			<xsl:for-each select="author">
				<xsl:sort select="." data-type="number" order="descending"/>
				<tr>
					<th colspan="3" bgcolor="#FFFFCC">
						<xsl:value-of select="."/>
					</th>
				</tr>
			</xsl:for-each>
		</tr>
	</xsl:template>

	<xsl:template name="SelectionYear">
		<xsl:param name="P_NameAuthor"/>
		<xsl:param name="P_CHEMIN1"/>
		<xsl:param name="P_CHEMIN2"/>
		<xsl:param name="P_CHEMIN3"/>
		<xsl:param name="P_CHEMIN4"/>
		<xsl:param name="P_CHEMIN5"/>
		<xsl:param name="P_CHEMIN6"/>
		<xsl:param name="P_CHEMIN7"/>
		<xsl:param name="P_CHEMIN8"/>

		<xsl:variable name="GroupeYears">

			<xsl:for-each select="$P_CHEMIN1/article[author=$P_NameAuthor]">
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

			<xsl:for-each select="$P_CHEMIN2/inproceedings[author=$P_NameAuthor]">
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

			<xsl:for-each select="$P_CHEMIN3/proceedings[author=$P_NameAuthor]">
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

			<xsl:for-each select="$P_CHEMIN4/book[author=$P_NameAuthor]">
				<xsl:element name="GroupeYear">
					<xsl:element name="year">
						<xsl:value-of select="year"/>
					</xsl:element>
					<xsl:element name="ListeCoAuteurs">
						<xsl:call-template name="ListeAuteurs"/>
					</xsl:element>
					<xsl:element name="title">
						<xsl:value-of select="title"/>
					</xsl:element>
					<xsl:element name="ee">
						<xsl:value-of select="ee"/>
					</xsl:element>
				</xsl:element>
			</xsl:for-each>

			<xsl:for-each select="$P_CHEMIN5/incollection[author=$P_NameAuthor]">
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

			<xsl:for-each select="$P_CHEMIN6/phdthesis[author=$P_NameAuthor]">
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

			<xsl:for-each select="$P_CHEMIN7/mastersthesis[author=$P_NameAuthor]">
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

			<xsl:for-each select="$P_CHEMIN8/www[author=$P_NameAuthor]">
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

		</xsl:variable>



		<xsl:for-each-group select="$GroupeYears/GroupeYear/year" group-by="replace(., '\.$', '')">
			<xsl:sort select="." data-type="number" order="descending"/>
			<xsl:variable name="Numpublishers" select="position()"/>
							<xsl:if test="position() ne 1">
	            </xsl:if>
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

														<xsl:variable name="Test"><xsl:value-of select="ee"/></xsl:variable>
														<a href="{$Test}">
														<img alt="Electronic Edition" title="Electronic Edition" src="http://www.informatik.uni-trier.de/~ley/db/ee.gif" border="0" height="16" width="16"/></a>

												</xsl:if>
											</td>
											<td>
												<xsl:for-each select="ListeCoAuteurs">
													<xsl:for-each select="Author">

														<xsl:variable name="PureNameAuthorCourant">
									      			<xsl:value-of select="replace(replace($P_NameAuthor, '[^a-zA-Z0-9 -.]', '='), ' ','_')"/>
														</xsl:variable>

														<xsl:variable name="PureNameAuthor">
									      			<xsl:value-of select="replace(replace(., '[^a-zA-Z0-9 -.]', '='), ' ','_')"/>
														</xsl:variable>

														<xsl:variable name="firstLetter">
									      			<xsl:value-of select="translate(substring($PureNameAuthor, 1, 1), 'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
														</xsl:variable>




													<xsl:choose>
<xsl:when test="$PureNameAuthorCourant != $PureNameAuthor">
	<a href="../{$firstLetter}/{$PureNameAuthor}.html"><xsl:value-of select="."/></a>,
</xsl:when>
<xsl:when test="$PureNameAuthorCourant = $PureNameAuthor">
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

	</xsl:template>

	<!--Liste co_auteur -->
	<xsl:template name="SelectionCo_auteur">
		<xsl:param name="P_NameAuthor"/>
		<xsl:param name="P_CHEMIN1"/>
		<xsl:param name="P_CHEMIN2"/>
		<xsl:param name="P_CHEMIN3"/>
		<xsl:param name="P_CHEMIN4"/>
		<xsl:param name="P_CHEMIN5"/>
		<xsl:param name="P_CHEMIN6"/>
		<xsl:param name="P_CHEMIN7"/>
		<xsl:param name="P_CHEMIN8"/>

		<xsl:variable name="Co_authors">

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
					<xsl:sort select="." data-type="text" order="ascending"/>
					<xsl:if test="not(node()= $P_NameAuthor)">
						<xsl:element name="Co_author">
							<xsl:value-of select="."/>
						</xsl:element>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$P_CHEMIN3/proceedings[author=$P_NameAuthor]">
				<xsl:for-each select="author">
					<xsl:sort select="." data-type="text" order="ascending"/>
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
					<xsl:sort select="." data-type="text" order="ascending"/>
					<xsl:if test="not(node()= $P_NameAuthor)">
						<xsl:element name="Co_author">
							<xsl:value-of select="."/>
						</xsl:element>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$P_CHEMIN6/phdthesis[author=$P_NameAuthor]">
				<xsl:for-each select="author">
					<xsl:sort select="." data-type="text" order="ascending"/>
					<xsl:if test="not(node()= $P_NameAuthor)">
						<xsl:element name="Co_author">
							<xsl:value-of select="."/>
						</xsl:element>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$P_CHEMIN7/mastersthesis[author=$P_NameAuthor]">
				<xsl:for-each select="author">
					<xsl:sort select="." data-type="text" order="ascending"/>
					<xsl:if test="not(node()= $P_NameAuthor)">
						<xsl:element name="Co_author">
							<xsl:value-of select="."/>
						</xsl:element>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$P_CHEMIN8/www[author=$P_NameAuthor]">
				<xsl:for-each select="author">
					<xsl:sort select="." data-type="text" order="ascending"/>
					<xsl:if test="not(node()= $P_NameAuthor)">
						<xsl:element name="Co_author">
							<xsl:value-of select="."/>
						</xsl:element>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:variable>


		<xsl:for-each-group select="$Co_authors/Co_author" group-by="replace(., '\.$', '')">
			<xsl:sort select="." order="ascending"/>
			<xsl:variable name="Numpublishers" select="position()"/>
							<xsl:if test="position() ne 1">
							</xsl:if>
							<xsl:variable name="IsCo_author" select="replace(., '\.$', '')"/>
							<tr>
								<td align="right">

									<xsl:variable name="PureNameAuthor">
				      			<xsl:value-of select="replace(replace(., '[^a-zA-Z0-9 -.]', '='), ' ','_')"/>
									</xsl:variable>

									<xsl:variable name="firstLetter">
				      			<xsl:value-of select="translate(substring($PureNameAuthor, 1, 1), 'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
									</xsl:variable>

								<a href="../{$firstLetter}/{$PureNameAuthor}.html"><xsl:value-of select="$IsCo_author"/> </a>
								</td>
								<td align="left"> [<a href="#p3"> X</a>] </td>
							</tr>

	</xsl:for-each-group>

	</xsl:template>
</xsl:stylesheet>
