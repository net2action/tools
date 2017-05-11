<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="/">
	<html>
	<head>
	<title>XML Access Report for: </title>
	<link rel="stylesheet" type="text/css" href="./css/xmlaccess.css" />
	</head>
	<body>
		<h1>XML Access Report for Portal generated from @file@</h1>
		<ul>
			<li><a href="#portal-themes-index">Themes</a></li>
			<li><a href="#portal-skin-index">Skins</a></li>
			<li><a href="#portal-pages-index">Portal pages</a></li>
			<li><a href="#web-app-index">Web App</a></li>	
			<li><a href="#portlets-index">Portlets</a></li>	
			<li><a href="#portlet-war">Portlet War</a></li>
			<br>Owners</br>
			<div class="owners">
            <li><a href="#pageowners">Page</a></li>
            <li><a href="#webappowners">Web App</a></li>
            <li><a href="#portletowners">Portlet</a></li>
			</div>
		</ul>
		<hr/>
		<!-- Indexes -->
		<a name="portal-themes-index" ></a>
		<xsl:call-template name="portal-themes-index"></xsl:call-template>
		<a name="portal-skin-index" ></a>
		<xsl:call-template name="portal-skin-index"></xsl:call-template>
		<a name="portal-pages-index" ></a>
		<xsl:call-template name="portal-pages-index"></xsl:call-template>
		<a name="web-app-index" ></a>
		<xsl:call-template name="web-app-index"></xsl:call-template>
		<a name="portlets-index" ></a>
		<xsl:call-template name="portlets-index"></xsl:call-template>
		<a name="portlet-war" ></a>
		<xsl:call-template name="portlet-war"></xsl:call-template>

		
		<!-- Documentation body -->		
		<xsl:call-template name="portal-skin-detail"></xsl:call-template>
		<xsl:call-template name="portal-pages-detail"></xsl:call-template>
		<a name="pageowners" ></a>
		<xsl:call-template name="page-owner"></xsl:call-template>
		<a name="webappowners" ></a>
		<xsl:call-template name="web-app-owner"></xsl:call-template>
		<a name="portletowners" ></a>
		<xsl:call-template name="portlet-owner"></xsl:call-template>		
	</body>
	</html>
</xsl:template>

<!-- 
#######################################################################
#   Themes 
#    
#######################################################################
-->
<xsl:template name="portal-themes-index">
<h2>Themes</h2>
<table>
<thead><th>uniquename</th><th>id</th><th>domain</th></thead>
<tbody>
<xsl:for-each select="//theme">
<tr>
<td><a><xsl:attribute name="href">#theme_<xsl:value-of select="@objectid"/></xsl:attribute><xsl:value-of select="@uniquename"/></a></td>
<td><a><xsl:attribute name="href">#theme_<xsl:value-of select="@objectid"/></xsl:attribute><xsl:value-of select="@objectid"/></a></td>
<td><xsl:value-of select="@domain"/></td>
</tr>
</xsl:for-each>
</tbody>
</table>
</xsl:template>

<!-- 
#######################################################################
#   Skin 
#    
#######################################################################
-->
<xsl:template name="portal-skin-index">
<h2>Skins</h2>
<table>
<thead><th>uniquename</th><th>id</th><th>domain</th></thead>
<tbody>
<xsl:for-each select="//skin">
<tr>
<td><a><xsl:attribute name="href">#skin_<xsl:value-of select="@objectid"/></xsl:attribute><xsl:value-of select="@uniquename"/></a></td>
<td><a><xsl:attribute name="href">#skin_<xsl:value-of select="@objectid"/></xsl:attribute><xsl:value-of select="@objectid"/></a></td>
<td><xsl:value-of select="@domain"/></td>
</tr>
</xsl:for-each>
</tbody>
</table>
</xsl:template>

<xsl:template name="portal-skin-detail">
	<h1>Skins</h1>
	<xsl:for-each select="//skin">
		<a><xsl:attribute name="name">skin_<xsl:value-of select="@objectid"/></xsl:attribute></a>
		<div class="contentnode">
		<h2><xsl:value-of select="@objectid"/> / <xsl:value-of select="@uniquename"/></h2>
		<div class="subsection">
			<h3>ACLs</h3>
			<xsl:apply-templates select="access-control" ></xsl:apply-templates>
		</div>
		</div>
	</xsl:for-each>
</xsl:template>

<!-- 
#######################################################################
#   Pages 
#    
#######################################################################
-->
<xsl:template name="portal-pages-index">
<h2>Content Node</h2>
<table>
<thead><th>title (en)</th><th>uniquename</th><th>id</th><th>type</th></thead>
<tbody>
  <xsl:for-each select="//content-node">
  <tr>
 		<td><xsl:call-template name="componentTitle"  /></td>
