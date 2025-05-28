<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">

    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <!-- ================== -->
    <!-- Template Principal -->
    <!-- ================== -->
    <xsl:template match="/">
        <!-- Préambule LaTeX -->
        <xsl:text>\documentclass[11pt, a4paper]{book}
</xsl:text>
        <xsl:text>\usepackage[utf8]{inputenc}
</xsl:text>
        <xsl:text>\usepackage[T1]{fontenc}
</xsl:text>
        <xsl:text>\usepackage{lmodern}
</xsl:text>
        <xsl:text>\usepackage[francais]{babel}
</xsl:text>
        <xsl:text>\usepackage[svgnames]{xcolor}
</xsl:text>
        <xsl:text>\usepackage{ulem} \normalem 
</xsl:text>
        <xsl:text>\usepackage[colorlinks=true, linkcolor=Firebrick, urlcolor=Navy]{hyperref}
</xsl:text>
        <xsl:text>\usepackage{lettrine}
</xsl:text>
        <xsl:text>\usepackage{microtype}
</xsl:text>
        <xsl:text>\usepackage{setspace}
\onehalfspacing
</xsl:text>
        <xsl:text>\usepackage[a4paper, left=3cm, right=3cm, top=3cm, bottom=3cm]{geometry}
</xsl:text>
        <xsl:text>\usepackage{graphicx}
</xsl:text>
        <xsl:text>\usepackage{csquotes}
</xsl:text> <!-- INDISPENSABLE pour \enquote -->
        <xsl:text>\usepackage{verse}
</xsl:text>

        <!-- Définition des couleurs (basé sur CSS) -->
        <xsl:text>\definecolor{persNameColor}{named}{Navy}
</xsl:text>
        <xsl:text>\definecolor{placeNameColor}{named}{Firebrick}
</xsl:text>
        <xsl:text>\definecolor{rubricColor}{named}{DarkRed}
</xsl:text>
        <xsl:text>\definecolor{suppliedColor}{named}{DarkGreen}
</xsl:text>
        <xsl:text>\definecolor{delColor}{named}{Red}
</xsl:text>
        <xsl:text>\definecolor{noteTravailColor}{named}{Orange}
</xsl:text>
        <xsl:text>\definecolor{acertainLowColor}{named}{Red}
</xsl:text>
        <xsl:text>\definecolor{acertainMediumColor}{named}{Orange}
