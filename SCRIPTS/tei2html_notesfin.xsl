<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <!-- Template principal -->
    <xsl:template match="/">
        <html>

            <head>
                <title>Kanor et ses frères</title>
                <link rel="stylesheet" type="text/css" href="./ASSETS/Kanor.css?ver=1.2"/>
                <meta http-equiv="cache-control" content="no-cache"/>
                <meta http-equiv="expires" content="0"/>
                <meta http-equiv="pragma" content="no-cache"/>
                <script>
                    function toggleTooltip(element) {
                    const tooltip = element.nextSibling;
                    tooltip.classList.toggle('active');
                    element.addEventListener('mouseleave', () => {
                    tooltip.classList.remove('active');
                    });
                    }
                    
                    function hideTooltip(element) {
                    element.classList.remove('active');
                    }
                    
                </script>
            </head>
            <body>
                <span class="title">
                    <i>Li histoire de Kanor et de ses freres</i>
                </span>
                <!--<br/>
                <br/>
                <span>Présentation des signes employés :</span>
                <ul>
                    <li>les noms de personnage apparaissent avec une <span class="persName"
                            >Capitale</span> colorée pour indiquer que le nom a bien été encodé.
                        Tous les noms sont dotés d'une infobulle qui va rechercher le contenu de
                            l'<hi>index nominum</hi>. Même principe pour les noms de lieux.</li>
                    <li>[×] segment indéchiffrable</li>
                    <li>Dieus i vot mostrer de ses o<span class="add">^ue^</span>vres : ajout
                        suscrit par le scribe </li>
                    <li>de grant se<span class="tooltip">‹n›<span class="tooltip-content"/></span>s
                        aornee : ajout par l'éditeur </li>
                    <li>Au conbrer le cheval f<span class="del">u</span>ist il merveille :
                        exponctuation par le scribe </li>
                    <li>et cuida bien avoir l'auwe <span class="surplus">avoir</span> copee. :
                        suppression par l'éditeur </li>
                    <li>je ne <span><i>(s)</i>>&#160;<b>›l‹</b></span>e saroie trover : la
                        correction critique <b>›l‹</b> remplace le texte du ms. </li>
                    <li>devant <span class="acertain"><i>[provés]</i></span> siergans : élément
                        demandant une second regard</li>
                    <li>li envieus<span class="tooltip"><span class="note">💬<span
                                    class="tooltip-content">topos de prologue que de rejeter les
                                    critiques à l'avance. Ce qui est intéressant, c'est
                                    l'utilisation d'un cas sujet alors que finalement le GN est COD
                                    : ou alors il y a une anacoluthe...</span></span></span> / et
                        puis les sont <span class="tooltip"
                                ><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#0096ff" version="1.1" id="Capa_1" width="24px" height="24px" viewBox="-62.89 -62.89 609.57 609.57" xml:space="preserve" transform="matrix(-1, 0, 0, 1, 0, 0)rotate(0)" stroke="#0096ff" stroke-width="0.00483789">
               <g id="SVGRepo_bgCarrier" stroke-width="0"/>
               <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" stroke="#CCCCCC" stroke-width="4.83789"/>
               <g id="SVGRepo_iconCarrier"> 
                  <g> 
                     <g> 
                        <polygon points="434.77,405.332 465.895,405.332 465.895,122.667 329.895,122.667 329.895,280.288 329.895,293.333 316.073,293.333 167.228,293.333 167.228,405.332 361.895,405.332 361.895,483.789 "/> 
                        <path d="M17.895,280h30.88l73.12,79.973V280h45.333h149.333V122.667V0H17.895V280z M266.138,116.6 c6.267,0,11.989,3.4,16.407,6.067c5.43,5.333,8.885,11.845,8.885,19.549c0,13.968-11.325,25.453-25.292,25.453 c-13.968,0-25.294-11.565-25.294-25.533c0-7.701,3.453-14.133,8.886-19.467C254.145,120,259.867,116.6,266.138,116.6z M199.927,116.6c6.267,0,11.99,3.4,16.408,6.067c5.429,5.333,8.886,11.845,8.886,19.549c0,13.968-11.326,25.453-25.294,25.453 c-13.968,0-25.293-11.565-25.293-25.533c0-7.701,3.454-14.133,8.886-19.467C187.937,120,193.66,116.6,199.927,116.6z M133.715,117.243c13.971,0,25.293,11.326,25.293,25.293c0,13.968-11.325,25.293-25.293,25.293 c-13.968,0-25.293-11.325-25.293-25.293C108.422,128.565,119.748,117.243,133.715,117.243z M67.507,117.243 c13.968,0,25.293,11.326,25.293,25.293c0,13.968-11.326,25.293-25.293,25.293c-13.971,0-25.293-11.325-25.293-25.293 C42.214,128.565,53.538,117.243,67.507,117.243z"/> </g> </g> </g></svg><span
                                class="tooltip-content"><b>fpzanardi :</b><br/>à corriger en «alees»
                                en suivant V3 ? Ou bien, si le fait se reproduit (participes passés
                                en –er), le signaler en introduction linguistique.</span></span>aler
                        oïr / [li emperere] <span class="tooltip"><span class="ntravail">❓<span
                                    class="tooltip-content">Le cas de ce groupe nominal ne fait pas
                                    de doute grâce au déterminant : CSS. Mais l'analyse syntaxique
                                    montre qu'il est en fait complément détaché de li chastelains
                                    vint a lui.</span></span></span>: notes affichées sous forme
                        d'info-bulle au passage de la souris :<br/>notes de 1) <b>apparat</b> 2)
                            <b>commentaire</b> Oxygen 3) <b>travail</b> (seront supprimées)</li>
                </ul>
                <br/>
                <hr/>
                <br/>-->
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <!-- Template pour ignorer l'élément teiHeader -->
    <xsl:template match="teiHeader"/>

    <!-- Template pour les titres de rubrique -->


    <!-- Template pour les titres explicites -->
    <xsl:template match="head[@type = 'explicit']">
        <h1>
            <span class="headNum">[<xsl:value-of select="substring-after(@n, 'R')"/>]</span>
            <xsl:text> </xsl:text>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>

    <!-- Template pour les descriptions de figure -->
    <xsl:template match="figDesc">
        <h2>
            <i>
                <span class="figDesc">
                    <xsl:apply-templates/>
                </span>
            </i>
        </h2>
    </xsl:template>

    <!-- Template pour les images -->
    <xsl:template match="graphic[@url]">
        <h2>
            <a href="{@url}" target="_blank" class="GallicaLink">🖼️</a>
        </h2>
    </xsl:template>

    <!-- Template pour les paragraphes -->
    <xsl:template match="p">
        <p style="display:inline;">
            <span style="float: left;padding-right: 15px;">
                <b>§&#160;<span class="paraNum"><xsl:value-of select="substring-after(@n, 'P')"
                        /></span></b>
            </span>
            <xsl:text> </xsl:text>
            <xsl:apply-templates/>
            <br/>
        </p>

    </xsl:template>

    <xsl:template match="div">
        <xsl:choose>
            <xsl:when test="@type = 'chapter'">
                <p>
                    <span class="headNum">[<xsl:value-of select="@n"/>]</span>
                    <xsl:apply-templates/>
                </p>
            </xsl:when>
            <xsl:when test="@type = 'sup_paragraphe'">
                <p class="sup_paragraphe">
                    <xsl:apply-templates/>
                </p>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- Template pour les numéros de page -->
    <xsl:template match="pb">


        <span style="color:#d32f2f;">
            <strong>[<xsl:value-of select="@n"/>a]</strong>
        </span>


    </xsl:template>

    <!-- Template pour les numéros de colonne -->
    <xsl:template match="cb">
        <span style="color:#d32f2f;">
            <strong>[<xsl:value-of select="preceding::pb[1]/@n"/><xsl:value-of select="@n"
                />]</strong>
        </span>
    </xsl:template>

    <!-- Template pour les numéros -->
    <xsl:template match="num">
        <span class="num">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


    <!-- Template pour les hi -->

    <!-- Template pour les said
    Utiliser http://xpather.com/ pour tester les chemins
    -->

    <xsl:template match="said">
        <xsl:choose>
            <!-- Template pour les rendition DIALOGUE -->

            <xsl:when test="@rendition = 'dialogue'">
                <xsl:choose>
                    <!-- Condition propre au discours direct avec incise terminale non suivie d'un DD -->
                    <!-- Type : – Et j'en ferai la besougne », dist il. (§§132, 159) -->
                    <!-- On met la virgule à la fin du DD et le script la met après les » -->
                    <!-- Ce test doit être en premier sinon il y a conflit avec un autre test -->

                    <xsl:when
                        test="preceding-sibling::said and not(following-sibling::said[1][@rendition = 'dialogue']) and ends-with(., ',')"
                            ><span style="white-space: nowrap;">—&#xA0;</span><xsl:value-of
                            select="substring(., 1, string-length(.) - 1)"/>&#xA0;»,</xsl:when>

                    <!-- Template pour les spécifiques pour les discours en fin de <p> -->
                    <xsl:when test="@style = 'last'">
                        <span style="white-space: nowrap;">—&#xA0;</span>
                        <xsl:apply-templates/>
                    </xsl:when>

                    <xsl:when
                        test="preceding-sibling::said and following-sibling::said[1][@rendition = 'dialogue']">
                        <span style="white-space: nowrap;">—&#xA0;</span>
                        <xsl:apply-templates/>
                    </xsl:when>

                    <xsl:when test="following-sibling::said[1][@rendition = 'dialogue']">
                        <span style="white-space: nowrap;">—&#xA0;</span>
                        <xsl:apply-templates/>
                    </xsl:when>

                    <xsl:when
                        test="preceding-sibling::said or position() = 1 and not(following-sibling::said[1][@rendition = 'dialogue']) and ends-with(., '.')"
                            ><span style="white-space: nowrap;"
                        >—&#xA0;</span><xsl:apply-templates/>&#xA0;» </xsl:when>

                    <xsl:when
                        test="preceding-sibling::said and not(following-sibling::said[1][@rendition = 'dialogue']) and ends-with(., '?')"
                            ><span style="white-space: nowrap;"
                        >—&#xA0;</span><xsl:apply-templates/>&#xA0;» </xsl:when>

                    <xsl:when
                        test="preceding-sibling::said and not(following-sibling::said[1][@rendition = 'dialogue']) and ends-with(., '!')"
                            ><span style="white-space: nowrap;"
                        >—&#xA0;</span><xsl:apply-templates/>&#xA0;» </xsl:when>

                    <xsl:when
                        test="preceding-sibling::said and not(following-sibling::said[1][@rendition = 'dialogue']) and not(matches(., '^.*[\.!\?]$'))"
                            ><span style="white-space: nowrap;"
                        >–&#xA0;</span><xsl:apply-templates/>&#xA0;»</xsl:when>
                </xsl:choose>
            </xsl:when>


            <!-- Template pour les débuts DIALOGUE -->

            <xsl:when test="position() = 1 and following-sibling::said[@rendition = 'dialogue']">
                «&#xA0;<xsl:apply-templates/></xsl:when>


            <xsl:when test="@direct = 'true' and @aloud = 'true' and not(@rendition = 'dialogue')">
                <xsl:choose>
                    <!-- Template pour les débuts DIALOGUE qui ont une suite dans le même <p> -->
                    <xsl:when test="following-sibling::said[1][@rendition = 'dialogue']">
                        «&#xA0;<xsl:apply-templates/></xsl:when>

                    <!-- Template pour les spécifiques pour les discours type "dis me tu" -->
                    <xsl:when test="@style = 'nogap'">
                        «&#xA0;<xsl:apply-templates/>&#xA0;»</xsl:when>

                    <!-- Template pour les spécifiques pour les discours en fin de <p> -->
                    <xsl:when test="@style = 'last'"> «&#xA0;<xsl:apply-templates/></xsl:when>

                    <!-- Template pour les spécifiques pour les discours enchâssés -->
                    <xsl:when test="@style = 'embedded'"> “<xsl:apply-templates/>”</xsl:when>

                    <!-- Condition propre au discours direct avec incise terminale non précédée ou suivie d'un DD (ou sans incise) -->
                    <!-- Type : – Et j'en ferai la besougne ! » dist il. -->
                    <xsl:when
                        test="not(preceding-sibling::said[1][@rendition = 'dialogue']) and not(following-sibling::said[1][@rendition = 'dialogue']) and ends-with(., '!')"
                        > «&#xA0;<xsl:apply-templates/>&#xA0;» </xsl:when>

                    <!-- Condition propre au discours direct avec incise terminale non précédée ou suivie d'un DD -->
                    <!-- Type : – Et j'en ferai la besougne », dist il. -->
                    <!-- On met la virgule à la fin du DD et le script la met après les » -->
                    <xsl:when
                        test="not(preceding-sibling::said[1][@rendition = 'dialogue']) and not(following-sibling::said[1][@rendition = 'dialogue']) and ends-with(., ',')"
                        > «&#xA0;<xsl:value-of select="substring(., 1, string-length(.) - 1)"
                        />&#xA0;», </xsl:when>

                    <!-- Condition propre au discours direct avec incise terminale non précédée ou suivie d'un DD -->
                    <!-- Type : – Et j'en ferai la besougne ? » dist il. -->
                    <xsl:when
                        test="not(preceding-sibling::said[1][@rendition = 'dialogue']) and not(following-sibling::said[1][@rendition = 'dialogue']) and ends-with(., '?')"
                        > «&#xA0;<xsl:apply-templates/>&#xA0;» </xsl:when>

                    <xsl:otherwise> «&#xA0;<xsl:apply-templates/>&#xA0;»</xsl:otherwise>
                </xsl:choose>
            </xsl:when>

            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Template pour les éléments del -->
    <xsl:template match="del"> </xsl:template>

    <!-- Template pour les éléments surplus -->
    <xsl:template match="surplus"> </xsl:template>


    <!-- Template pour les éléments app -->
    <xsl:template match="app">
        <span class="tooltip">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- Template pour les éléments rdg -->
    <xsl:template match="rdg">
        <span class="tooltip-content">
            <xsl:apply-templates/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="translate(@wit, '#', '')"/>
        </span>
    </xsl:template>

    <!-- Template pour les éléments lem -->
    <xsl:template match="lem">
        <span class="lem">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- Template pour les éléments supplied -->
    <xsl:template match="supplied">
        <span class="tooltip">
            <xsl:choose>
                <xsl:when test="@source = '#FPZ'">[<xsl:apply-templates/>]</xsl:when>
                <xsl:otherwise>‹<xsl:apply-templates/>›</xsl:otherwise>
            </xsl:choose>
            <span class="tooltip-content">
                <xsl:value-of select="@source"/>
            </span>
        </span>
    </xsl:template>

    <!-- Template pour les éléments note -->
    <xsl:template match="note">
        <xsl:choose>
            <xsl:when test="@type = 'notecritique'"> (<xsl:apply-templates/>) </xsl:when>
            <xsl:when test="@type = 'note_travail'">
                <span>
                    <small>
                        <strong> (<span style="color: #ff6600;">note de travail : </span>
                        </strong>
                        <xsl:apply-templates/>
                        <strong>)</strong>
                    </small>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span>
                    <small>
                        <strong> (note : </strong>
                        <xsl:apply-templates/>
                        <strong>)</strong>
                    </small>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Template pour les éléments add -->
    <xsl:template match="add">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Template pour les éléments hi -->
    <xsl:template match="hi">
        <xsl:choose>
            <xsl:when test="starts-with(@rend, 'rubricated')"> [<xsl:value-of
                    select="ancestor::head/@n"/>] <span style="color:#d32f2f;font-size:larger"><strong>
                        <xsl:apply-templates/></strong>
                </span>
            </xsl:when>
            <xsl:when test="@rend = 'exp'">
                <sup>
                    <span class="exp">
                        <xsl:apply-templates/>
                    </span>
                </sup>
            </xsl:when>
            <xsl:when test="@rend = 'italic'">
                <span style="font-style: italic;">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="starts-with(@rend, 'decorated-initial')">
                <span class="lettrine"
                    style="color:dark{tokenize(@rend, '\s+')[3]};font-size:{tokenize(@rend, '\s+')[2]}em">
                    <i>
                        <xsl:apply-templates/>
                    </i>
                </span>
            </xsl:when>
        </xsl:choose>
    </xsl:template>









    <!-- Template pour les éléments persName -->
    <xsl:key name="person-by-id" match="person" use="@xml:id"/>

    <xsl:template match="persName">
        <span class="tooltip">
            <span class="persName" onclick="toggleTooltip(this)"
                onmouseleave="hideTooltip(this.nextSibling)">
                <xsl:apply-templates/>
            </span>
            <span class="tooltip-content">
                <xsl:for-each select="key('person-by-id', @key)">
                    <span class="occupation">
                        <b>
                            <xsl:value-of select="persName"/>
                        </b>
                        <br/>
                    </span>
                    <xsl:for-each select="occupation">
                        <span class="occupation">
                            <b>
                                <xsl:value-of select="."/>
                            </b>
                            <br/>
                        </span>
                    </xsl:for-each>

                    <xsl:for-each select="note">
                        <span class="note">
                            <xsl:value-of select="."/>
                            <br/>
                        </span>
                    </xsl:for-each>
                </xsl:for-each>
            </span>
        </span>
    </xsl:template>




    <!-- Template pour les éléments placeName -->



    <xsl:key name="place-by-id" match="place" use="@xml:id"/>

    <xsl:template match="placeName">
        <span class="tooltip">
            <span class="placeName" onclick="toggleTooltip(this)">
                <xsl:apply-templates/>
            </span>
            <span class="tooltip-content" onmouseleave="hideTooltip(this)">
                <xsl:for-each select="key('place-by-id', @key)">
                    <span class="info_place">
                        <b>
                            <xsl:value-of select="placeName"/>
                        </b>
                        <br/>
                        <xsl:for-each select="note">
                            <span class="note">
                                <xsl:value-of select="."/>
                                <br/>
                            </span>
                        </xsl:for-each>
                    </span>
                </xsl:for-each>
            </span>
        </span>
    </xsl:template>

    <!-- Template pour les éléments name -->
    <xsl:template match="name">
        <span class="tooltip_notes">
            <span class="name">
                <xsl:apply-templates/>
                <span class="tooltip_notes-content">
                    <xsl:value-of select="@ref"/>
                </span>
            </span>
        </span>
    </xsl:template>

    <!-- Template pour les éléments name avec type = 'people' -->
    <xsl:template match="name[@type = 'people']">
        <span class="tooltip_notes">
            <span class="people">
                <xsl:apply-templates/>
                <span class="tooltip_notes-content">
                    <xsl:value-of select="@ref"/>
                </span>
            </span>
        </span>
    </xsl:template>

    <!-- Template pour les éléments name avec type = 'place' -->
    <xsl:template match="name[@type = 'place']">
        <span class="tooltip_notes">
            <span class="place">
                <xsl:apply-templates/>
                <span class="tooltip_notes-content">
                    <xsl:value-of select="@ref"/>
                </span>
            </span>
        </span>
    </xsl:template>

    <!-- Template pour les éléments seg -->
    <xsl:template match="seg">
        <xsl:choose>
            <xsl:when test="@ana = 'lettre'">“<xsl:apply-templates/>”</xsl:when>
            <xsl:when test="@ana = 'chanson'">
                <span class="chanson">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@ana = 'proverbe'">‘<xsl:apply-templates/>’</xsl:when>
            <xsl:when test="@ana = 'divergences'">
                <span class="divergences">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>'<xsl:apply-templates/>'</xsl:otherwise>

        </xsl:choose>
    </xsl:template>

    <!-- Template pour les éléments unclear -->
    <xsl:template match="unclear">
        <xsl:choose>
            <xsl:when test="@reason = 'acertain' and @cert = 'low'">
                <span style="color: #ff0000;">
                    <em>
                        <strong>[<xsl:apply-templates/>]</strong>
                    </em>
                </span>
            </xsl:when>
            <xsl:when test="@reason = 'acertain' and @cert = 'medium'">
                <span style="color: #ff0000;">
                    <em>
                        <strong>[<xsl:apply-templates/>]</strong>
                    </em>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Template pour les éléments gap -->
    <xsl:template match="gap">
        <xsl:choose>
            <xsl:when test="@reason = 'illegible'">
                <b>[×]</b>
            </xsl:when>
            <xsl:otherwise>
                <b>[×]</b>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- Template pour les éléments corr -->
    <xsl:template match="corr">
        <xsl:choose>
            <xsl:when test="@cert = 'low'">
                <span class="acertain">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Template pour les éléments <choice>
    On sélectionne les deux enfants du noeud <choice> par une expression xpath, car leur type est variable.
    -->
    <xsl:template match="choice">
        <span><i>(<xsl:value-of select="./*[1]"/>)</i>&#160;<b>›<xsl:value-of select="./*[2]"
            />‹</b></span>
    </xsl:template>

    <xsl:template match="processing-instruction('oxy_comment_start')">

        <span class="tooltip_notes">
            <svg fill="#0096ff" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="-62.89 -62.89 609.57 609.57" xml:space="preserve" transform="matrix(-1, 0, 0, 1, 0, 0)rotate(0)" stroke="#0096ff" stroke-width="0.00483789"><g id="SVGRepo_bgCarrier" stroke-width="0"/><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" stroke="#CCCCCC" stroke-width="4.83789"/><g id="SVGRepo_iconCarrier"> <g> <g> <polygon points="434.77,405.332 465.895,405.332 465.895,122.667 329.895,122.667 329.895,280.288 329.895,293.333 316.073,293.333 167.228,293.333 167.228,405.332 361.895,405.332 361.895,483.789 "/> <path d="M17.895,280h30.88l73.12,79.973V280h45.333h149.333V122.667V0H17.895V280z M266.138,116.6 c6.267,0,11.989,3.4,16.407,6.067c5.43,5.333,8.885,11.845,8.885,19.549c0,13.968-11.325,25.453-25.292,25.453 c-13.968,0-25.294-11.565-25.294-25.533c0-7.701,3.453-14.133,8.886-19.467C254.145,120,259.867,116.6,266.138,116.6z M199.927,116.6c6.267,0,11.99,3.4,16.408,6.067c5.429,5.333,8.886,11.845,8.886,19.549c0,13.968-11.326,25.453-25.294,25.453 c-13.968,0-25.293-11.565-25.293-25.533c0-7.701,3.454-14.133,8.886-19.467C187.937,120,193.66,116.6,199.927,116.6z M133.715,117.243c13.971,0,25.293,11.326,25.293,25.293c0,13.968-11.325,25.293-25.293,25.293 c-13.968,0-25.293-11.325-25.293-25.293C108.422,128.565,119.748,117.243,133.715,117.243z M67.507,117.243 c13.968,0,25.293,11.326,25.293,25.293c0,13.968-11.326,25.293-25.293,25.293c-13.971,0-25.293-11.325-25.293-25.293 C42.214,128.565,53.538,117.243,67.507,117.243z"/> </g> </g> </g></svg>
            <span class="tooltip_notes-content">
                <b><xsl:value-of
                        select="substring-before(substring-after(., 'author=&quot;'), '&quot;')"/>
                    :</b>
                <br/>
                <xsl:value-of
                    select="substring-before(substring-after(., 'comment=&quot;'), '&quot;')"/>
            </span>
        </span>
    </xsl:template>

    <!-- les non breaking spaces sont ici -->



</xsl:stylesheet>
