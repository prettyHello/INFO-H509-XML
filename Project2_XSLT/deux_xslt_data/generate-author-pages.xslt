<?xml version="1.0" encoding="UTF-8" ?>

<!-- New XSLT document created with EditiX XML Editor (http://www.editix.com) at Wed Apr 03 12:14:08 CEST 2019 -->

<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
	xmlns:err="http://www.w3.org/2005/xqt-errors"
	exclude-result-prefixes="xs xdt err fn">

	<xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="/">
		
		<html>
			<head>
				<title>Mon répertoire téléphonique</title>
				<link type="text/css" rel="stylesheet" href="style.css"/>
			</head>
			<body>
				<xsl:for-each select="repertoire/personne">
					<p>
						<xsl:value-of select="nom"/>
					</p>
				</xsl:for-each>
			</body>
		</html>k
	</xsl:template>

</xsl:stylesheet>