</xsl:text>

        <!-- Commandes LaTeX personnalisées pour le style -->
        <xsl:text>\newcommand{\persName}[1]{{\textcolor{persNameColor}{#1}}}
</xsl:text>
        <xsl:text>\newcommand{\placeName}[1]{{\textcolor{placeNameColor}{#1}}}
</xsl:text>
        <xsl:text>\newcommand{\rubric}[1]{{\textcolor{rubricColor}{\large\textbf{#1}}}}
</xsl:text>
        <xsl:text>\newcommand{\supplied}[1]{{\textcolor{suppliedColor}{\ensuremath{\langle}#1\ensuremath{\rangle}}}} % Ajout editeur --> </xsl:text>
        <xsl:text>\newcommand{\add}[1]{{\textcolor{suppliedColor}{\ensuremath{\lceil}#1\ensuremath{\rceil}}}} % Ajout scribe --> </xsl:text>
        <xsl:text>\newcommand{\del}[1]{{\textcolor{delColor}{\sout{#1}}}} % Suppression scribe --> </xsl:text>
        <xsl:text>\newcommand{\surplus}[1]{{\textcolor{delColor}{\{#1\}}}} % Suppression editeur --> </xsl:text>
        <xsl:text>\newcommand{\gapmark}{{\textbf{[...]}}} % Gap --> </xsl:text>
        <xsl:text>\newcommand{\num}[1]{\textsc{#1}} % Numeros --> </xsl:text>
        <xsl:text>\newcommand{\exp}[1]{\textsuperscript{#1}} % Exposant --> </xsl:text>
        <xsl:text>\newcommand{\unclearlow}[1]{{\textcolor{acertainLowColor}{\textit{[#1?]}}}}
</xsl:text>
        <xsl:text>\newcommand{\unclearmedium}[1]{{\textcolor{acertainMediumColor}{\textit{[#1?]}}}}
</xsl:text>
        <xsl:text>\newcommand{\unclearuncertain}[1]{{\textit{[#1?]}}} % Incertain (non low/medium) --> </xsl:text>
        
        <!-- Titre, Auteur -->
        <xsl:text>\title{Li histoire de Kanor et de ses freres}
</xsl:text>
        <xsl:text>\author{Anonyme (Manuscrit BnF fr. 1446)}
</xsl:text>
        <xsl:text>\date{} % Pas de date affichée 
</xsl:text>

        <!-- Début du document LaTeX -->
        <xsl:text>\begin{document}
</xsl:text>
        <xsl:text>\maketitle
</xsl:text>
        <!-- \tableofcontents % Optionnel -->

        <!-- Appliquer les templates au corps du texte TEI -->
        <xsl:apply-templates select="//body"/>

        <!-- Fin du document LaTeX -->
        <xsl:text>\end{document}
</xsl:text>
    </xsl:template>

    <!-- ====================== -->
    <!-- Templates Utilitaires -->
    <!-- ====================== -->

    <xsl:template name="escape-latex">
        <xsl:param name="text"/>
        <xsl:variable name="s0" select="replace($text, '\\', '\\textbackslash ')"/>
        <xsl:variable name="s1" select="replace($s0, '([{}_#%&$])', '\\$1')"/>
        <xsl:variable name="s2" select="replace($s1, '\^', '\\^{}')"/>
        <xsl:variable name="s3" select="replace($s2, '~', '\\~{}')"/>
        <xsl:variable name="s4" select="replace($s3, '<', '$<$')"/>
        <xsl:variable name="s5" select="replace($s4, '>', '$>$')"/>
        <xsl:value-of select="$s5"/>
    </xsl:template>

    <xsl:template match="text()">
       <xsl:call-template name="escape-latex">
          <xsl:with-param name="text" select="."/>
       </xsl:call-template>
    </xsl:template>

    <!-- ========================== -->
    <!-- Templates pour TEI Header -->
    <!-- ========================== -->
    <xsl:template match="teiHeader"/>

    <!-- ========================== -->
    <!-- Templates pour TEI Body -->
    <!-- ========================== -->

    <xsl:template match="body">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="div">
        <xsl:choose>
            <xsl:when test="@type = 'chapter'">
                <xsl:text>
\chapter*{Chapitre </xsl:text>
                <xsl:value-of select="substring-after(@n, 'C')"/>
                <xsl:text>}
</xsl:text>
                <xsl:text>\label{chap:</xsl:text>
                <xsl:value-of select="substring-after(@n, 'C')"/>
                <xsl:text>}
</xsl:text>
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="@type = 'sup_paragraphe'">
                 <xsl:apply-templates/>
                 <xsl:text>
</xsl:text>
            </xsl:when>
             <xsl:otherwise>
                 <xsl:apply-templates/>
             </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="head[@type='rubrique']">
        <xsl:text>
{\rubric{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}}
\medskip
</xsl:text>
    </xsl:template>

    <xsl:template match="p">
        <xsl:text>\noindent
</xsl:text>
        <xsl:text>\hypertarget{P</xsl:text>
        <xsl:value-of select="substring-after(@n, 'P')"/>
        <xsl:text>}{}\textbf{§</xsl:text>
        <xsl:value-of select="substring-after(@n, 'P')"/>
        <xsl:text>.} </xsl:text>
        <xsl:apply-templates/>
        <xsl:text>
\par
</xsl:text>
    </xsl:template>

    <xsl:template match="pb">
        <xsl:text>\footnote{Folio \textbf{</xsl:text>
        <xsl:value-of select="@n"/>
        <xsl:text>}</xsl:text>
        <xsl:if test="@facs">
            <xsl:text> (\url{</xsl:text>
            <xsl:value-of select="@facs"/>
            <xsl:text>})</xsl:text>
        </xsl:if>
        <xsl:text>.</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="cb">
        <xsl:text>\footnote{Colonne \textbf{</xsl:text>
        <xsl:value-of select="@n"/>
        <xsl:text>}}</xsl:text>
    </xsl:template>

    <xsl:template match="num">
        <xsl:text>\num{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="hi">
        <xsl:choose>
            <xsl:when test="starts-with(@rend, 'rubricated')">
                <xsl:text>{\rubric{</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>}}</xsl:text>
            </xsl:when>
            <xsl:when test="@rend = 'exp'">
                <xsl:text>\exp{</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:when test="@rend = 'italic'">
                <xsl:text>\textit{</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:when test="starts-with(@rend, 'decorated-initial')">
                  <xsl:variable name="firstLetter" select="substring(., 1, 1)"/>
                  <xsl:variable name="restOfText">
                      <xsl:apply-templates select="substring(., 2)"/>
                  </xsl:variable>
                  <xsl:variable name="lines" select="tokenize(@rend, '\s+')[2]"/>
                  <xsl:text>
\lettrine[lines=</xsl:text>
                  <xsl:value-of select="$lines"/>
                  <xsl:text>]{</xsl:text>
                  <xsl:call-template name="escape-latex">
                     <xsl:with-param name="text" select="upper-case($firstLetter)"/>
                  </xsl:call-template>
                  <xsl:text>}{</xsl:text>
                  <xsl:call-template name="escape-latex">
                     <xsl:with-param name="text" select="$restOfText"/>
                  </xsl:call-template>
                  <xsl:text>}</xsl:text>
             </xsl:when>
             <xsl:otherwise>
                  <xsl:apply-templates/>
             </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="title">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <!-- ***** NOUVEAU TEMPLATE POUR <said> ***** -->
    <xsl:template match="said">
        <xsl:choose>
            <!-- Discours direct rapporté -->
            <xsl:when test="@direct = 'true' and @aloud = 'true'">
                <xsl:choose>
                     <!-- Style enchâssé: guillemets différents ? Utilisons \enquote* -->
                     <xsl:when test="@style = 'embedded'">
                          <xsl:text>\enquote*{</xsl:text>
                          <xsl:apply-templates/>
                          <xsl:text>}</xsl:text>
                     </xsl:when>
                     <!-- Style "nogap": traitons comme standard pour l'instant -->
                     <xsl:when test="@style = 'nogap'">
                          <xsl:text>\enquote{</xsl:text>
                          <xsl:apply-templates/>
                          <xsl:text>}</xsl:text>
                     </xsl:when>
                     <!-- Tous les autres discours directs et à voix haute -->
                     <xsl:otherwise>
                          <xsl:text>\enquote{</xsl:text>
                          <xsl:apply-templates/>
                          <xsl:text>}</xsl:text>
                     </xsl:otherwise>
                </xsl:choose>
                <!-- Ajout potentiel de l'incise (simplifié ici, juste un espace) -->
                <xsl:if test="following-sibling::text()[1][starts-with(normalize-space(.), ', dit')] or following-sibling::text()[1][starts-with(normalize-space(.), ', fait')]">
                    <xsl:text> </xsl:text>
                </xsl:if>
            </xsl:when>

            <!-- Discours indirect, pensées, etc. -->
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- ***** FIN DU NOUVEAU TEMPLATE POUR <said> ***** -->

    <xsl:key name="person-by-id" match="person" use="@xml:id"/>
    <xsl:key name="place-by-id" match="place" use="@xml:id"/>

    <xsl:template match="persName">
        <xsl:text>\persName{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
        <xsl:if test="@key">
            <xsl:variable name="personInfo">
                <xsl:for-each select="key('person-by-id', @key)">
                     <xsl:value-of select="normalize-space(persName)"/>
                     <xsl:text>: </xsl:text>
                     <xsl:for-each select="occupation">
                         <xsl:value-of select="normalize-space(.)"/>; </xsl:for-each>
                     <xsl:for-each select="note[@type='relationships']">
                        <xsl:text> Relations: </xsl:text>
                         <xsl:value-of select="normalize-space(.)"/>; </xsl:for-each>
                     <xsl:for-each select="event">
                        <xsl:text> Événement: </xsl:text>
                         <xsl:value-of select="normalize-space(p)"/>; </xsl:for-each>
                      <xsl:for-each select="note[not(@type='relationships')]">
                          <xsl:text> Note: </xsl:text>
                          <xsl:value-of select="normalize-space(.)"/>; </xsl:for-each>
                </xsl:for-each>
            </xsl:variable>
            <xsl:if test="normalize-space($personInfo) != ''">
                <xsl:text>\footnote{</xsl:text>
                <xsl:call-template name="escape-latex">
                   <xsl:with-param name="text" select="$personInfo"/>
                </xsl:call-template>
                <xsl:text>}</xsl:text>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="placeName">
        <xsl:text>\placeName{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
         <xsl:if test="@key">
            <xsl:variable name="placeInfo">
                <xsl:for-each select="key('place-by-id', @key)">
                     <xsl:value-of select="normalize-space(placeName)"/>
                     <xsl:for-each select="note">
                        <xsl:text>; </xsl:text><xsl:value-of select="normalize-space(.)"/>
                     </xsl:for-each>
                </xsl:for-each>
            </xsl:variable>
             <xsl:if test="normalize-space($placeInfo) != ''">
                <xsl:text>\footnote{</xsl:text>
                <xsl:call-template name="escape-latex">
                   <xsl:with-param name="text" select="$placeInfo"/>
                </xsl:call-template>
                <xsl:text>}</xsl:text>
             </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="name">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
        <xsl:if test="@ref">
            <xsl:text>\footnote{Réf: </xsl:text>
            <xsl:call-template name="escape-latex">
               <xsl:with-param name="text" select="@ref"/>
            </xsl:call-template>
            <xsl:text>}</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="add">
        <xsl:text>\add{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
        <xsl:if test="@place or @hand">
           <xsl:text>\footnote{Ajout</xsl:text>
           <xsl:if test="@place"> (<xsl:value-of select="@place"/>)</xsl:if>
           <xsl:if test="@hand"> par <xsl:value-of select="substring-after(@hand, '#')"/></xsl:if>
           <xsl:text>.</xsl:text>
           <xsl:text>}</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="del">
        <xsl:text>\del{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
         <xsl:if test="@type or @hand">
           <xsl:text>\footnote{Suppression</xsl:text>
           <xsl:if test="@type"> (<xsl:value-of select="@type"/>)</xsl:if>
           <xsl:if test="@hand"> par <xsl:value-of select="substring-after(@hand, '#')"/></xsl:if>
           <xsl:text>.</xsl:text>
           <xsl:text>}</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="supplied">
        <xsl:text>\supplied{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
        <xsl:if test="@reason or @resp or @source">
            <xsl:text>\footnote{Suppléé</xsl:text>
            <xsl:if test="@reason"> (Raison: <xsl:value-of select="@reason"/>)</xsl:if>
            <xsl:if test="@resp"> par <xsl:value-of select="substring-after(@resp, '#')"/></xsl:if>
            <xsl:if test="@source"> depuis <xsl:value-of select="substring-after(@source, '#')"/></xsl:if>
            <xsl:text>.</xsl:text>
            <xsl:text>}</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="surplus">
         <xsl:text>\surplus{</xsl:text>
         <xsl:apply-templates/>
         <xsl:text>}</xsl:text>
          <xsl:if test="@reason or @resp">
            <xsl:text>\footnote{Superflu</xsl:text>
            <xsl:if test="@reason"> (Raison: <xsl:value-of select="@reason"/>)</xsl:if>
            <xsl:if test="@resp"> selon <xsl:value-of select="substring-after(@resp, '#')"/></xsl:if>
            <xsl:text>.</xsl:text>
            <xsl:text>}</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="unclear">
        <xsl:choose>
             <xsl:when test="@reason = 'acertain' and @cert = 'low'">
                 <xsl:text>\unclearlow{</xsl:text>
                 <xsl:apply-templates/>
                 <xsl:text>}</xsl:text>
             </xsl:when>
             <xsl:when test="@reason = 'acertain' and @cert = 'medium'">
                 <xsl:text>\unclearmedium{</xsl:text>
                 <xsl:apply-templates/>
                 <xsl:text>}</xsl:text>
             </xsl:when>
            <xsl:otherwise>
                <xsl:text>\unclearuncertain{</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>}</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
         <xsl:if test="@reason or @agent">
           <xsl:text>\footnote{Illisible</xsl:text>
           <xsl:if test="@reason"> (Raison: <xsl:value-of select="@reason"/>)</xsl:if>
           <xsl:if test="@agent"> (Agent: <xsl:value-of select="@agent"/>)</xsl:if>
           <xsl:text>.</xsl:text>
           <xsl:text>}</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="gap">
        <xsl:text>\gapmark{}</xsl:text>
         <xsl:if test="@reason or @extent">
           <xsl:text>\footnote{Lacune</xsl:text>
           <xsl:if test="@reason"> (Raison: <xsl:value-of select="@reason"/>)</xsl:if>
           <xsl:if test="@extent"> (Étendue: <xsl:value-of select="@extent"/>)</xsl:if>
           <xsl:text>.</xsl:text>
           <xsl:text>}</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="choice">
        <xsl:choose>
            <xsl:when test="reg">
                <xsl:apply-templates select="reg"/>
                <xsl:if test="orig">
                    <xsl:text>\footnote{Ms: </xsl:text>
                    <xsl:call-template name="escape-latex">
                        <xsl:with-param name="text">
                           <xsl:apply-templates select="orig"/>
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:text>}</xsl:text>
                </xsl:if>
            </xsl:when>
            <xsl:when test="corr">
                 <xsl:apply-templates select="corr"/>
                 <xsl:if test="sic">
                    <xsl:text>\footnote{Ms: </xsl:text>
                    <xsl:call-template name="escape-latex">
                        <xsl:with-param name="text">
                           <xsl:apply-templates select="sic"/>
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:text>}</xsl:text>
                 </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="orig | sic"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="reg | orig | corr | sic">
        <xsl:apply-templates/>
    </xsl:template>

     <xsl:template match="seg">
         <xsl:choose>
             <xsl:when test="@ana = 'lettre'">
                  <xsl:text>\enquote*{</xsl:text>
                  <xsl:apply-templates/>
                  <xsl:text>}</xsl:text>
             </xsl:when>
             <xsl:when test="@ana = 'chanson'">
                 <xsl:text>\begin{verse}
</xsl:text>
                     <xsl:apply-templates/>
                 <xsl:text>\end{verse}
</xsl:text>
             </xsl:when>
             <xsl:when test="@ana = 'proverbe'">
                  <xsl:text>‘</xsl:text>
                  <xsl:apply-templates/>
                  <xsl:text>’</xsl:text>
             </xsl:when>
             <xsl:when test="@ana = 'divergences'">
                  <xsl:text>\textit{[Divergence: </xsl:text>
                  <xsl:apply-templates/>
                  <xsl:text>]}</xsl:text>
             </xsl:when>
             <xsl:otherwise>
                  <xsl:apply-templates/>
             </xsl:otherwise>
         </xsl:choose>
     </xsl:template>
     
    <xsl:template match="lg">
         <xsl:apply-templates/>
         <xsl:text>\\</xsl:text>
    </xsl:template>

    <xsl:template match="l">
        <xsl:apply-templates/>
        <xsl:text>\\*
</xsl:text>
    </xsl:template>

    <xsl:template match="note">
        <xsl:text>\footnote{</xsl:text>
        <xsl:if test="@type">
            <xsl:text>\textit{[</xsl:text>
            <xsl:value-of select="@type"/>
            <xsl:text>]~}</xsl:text>
        </xsl:if>
        <xsl:variable name="noteContent">
             <xsl:apply-templates/>
        </xsl:variable>
        <xsl:call-template name="escape-latex">
             <xsl:with-param name="text" select="$noteContent"/>
        </xsl:call-template>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="ref">
         <xsl:if test="@target">
             <xsl:text>\href{</xsl:text>
             <xsl:value-of select="@target"/>
             <xsl:text>}{</xsl:text>
                 <xsl:apply-templates/>
             <xsl:text>}</xsl:text>
         </xsl:if>
         <xsl:if test="not(@target)">
             <xsl:apply-templates/>
         </xsl:if>
    </xsl:template>

    <xsl:template match="processing-instruction('oxy_comment_start')"/>
    <xsl:template match="processing-instruction('oxy_comment_end')"/>

    <xsl:template match="*"/> <!-- Ignorer les éléments non traités -->

</xsl:stylesheet>