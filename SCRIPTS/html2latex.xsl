<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" encoding="UTF-8" indent="no"/>
    <xsl:strip-space elements="*"/>

    <!-- Variables globales -->
    <xsl:variable name="latexNewline" select="'
'"/> <!-- Caractère de nouvelle ligne LaTeX -->

    <!-- === Fonctions d'échappement LaTeX === -->
    <xsl:template name="escape-latex">
        <xsl:param name="text"/>
        <xsl:variable name="text1" select="translate($text, '\', '\\textbackslash{}')"/>
        <xsl:variable name="text2" select="translate($text1, '{', '\\{')"/>
        <xsl:variable name="text3" select="translate($text2, '}', '\\}')"/>
        <xsl:variable name="text4" select="translate($text3, '_', '\\_')"/>
        <xsl:variable name="text5" select="translate($text4, '^', '\\^{}')"/>
        <xsl:variable name="text6" select="translate($text5, '%', '\\%')"/>
        <xsl:variable name="text7" select="translate($text6, '#', '\\#')"/>
        <xsl:variable name="text8" select="translate($text7, '$', '\\$')"/>
        <xsl:variable name="text10" select="translate($text9, '~', '\\textasciitilde{}')"/>
        <!-- Ajouter d'autres échappements si nécessaire -->
        <xsl:value-of select="$text10"/>
    </xsl:template>

    <!-- === Racine du document === -->
    <xsl:template match="/">
        <xsl:text>\documentclass[12pt, a4paper]{article}</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\usepackage[utf8]{inputenc}</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\usepackage[T1]{fontenc}</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\usepackage[french]{babel}</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\usepackage{lettrine} % Pour les lettrines</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\usepackage{graphicx} % Si besoin d'images (ici non utilisé)</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\usepackage{marginnote} % Pour les folios en marge</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\usepackage{geometry}</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\geometry{left=2.5cm, right=4cm, top=2.5cm, bottom=2.5cm, marginparwidth=2.5cm}</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\usepackage{setspace}</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\onehalfspacing</xsl:text><xsl:value-of select="$latexNewline"/>

        <xsl:text>% Commandes personnalisées pour les entités nommées</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\newcommand{\persName}[1]{\textit{#1}}</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\newcommand{\placeName}[1]{\textit{#1}}</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\newcommand{\folio}[1]{\marginnote{\small\texttt{[#1]}}}</xsl:text><xsl:value-of select="$latexNewline"/>

        <xsl:text>\title{</xsl:text>
            <xsl:call-template name="escape-latex">
                 <xsl:with-param name="text" select="normalize-space(//span[@class='title'])"/>
            </xsl:call-template>
        <xsl:text>}</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\author{} % Mettre un auteur si nécessaire</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\date{} % Supprime la date</xsl:text><xsl:value-of select="$latexNewline"/>

        <xsl:text>\begin{document}</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\maketitle</xsl:text><xsl:value-of select="$latexNewline"/>
        <xsl:text>\pagestyle{headings}</xsl:text><xsl:value-of select="$latexNewline"/>

        <!-- Traitement du corps du HTML -->
        <xsl:apply-templates select="//body"/>

        <xsl:text>\end{document}</xsl:text><xsl:value-of select="$latexNewline"/>
    </xsl:template>

    <!-- === Traitement du corps === -->
    <xsl:template match="body">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Ignorer head et ses contenus -->
    <xsl:template match="head"/>

    <!-- Ignorer les éléments non essentiels -->
    <xsl:template match="span[@class='tooltip-content'] | span[@class='note'] | span[@class='ntravail'] | svg | br/@* | p/@* | span/@* | i/@* | b/@* | div/@* | a | a/@*"/>

    <!-- === Folios/Pagination === -->
    <xsl:template match="span[@class='pbfloat' or @class='cbfloat']">
        <xsl:variable name="folio_id" select="following-sibling::sup[1]/span[1]/@id"/>
        <xsl:text>\folio{</xsl:text>
        <xsl:value-of select="$folio_id"/>
        <xsl:text>}</xsl:text>
        <!-- Ne pas ajouter d'espace après la note de marge pour ne pas perturber le flux du texte -->
    </xsl:template>
    <!-- Ignorer la partie sup/span des folios car traitée ci-dessus -->
    <xsl:template match="sup[span[@class='pb' or @class='cb']]"/>

    <!-- === Chapitres === -->
    <xsl:template match="p[span/@class='headNum']">
         <xsl:variable name="chap_num_raw" select="normalize-space(span[@class='headNum'])"/>
         <xsl:variable name="chap_num" select="translate($chap_num_raw, '[]', '')"/>
        <xsl:value-of select="$latexNewline"/>
        <xsl:text>\section*{Chapitre </xsl:text>
        <xsl:value-of select="$chap_num"/>
        <xsl:text>}</xsl:text>
        <xsl:value-of select="$latexNewline"/>
        <xsl:apply-templates select="*[not(self::span[@class='headNum'])] | text()"/>
        <xsl:value-of select="$latexNewline"/>
    </xsl:template>

    <!-- === Rubriques === -->
    <xsl:template match="span[@class='rubricated']">
         <xsl:text>\textit{</xsl:text>
         <xsl:apply-templates/>
         <xsl:text>}</xsl:text>
         <xsl:value-of select="$latexNewline"/>
         <xsl:text>\par</xsl:text> <!-- Assure un nouveau paragraphe après la rubrique -->
         <xsl:value-of select="$latexNewline"/>
    </xsl:template>

    <!-- === Paragraphes numérotés === -->
    <!-- Cible le <p> interne qui contient le numéro et le texte -->
    <xsl:template match="p[@style='display:inline;']">
         <xsl:variable name="para_num" select="normalize-space(span/b/span[@class='paraNum'])"/>
         <xsl:variable name="first_letter_span" select="span[@class='lettrine']"/>

         <xsl:value-of select="$latexNewline"/>
         <xsl:text>\par</xsl:text> <!-- Commence un nouveau paragraphe LaTeX -->
         <xsl:value-of select="$latexNewline"/>

        <!-- Numéro de paragraphe -->
        <xsl:text>\noindent\textbf{§</xsl:text>
        <xsl:value-of select="$para_num"/>
        <xsl:text>} </xsl:text> <!-- Espace après le numéro -->

        <!-- Lettrine (si présente) -->
        <xsl:if test="$first_letter_span">
            <xsl:variable name="letter" select="normalize-space($first_letter_span)"/>
            <xsl:text>\lettrine{</xsl:text>
            <xsl:value-of select="$letter"/>
            <xsl:text>}{}</xsl:text> <!-- {} vide pour le reste du mot -->
        </xsl:if>

        <!-- Texte du paragraphe (en sautant le span du numéro et la lettrine) -->
        <xsl:apply-templates select="node()[not(self::span[b/span/@class='paraNum']) and not(self::span[@class='lettrine'])]"/>
         <xsl:value-of select="$latexNewline"/>
    </xsl:template>

    <!-- Ignorer le conteneur externe de paragraphe s'il ne contient que le <p> interne -->
    <xsl:template match="p[@class='sup_paragraphe'][count(p)=1 and count(node())=1]"/>
    <!-- Traiter les enfants s'il y a plus qu'un <p> -->
     <xsl:template match="p[@class='sup_paragraphe']">
          <xsl:apply-templates/>
     </xsl:template>

    <!-- === Lettrines (traitées dans le template paragraphe) === -->
    <xsl:template match="span[@class='lettrine']"/> <!-- Déjà géré -->

    <!-- === Entités nommées === -->
    <xsl:template match="span[@class='persName']">
        <xsl:text>\persName{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>

     <!-- Gérer persName dans un tooltip -->
    <xsl:template match="span[@class='tooltip']/span[@class='persName']">
         <xsl:text>\persName{</xsl:text>
         <xsl:apply-templates/>
         <xsl:text>}</xsl:text>
         <!-- Traiter aussi une éventuelle note dans le même tooltip -->
         <xsl:apply-templates select="../span[@class='note']"/>
    </xsl:template>

    <xsl:template match="span[@class='placeName']">
        <xsl:text>\placeName{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <!-- Gérer placeName dans un tooltip -->
    <xsl:template match="span[@class='tooltip']/span[@class='placeName']">
         <xsl:text>\placeName{</xsl:text>
         <xsl:apply-templates/>
         <xsl:text>}</xsl:text>
         <!-- Traiter aussi une éventuelle note dans le même tooltip -->
         <xsl:apply-templates select="../span[@class='note']"/>
    </xsl:template>

    <!-- === Notes / Tooltips (transformer en footnotes) === -->
    <xsl:template match="span[@class='tooltip'][span/@class='note']]">
         <!-- Le texte principal est traité par apply-templates standard -->
         <xsl:apply-templates select="*[not(self::span[@class='note'])] | text()"/>
         <!-- Ajouter la note en footnote -->
         <xsl:text>\footnote{</xsl:text>
         <xsl:call-template name="escape-latex">
              <xsl:with-param name="text" select="normalize-space(span[@class='note']/span[@class='tooltip-content'])"/>
         </xsl:call-template>
         <xsl:text>}</xsl:text>
    </xsl:template>
    <!-- Template pour tooltip simple sans note (juste pour appliquer les templates internes) -->
    <xsl:template match="span[@class='tooltip'][not(span/@class='note')]">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- === Édition : Suppressions, Additions, Corrections === -->
    <xsl:template match="span[@class='del']"/> <!-- Ignorer les suppressions -->
    <xsl:template match="span[@class='add']">
         <xsl:apply-templates/> <!-- Inclure les additions -->
    </xsl:template>
     <xsl:template match="span[@class='surplus']"/> <!-- Ignorer le surplus -->

    <!-- Gérer les expansions <...> et les corrections ›...‹ -->
    <xsl:template match="span[@class='tooltip'][contains(text(),'‹') or contains(text(),'›')]">
         <xsl:variable name="cleaned_text">
             <xsl:call-template name="clean-editorial-markup">
                 <xsl:with-param name="nodes" select="node()"/>
             </xsl:call-template>
         </xsl:variable>
         <xsl:call-template name="escape-latex">
              <xsl:with-param name="text" select="$cleaned_text"/>
         </xsl:call-template>
    </xsl:template>

     <!-- Fonction pour nettoyer les marques éditoriales dans les spans -->
     <xsl:template name="clean-editorial-markup">
         <xsl:param name="nodes"/>
         <xsl:for-each select="$nodes">
             <xsl:choose>
                 <xsl:when test="self::text()">
                     <xsl:value-of select="."/>
                 </xsl:when>
                 <xsl:when test="self::i"> <!-- Cas (t) -->
                     <!-- Ignorer le contenu de <i> pour les corrections -->
                 </xsl:when>
                  <xsl:when test="self::b"> <!-- Cas ›t‹ -->
                      <xsl:value-of select="translate(., '‹›', '')"/>
                 </xsl:when>
                 <xsl:otherwise>
                     <!-- Pour d'autres nœuds internes, on pourrait les traiter ou les ignorer -->
                     <xsl:value-of select="."/>
                 </xsl:otherwise>
             </xsl:choose>
         </xsl:for-each>
     </xsl:template>

     <!-- Gérer spécifiquement la structure de correction <span><i>(A)</i> <b>›B‹</b></span> -->
     <xsl:template match="span[i and b[contains(text(),'›')]]">
          <xsl:variable name="corrected_text" select="normalize-space(translate(b, '‹›', ''))"/>
          <xsl:call-template name="escape-latex">
               <xsl:with-param name="text" select="$corrected_text"/>
          </xsl:call-template>
     </xsl:template>

    <!-- Texte incertain -->
    <xsl:template match="span[@class='acertain']">
        <xsl:text>\textit{[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]?}</xsl:text>
    </xsl:template>

    <!-- Texte illisible -->
     <xsl:template match="b[contains(text(),'[×]')]">
         <xsl:text>[...]</xsl:text>
     </xsl:template>
     <xsl:template match="span[contains(text(),'[×]')]"> <!-- Cas où c'est dans un span add -->
         <xsl:text>[...]</xsl:text>
     </xsl:template>


    <!-- === Autres éléments === -->
    <xsl:template match="span[@class='num']">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="i | b"> <!-- Italique et gras simple -->
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="br">
        <xsl:text>\par</xsl:text><xsl:value-of select="$latexNewline"/> <!-- Saut de paragraphe LaTeX -->
    </xsl:template>

    <xsl:template match="div[@class='chanson']">
        <xsl:value-of select="$latexNewline"/>
        <xsl:text>\begin{verse}</xsl:text>
        <xsl:value-of select="$latexNewline"/>
        <xsl:apply-templates/>
        <xsl:value-of select="$latexNewline"/>
        <xsl:text>\end{verse}</xsl:text>
        <xsl:value-of select="$latexNewline"/>
    </xsl:template>

     <!-- Gérer les tirets de dialogue -->
     <xsl:template match="span[@style='white-space: nowrap;'][starts-with(normalize-space(.), '—')]">
           <xsl:text> --- </xsl:text>
           <xsl:variable name="dialogue_text" select="substring-after(normalize-space(.), '—')"/>
            <xsl:call-template name="escape-latex">
                <xsl:with-param name="text" select="normalize-space($dialogue_text)"/>
            </xsl:call-template>
     </xsl:template>

    <!-- === Traitement du texte simple === -->
    <xsl:template match="text()">
        <xsl:variable name="normalized" select="normalize-space(.)"/>
        <!-- Ne pas générer de sortie pour du texte entièrement blanc ou juste un espace -->
        <xsl:if test="string-length($normalized) > 0 or (contains(., ' ') and string-length(translate(., ' ', ''))=0 and preceding-sibling::node()[1][self::text() and not(normalize-space()='')] and following-sibling::node()[1][self::text() and not(normalize-space()='')])">
            <xsl:call-template name="escape-latex">
                <!-- Préserver les espaces significatifs en début/fin si nécessaire (ici, normalisation simple) -->
                 <xsl:with-param name="text" select="."/>
                 <!-- Pourrait nécessiter une gestion plus fine des espaces si normalize-space() est trop agressif -->
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>