<td><a><xsl:attribute name="href">#contentnode_<xsl:value-of select="@objectid"/></xsl:attribute><xsl:value-of select="@uniquename"/></a></td>
<td><a><xsl:attribute name="href">#contentnode_<xsl:value-of select="@objectid"/></xsl:attribute><xsl:value-of select="@objectid"/></a></td>
<td><xsl:value-of select="@type"/></td>
</tr>
</xsl:for-each>
</tbody>
</table>
</xsl:template>

<xsl:template name="portal-pages-detail">
	<h1>Content nodes</h1>
	<xsl:for-each select="//content-node">
		<a><xsl:attribute name="name">contentnode_<xsl:value-of select="@objectid"/></xsl:attribute></a>
		<div class="contentnode">
		<h2>
		<xsl:call-template name="componentTitle"  /> /<xsl:value-of select="@objectid"/> / <xsl:value-of select="@uniquename"/></h2>
		<div class="subsection">
			<h3>ACLs</h3>
			<xsl:apply-templates select="access-control"></xsl:apply-templates>
		</div>
		<div class="subsectionPortletPage">
		    <h3>Portlets in Page</h3>
		    <xsl:apply-templates select="component"></xsl:apply-templates>
		</div>
		</div>
		<a href="javascript:history.back(-1)">Go Back</a>
	</xsl:for-each>
</xsl:template>


<!-- 
#######################################################################
#  Get title for any component 
#    
#######################################################################
-->

<xsl:template name="componentTitle" >
	<xsl:if test="localedata[@locale='it']/title[text()]">
		<xsl:value-of select="localedata[@locale='it']/title/text()" />
	</xsl:if>
	<xsl:if test="localedata[@locale='it']/title[not(text())]">
		<xsl:value-of select="localedata[@locale='en']/title/text()" /> 
	</xsl:if>
</xsl:template>

<!-- 
#######################################################################
#   Web-App 
#    
#######################################################################
-->
<xsl:template name="web-app-index">
<h2>web-app</h2>
<xsl:for-each select="//web-app">
<div class="subsectionWebApp" >
	<h3><xsl:value-of select="display-name"/> / <xsl:value-of select="@objectid"/></h3>
	<div >
			<h3>WebApp ACL</h3>
			<xsl:apply-templates select="access-control"></xsl:apply-templates>
	</div>
	<div class="subsectionPortletApp">
			<h3>Portlet apps</h3>
			<xsl:apply-templates select="portlet-app"></xsl:apply-templates>
	</div>
</div>
</xsl:for-each>
</xsl:template>


<!--
#######################################################################
#   Page Owners
#    
#######################################################################
-->

<xsl:template name="page-owner">
<h2>Page Owners</h2>
<table>
<thead><th>uniquename</th><th>Owner</th></thead>
<tbody>
  <xsl:for-each select="//content-node">
  <tr>
  <td><xsl:value-of select="@objectid"/></td>
  <td><xsl:call-template name="componentTitle"  /></td>

<td><xsl:value-of select="./access-control/@owner"/></td>
</tr>
</xsl:for-each>
</tbody>
</table>
</xsl:template>

<!--
#######################################################################
#   Web-App Owners
#    
#######################################################################
-->

<xsl:template name="web-app-owner">
<h2>WebApp Owners</h2>
<table>
<thead><th>uniquename</th><th>Owner</th></thead>
<tbody>
  <xsl:for-each select="//web-app">
  <tr>
<td><xsl:value-of select="display-name"/></td>
<td><xsl:value-of select="./access-control/@owner"/></td>
</tr>
</xsl:for-each>
</tbody>
</table>
</xsl:template>

<!--
#######################################################################
#   Portlet Owners
#    
#######################################################################
-->

<xsl:template name="portlet-owner">
<h2>Portelt Owners</h2>
<table>
<thead><th>uniquename</th><th>Owner</th></thead>
<tbody>
  <xsl:for-each select="//portlet">
  <tr>
<td><xsl:value-of select="@name"/></td>
<td><xsl:value-of select="./access-control/@owner"/></td>
</tr>
</xsl:for-each>
</tbody>
</table>
</xsl:template>


<!-- 
#######################################################################
#   portlet-war
#    
#######################################################################
-->

<xsl:template name="portlet-war">
<h2>portlet-war</h2>
<div class="subsection" >
   <table width="100%">
		<thead>
		<th>Portlet</th>
		<th>WarFile</th>
		</thead>
		<tbody>
		<xsl:for-each select="//web-app">
      	<tr>
			<td>
				<xsl:value-of select="display-name"/> 
			</td>	
	        <td>
	        	<xsl:value-of select="url"/>
	        </td>
	    </tr> 
	    </xsl:for-each>   
		</tbody>
	</table>
	</div>

</xsl:template>



<!-- 
#######################################################################
#   Portelt App 
#    
#######################################################################
-->

<xsl:template match="portlet-app">
		<a><xsl:attribute name="name">portlet-app_<xsl:value-of select="@objectid"/></xsl:attribute></a>
		<div class="portlet-app">
		<h4><xsl:value-of select="@name"/> / <xsl:value-of select="@objectid"/></h4>
		<div class="subsection">
			<h4>Portlet App ACL</h4>
			<xsl:apply-templates select="access-control"></xsl:apply-templates>
		</div>
		<div class="subsectionPortlet">
			<h4>Portlets in this app</h4>
			<xsl:apply-templates select="portlet"></xsl:apply-templates>
		</div>
		</div>
</xsl:template>

<!-- 
#######################################################################
#   Portlet dettails
#    
#######################################################################
-->
<xsl:template match="portlet">
		<a><xsl:attribute name="name">portlet_<xsl:value-of select="@objectid"/></xsl:attribute></a>
		<div class="portlet">
		<h4><xsl:call-template name="componentTitle"/> / <xsl:value-of select="@name"/> / <xsl:value-of select="@objectid"/></h4>
		<div class="subsection">
			<h5>Portlet ACL</h5>
			<xsl:apply-templates select="access-control"></xsl:apply-templates>
		</div>
		
		</div>
		<a href="javascript:history.back(-1)">Go Back</a>
</xsl:template>

<!-- 
#######################################################################
#   Web-App dettails
#    
#######################################################################
-->
<xsl:template name="web-app-detail">
	<h1>Web App</h1>
	<xsl:for-each select="//web-app">
		<a><xsl:attribute name="name">web-app_<xsl:value-of select="@objectid"/></xsl:attribute></a>
		<div class="webapp">
		<h2><xsl:value-of select="@objectid"/> / <xsl:value-of select="@uniquename"/></h2>
		<div class="subsection">
			<h3>ACLs</h3>
			<xsl:apply-templates select="access-control"></xsl:apply-templates>
		</div>
		</div>
	</xsl:for-each>
</xsl:template>


<!-- 
#######################################################################
#   Portlets Index
#    
#######################################################################
-->
<xsl:template name="portlets-index">
<h2>Portlets</h2>
<table>
<thead><th>name</th><th>id</th><th>domain</th></thead>
<tbody>
<xsl:for-each select="//portlet">
<tr>
<td><a><xsl:attribute name="href">#portlet_<xsl:value-of select="@objectid"/></xsl:attribute><xsl:value-of select="@name"/></a></td>
<td><a><xsl:attribute name="href">#portlet_<xsl:value-of select="@objectid"/></xsl:attribute><xsl:value-of select="@objectid"/></a></td>
<td><xsl:value-of select="@domain"/></td>
</tr>
</xsl:for-each>
</tbody>
</table>
</xsl:template>

<!-- 
#######################################################################
#   ACL
#    
#######################################################################
-->

<xsl:template match="access-control">
	<div style="border: 1px dashed red;" >
		<div class="itemAttribute"><span class="attributeLabel">Owner </span><xsl:value-of select="@owner"/></div>
		<div class="itemAttribute"><span class="attributeLabel">Private </span><xsl:value-of select="@private"/></div>
		<div class="itemAttribute"><span class="attributeLabel">Externalized </span><xsl:value-of select="@externalized"/></div>
	</div>
	
	<table width="100%">
		<thead>
		<th>Role</th>
		<th>Type</th>
		<th>Id</th>
		<th>Action</th>
		</thead>
		<tbody>
			<xsl:for-each select="role">

				<xsl:variable name="lastrole" select="@actionset" /> 
					<xsl:for-each select="mapping">
						<tr>
						<td><xsl:value-of select="$lastrole"/></td>
						<td><xsl:value-of select="@subjecttype"/></td>
						<td><xsl:value-of select="@subjectid"/></td>
						<td><xsl:value-of select="@update"/></td>
						</tr>
					</xsl:for-each>
			</xsl:for-each>
			</tbody>
		</table>

</xsl:template>


<!-- 
#######################################################################
#   Portlets per Page
#    
#######################################################################
-->
<xsl:template match="component">
 
<div style="border: 1px dashed blue;" >
	<table width="100%">
		<thead>
		<th>Portlet ID</th>
		<th>Portlet name</th>
		</thead>
		<tbody>
        	<xsl:for-each select=".//portletinstance">
           		<xsl:variable name="porteltId" select="@portletref" />
           		<tr>
           		
           			<td><a><xsl:attribute name="href">#portlet_<xsl:value-of select="@portletref"/></xsl:attribute><xsl:value-of select="@portletref"/></a></td>
		 			<xsl:for-each select="//portlet[@objectid=$porteltId]">
			   			<td>
			   			   	<xsl:value-of select="@name"/>
			   			</td>
					</xsl:for-each>
			   	</tr>
		 	</xsl:for-each>
        </tbody>
	</table>
</div>
</xsl:template>


<xsl:template match="*">
</xsl:template>

</xsl:stylesheet>
