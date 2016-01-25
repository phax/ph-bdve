<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cec="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Order-2" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->
<xsl:param name="archiveDirParameter" />
  <xsl:param name="archiveNameParameter" />
  <xsl:param name="fileNameParameter" />
  <xsl:param name="fileDirParameter" />
  <xsl:variable name="document-uri">
    <xsl:value-of select="document-uri(/)" />
  </xsl:variable>

<!--PHASES-->


<!--PROLOG-->
<xsl:output indent="yes" method="xml" omit-xml-declaration="no" standalone="yes" />

<!--XSD TYPES FOR XSLT2-->


<!--KEYS AND FUNCTIONS-->


<!--DEFAULT RULES-->


<!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<xsl:template match="*" mode="schematron-select-full-path">
    <xsl:apply-templates mode="schematron-get-full-path" select="." />
  </xsl:template>

<!--MODE: SCHEMATRON-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<xsl:template match="*" mode="schematron-get-full-path">
    <xsl:apply-templates mode="schematron-get-full-path" select="parent::*" />
    <xsl:text>/</xsl:text>
    <xsl:choose>
      <xsl:when test="namespace-uri()=''">
        <xsl:value-of select="name()" />
        <xsl:variable name="p_1" select="1+    count(preceding-sibling::*[name()=name(current())])" />
        <xsl:if test="$p_1>1 or following-sibling::*[name()=name(current())]">[<xsl:value-of select="$p_1" />]</xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>*[local-name()='</xsl:text>
        <xsl:value-of select="local-name()" />
        <xsl:text>']</xsl:text>
        <xsl:variable name="p_2" select="1+   count(preceding-sibling::*[local-name()=local-name(current())])" />
        <xsl:if test="$p_2>1 or following-sibling::*[local-name()=local-name(current())]">[<xsl:value-of select="$p_2" />]</xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="@*" mode="schematron-get-full-path">
    <xsl:text>/</xsl:text>
    <xsl:choose>
      <xsl:when test="namespace-uri()=''">@<xsl:value-of select="name()" />
</xsl:when>
      <xsl:otherwise>
        <xsl:text>@*[local-name()='</xsl:text>
        <xsl:value-of select="local-name()" />
        <xsl:text>' and namespace-uri()='</xsl:text>
        <xsl:value-of select="namespace-uri()" />
        <xsl:text>']</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

<!--MODE: SCHEMATRON-FULL-PATH-2-->
<!--This mode can be used to generate prefixed XPath for humans-->
<xsl:template match="node() | @*" mode="schematron-get-full-path-2">
    <xsl:for-each select="ancestor-or-self::*">
      <xsl:text>/</xsl:text>
      <xsl:value-of select="name(.)" />
      <xsl:if test="preceding-sibling::*[name(.)=name(current())]">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1" />
        <xsl:text>]</xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:if test="not(self::*)">
      <xsl:text />/@<xsl:value-of select="name(.)" />
    </xsl:if>
  </xsl:template>
<!--MODE: SCHEMATRON-FULL-PATH-3-->
<!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->
<xsl:template match="node() | @*" mode="schematron-get-full-path-3">
    <xsl:for-each select="ancestor-or-self::*">
      <xsl:text>/</xsl:text>
      <xsl:value-of select="name(.)" />
      <xsl:if test="parent::*">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1" />
        <xsl:text>]</xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:if test="not(self::*)">
      <xsl:text />/@<xsl:value-of select="name(.)" />
    </xsl:if>
  </xsl:template>

<!--MODE: GENERATE-ID-FROM-PATH -->
<xsl:template match="/" mode="generate-id-from-path" />
  <xsl:template match="text()" mode="generate-id-from-path">
    <xsl:apply-templates mode="generate-id-from-path" select="parent::*" />
    <xsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')" />
  </xsl:template>
  <xsl:template match="comment()" mode="generate-id-from-path">
    <xsl:apply-templates mode="generate-id-from-path" select="parent::*" />
    <xsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')" />
  </xsl:template>
  <xsl:template match="processing-instruction()" mode="generate-id-from-path">
    <xsl:apply-templates mode="generate-id-from-path" select="parent::*" />
    <xsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')" />
  </xsl:template>
  <xsl:template match="@*" mode="generate-id-from-path">
    <xsl:apply-templates mode="generate-id-from-path" select="parent::*" />
    <xsl:value-of select="concat('.@', name())" />
  </xsl:template>
  <xsl:template match="*" mode="generate-id-from-path" priority="-0.5">
    <xsl:apply-templates mode="generate-id-from-path" select="parent::*" />
    <xsl:text>.</xsl:text>
    <xsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')" />
  </xsl:template>

<!--MODE: GENERATE-ID-2 -->
<xsl:template match="/" mode="generate-id-2">U</xsl:template>
  <xsl:template match="*" mode="generate-id-2" priority="2">
    <xsl:text>U</xsl:text>
    <xsl:number count="*" level="multiple" />
  </xsl:template>
  <xsl:template match="node()" mode="generate-id-2">
    <xsl:text>U.</xsl:text>
    <xsl:number count="*" level="multiple" />
    <xsl:text>n</xsl:text>
    <xsl:number count="node()" />
  </xsl:template>
  <xsl:template match="@*" mode="generate-id-2">
    <xsl:text>U.</xsl:text>
    <xsl:number count="*" level="multiple" />
    <xsl:text>_</xsl:text>
    <xsl:value-of select="string-length(local-name(.))" />
    <xsl:text>_</xsl:text>
    <xsl:value-of select="translate(name(),':','.')" />
  </xsl:template>
<!--Strip characters-->  <xsl:template match="text()" priority="-1" />

<!--SCHEMA SETUP-->
<xsl:template match="/">
    <svrl:schematron-output schemaVersion="" title="OPENPEPPOL T01 bound to UBL">
      <xsl:comment>
        <xsl:value-of select="$archiveDirParameter" />   
		 <xsl:value-of select="$archiveNameParameter" />  
		 <xsl:value-of select="$fileNameParameter" />  
		 <xsl:value-of select="$fileDirParameter" />
      </xsl:comment>
      <svrl:ns-prefix-in-attribute-values prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="cec" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="xs" uri="http://www.w3.org/2001/XMLSchema" />
      <svrl:ns-prefix-in-attribute-values prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Order-2" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:attribute name="id">Codes-T01</xsl:attribute>
        <xsl:attribute name="name">Codes-T01</xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M8" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:attribute name="id">UBL-T01</xsl:attribute>
        <xsl:attribute name="name">UBL-T01</xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M9" select="/" />
    </svrl:schematron-output>
  </xsl:template>

<!--SCHEMATRON PATTERNS-->
<svrl:text>OPENPEPPOL T01 bound to UBL</svrl:text>

<!--PATTERN Codes-T01-->


	<!--RULE -->
<xsl:template match="cbc:OrderTypeCode" mode="M8" priority="1008">
    <svrl:fired-rule context="cbc:OrderTypeCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�1�10�100�101�102�103�104�105�106�107�108�109�11�110�111�112�113�114�115�116�117�118�119�12�120�121�122�123�124�125�126�127�128�129�13�130�131�132�133�134�135�136�137�138�139�14�140�141�142�143�144�145�146�147�148�149�15�150�151�152�153�154�155�156�157�158�159�16�160�161�162�163�164�165�166�167�168�169�17�170�171�172�173�174�175�176�177�178�179�18�180�181�182�183�184�185�186�187�188�189�19�190�191�192�193�194�195�196�197�198�199�2�20�200�201�202�203�204�205�206�207�208�209�21�210�211�212�213�214�215�216�217�218�219�22�220�221�222�223�224�225�226�227�228�229�23�230�231�232�233�234�235�236�237�238�239�24�240�241�242�243�244�245�246�247�248�249�25�250�251�252�253�254�255�256�257�258�259�26�260�261�262�263�264�265�266�267�268�269�27�270�271�272�273�274�275�276�277�278�279�28�280�281�282�283�284�285�286�287�288�289�29�290�291�292�293�294�295�296�297�298�299�3�30�300�301�302�303�304�305�306�307�308�309�31�310�311�312�313�314�315�316�317�318�319�32�320�321�322�323�324�325�326�327�328�329�33�330�331�332�333�334�335�336�337�338�339�34�340�341�342�343�344�345�346�347�348�349�35�350�351�352�353�354�355�356�357�358�359�36�360�361�362�363�364�365�366�367�368�369�37�370�371�372�373�374�375�376�377�378�379�38�380�381�382�383�384�385�386�387�388�389�39�390�391�392�393�394�395�396�397�398�399�4�40�400�401�402�403�404�405�406�407�408�409�41�410�411�412�413�414�415�416�417�418�419�42�420�421�422�423�424�425�426�427�428�429�43�430�431�432�433�434�435�436�437�438�439�44�440�441�442�443�444�445�446�447�448�449�45�450�451�452�453�454�455�456�457�458�459�46�460�461�462�463�464�465�466�467�468�469�47�470�48�481�482�483�484�485�486�487�488�489�49�490�491�493�494�495�496�497�498�499�5�50�51�52�520�521�522�523�524�525�526�527�528�529�53�530�531�532�533�534�535�536�537�538�54�55�550�56�57�575�58�580�59�6�60�61�610�62�621�622�623�624�63�630�631�632�633�635�64�640�65�650�655�66�67�68�69�7�70�700�701�702�703�704�705�706�707�708�709�71�710�711�712�713�714�715�716�72�720�722�723�724�73�730�74�740�741�743�744�745�746�75�750�76�760�761�763�764�765�766�77�770�775�78�780�781�782�783�784�785�786�787�788�789�79�790�791�792�793�794�795�796�797�798�799�8�80�81�810�811�812�82�820�821�822�823�824�825�83�830�833�84�840�841�85�850�851�852�853�855�856�86�860�861�862�863�864�865�87�870�88�89�890�895�896�9�90�901�91�910�911�913�914�915�916�917�92�925�926�927�929�93�930�931�932�933�934�935�936�937�938�94�940�941�95�950�951�952�953�954�955�96�960�961�962�963�964�965�966�97�970�971�972�974�975�976�977�978�979�98�99�990�991�995�996�998�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�1�10�100�101�102�103�104�105�106�107�108�109�11�110�111�112�113�114�115�116�117�118�119�12�120�121�122�123�124�125�126�127�128�129�13�130�131�132�133�134�135�136�137�138�139�14�140�141�142�143�144�145�146�147�148�149�15�150�151�152�153�154�155�156�157�158�159�16�160�161�162�163�164�165�166�167�168�169�17�170�171�172�173�174�175�176�177�178�179�18�180�181�182�183�184�185�186�187�188�189�19�190�191�192�193�194�195�196�197�198�199�2�20�200�201�202�203�204�205�206�207�208�209�21�210�211�212�213�214�215�216�217�218�219�22�220�221�222�223�224�225�226�227�228�229�23�230�231�232�233�234�235�236�237�238�239�24�240�241�242�243�244�245�246�247�248�249�25�250�251�252�253�254�255�256�257�258�259�26�260�261�262�263�264�265�266�267�268�269�27�270�271�272�273�274�275�276�277�278�279�28�280�281�282�283�284�285�286�287�288�289�29�290�291�292�293�294�295�296�297�298�299�3�30�300�301�302�303�304�305�306�307�308�309�31�310�311�312�313�314�315�316�317�318�319�32�320�321�322�323�324�325�326�327�328�329�33�330�331�332�333�334�335�336�337�338�339�34�340�341�342�343�344�345�346�347�348�349�35�350�351�352�353�354�355�356�357�358�359�36�360�361�362�363�364�365�366�367�368�369�37�370�371�372�373�374�375�376�377�378�379�38�380�381�382�383�384�385�386�387�388�389�39�390�391�392�393�394�395�396�397�398�399�4�40�400�401�402�403�404�405�406�407�408�409�41�410�411�412�413�414�415�416�417�418�419�42�420�421�422�423�424�425�426�427�428�429�43�430�431�432�433�434�435�436�437�438�439�44�440�441�442�443�444�445�446�447�448�449�45�450�451�452�453�454�455�456�457�458�459�46�460�461�462�463�464�465�466�467�468�469�47�470�48�481�482�483�484�485�486�487�488�489�49�490�491�493�494�495�496�497�498�499�5�50�51�52�520�521�522�523�524�525�526�527�528�529�53�530�531�532�533�534�535�536�537�538�54�55�550�56�57�575�58�580�59�6�60�61�610�62�621�622�623�624�63�630�631�632�633�635�64�640�65�650�655�66�67�68�69�7�70�700�701�702�703�704�705�706�707�708�709�71�710�711�712�713�714�715�716�72�720�722�723�724�73�730�74�740�741�743�744�745�746�75�750�76�760�761�763�764�765�766�77�770�775�78�780�781�782�783�784�785�786�787�788�789�79�790�791�792�793�794�795�796�797�798�799�8�80�81�810�811�812�82�820�821�822�823�824�825�83�830�833�84�840�841�85�850�851�852�853�855�856�86�860�861�862�863�864�865�87�870�88�89�890�895�896�9�90�901�91�910�911�913�914�915�916�917�92�925�926�927�929�93�930�931�932�933�934�935�936�937�938�94�940�941�95�950�951�952�953�954�955�96�960�961�962�963�964�965�966�97�970�971�972�974�975�976�977�978�979�98�99�990�991�995�996�998�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">OP-T01-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[OP-T01-R001]-OrderTypeCode in an order MUST be from UN/ECE 1001 code list PEPPOL Subset</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cbc:DocumentCurrencyCode" mode="M8" priority="1007">
    <svrl:fired-rule context="cbc:DocumentCurrencyCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�AED�AFN�ALL�AMD�ANG�AOA�ARS�AUD�AWG�AZN�BAM�BBD�BDT�BGN�BHD�BIF�BMD�BND�BOB�BOV�BRL�BSD�BTN�BWP�BYR�BZD�CAD�CDF�CHE�CHF�CHW�CLF�CLP�CNY�COP�COU�CRC�CUP�CVE�CZK�DJF�DKK�DOP�DZD�EEK�EGP�ERN�ETB�EUR�FJD�FKP�GBP�GEL�GHS�GIP�GMD�GNF�GTQ�GWP�GYD�HKD�HNL�HRK�HTG�HUF�IDR�ILS�INR�IQD�IRR�ISK�JMD�JOD�JPY�KES�KGS�KHR�KMF�KPW�KRW�KWD�KYD�KZT�LAK�LBP�LKR�LRD�LSL�LTL�LVL�LYD�MAD�MDL�MGA�MKD�MMK�MNT�MOP�MRO�MUR�MVR�MWK�MXN�MXV�MYR�MZN�NAD�NGN�NIO�NOK�NPR�NZD�OMR�PAB�PEN�PGK�PHP�PKR�PLN�PYG�QAR�RON�RSD�RUB�RWF�SAR�SBD�SCR�SDG�SEK�SGD�SHP�SKK�SLL�SOS�SRD�STD�SVC�SYP�SZL�THB�TJS�TMM�TND�TOP�TRY�TTD�TWD�TZS�UAH�UGX�USD�USN�USS�UYI�UYU�UZS�VEF�VND�VUV�WST�XAF�XAG�XAU�XBA�XBB�XBC�XBD�XCD�XDR�XFU�XOF�XPD�XPF�XTS�XXX�YER�ZAR�ZMK�ZWD�ZWR�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�AED�AFN�ALL�AMD�ANG�AOA�ARS�AUD�AWG�AZN�BAM�BBD�BDT�BGN�BHD�BIF�BMD�BND�BOB�BOV�BRL�BSD�BTN�BWP�BYR�BZD�CAD�CDF�CHE�CHF�CHW�CLF�CLP�CNY�COP�COU�CRC�CUP�CVE�CZK�DJF�DKK�DOP�DZD�EEK�EGP�ERN�ETB�EUR�FJD�FKP�GBP�GEL�GHS�GIP�GMD�GNF�GTQ�GWP�GYD�HKD�HNL�HRK�HTG�HUF�IDR�ILS�INR�IQD�IRR�ISK�JMD�JOD�JPY�KES�KGS�KHR�KMF�KPW�KRW�KWD�KYD�KZT�LAK�LBP�LKR�LRD�LSL�LTL�LVL�LYD�MAD�MDL�MGA�MKD�MMK�MNT�MOP�MRO�MUR�MVR�MWK�MXN�MXV�MYR�MZN�NAD�NGN�NIO�NOK�NPR�NZD�OMR�PAB�PEN�PGK�PHP�PKR�PLN�PYG�QAR�RON�RSD�RUB�RWF�SAR�SBD�SCR�SDG�SEK�SGD�SHP�SKK�SLL�SOS�SRD�STD�SVC�SYP�SZL�THB�TJS�TMM�TND�TOP�TRY�TTD�TWD�TZS�UAH�UGX�USD�USN�USS�UYI�UYU�UZS�VEF�VND�VUV�WST�XAF�XAG�XAU�XBA�XBB�XBC�XBD�XCD�XDR�XFU�XOF�XPD�XPF�XTS�XXX�YER�ZAR�ZMK�ZWD�ZWR�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">OP-T01-R002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[OP-T01-R002]-DocumentCurrencyCode MUST be coded using ISO code list 4217</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="@mimeCode" mode="M8" priority="1006">
    <svrl:fired-rule context="@mimeCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�application/CSTAdata+xml�application/EDI-Consent�application/EDI-X12�application/EDIFACT�application/H224�application/activemessage�application/andrew-inset�application/applefile�application/atom+xml�application/atomcat+xml�application/atomicmail�application/atomsvc+xml�application/auth-policy+xml�application/batch-SMTP�application/beep+xml�application/cals-1840�application/ccxml+xml�application/cellml+xml�application/cnrp+xml�application/commonground�application/conference-info+xml�application/cpl+xml�application/csta+xml�application/cybercash�application/davmount+xml�application/dca-rft�application/dec-dx�application/dialog-info+xml�application/dicom�application/dns�application/dvcs�application/ecmascript�application/epp+xml�application/eshop�application/example�application/fastinfoset�application/fastsoap�application/fits�application/font-tdpfr�application/http�application/hyperstudio�application/iges�application/im-iscomposing+xml�application/index�application/index.cmd�application/index.obj�application/index.response�application/index.vnd�application/iotp�application/ipp�application/isup�application/javascript�application/json�application/kpml-request+xml�application/kpml-response+xml�application/mac-binhex40�application/macwriteii�application/marc�application/mathematica�application/mbms-associated-procedure-description+xml�application/mbms-deregister+xml�application/mbms-envelope+xml�application/mbms-msk+xml�application/mbms-msk-response+xml�application/mbms-protection-description+xml�application/mbms-reception-report+xml�application/mbms-register+xml�application/mbms-register-response+xml�application/mbms-user-service-description+xml�application/mbox�application/media_control+xml�application/mediaservercontrol+xml�application/mikey�application/moss-keys�application/moss-signature�application/mosskey-data�application/mosskey-request�application/mp4�application/mpeg4-generic�application/mpeg4-iod�application/mpeg4-iod-xmt�application/msword�application/mxf�application/nasdata�application/news-message-id�application/news-transmission�application/nss�application/ocsp-request�application/ocsp-response�application/octet-stream�application/oda�application/oebps-package+xml�application/ogg�application/parityfec�application/pdf�application/pgp-encrypted�application/pgp-keys�application/pgp-signature�application/pidf+xml�application/pkcs10�application/pkcs7-mime�application/pkcs7-signature�application/pkix-cert�application/pkix-crl�application/pkix-pkipath�application/pkixcmp�application/pls+xml�application/poc-settings+xml�application/postscript�application/prs.alvestrand.titrax-sheet�application/prs.cww�application/prs.nprend�application/prs.plucker�application/qsig�application/rdf+xml�application/reginfo+xml�application/relax-ng-compact-syntax�application/remote-printing�application/resource-lists+xml�application/riscos�application/rlmi+xml�application/rls-services+xml�application/rtf�application/rtx�application/samlassertion+xml�application/samlmetadata+xml�application/sbml+xml�application/scvp-cv-request�application/scvp-cv-response�application/scvp-vp-request�application/scvp-vp-response�application/sdp�application/set-payment�application/set-payment-initiation�application/set-registration�application/set-registration-initiation�application/sgml�application/sgml-open-catalog�application/shf+xml�application/sieve�application/simple-filter+xml�application/simple-message-summary�application/simpleSymbolContainer�application/slate�application/smil (OBSOLETE)�application/smil+xml�application/soap+fastinfoset�application/soap+xml�application/sparql-query�application/sparql-results+xml�application/spirits-event+xml�application/srgs�application/srgs+xml�application/ssml+xml�application/timestamp-query�application/timestamp-reply�application/tve-trigger�application/ulpfec�application/vemmi�application/vnd.3M.Post-it-Notes�application/vnd.3gpp.bsf+xml�application/vnd.3gpp.pic-bw-large�application/vnd.3gpp.pic-bw-small�application/vnd.3gpp.pic-bw-var�application/vnd.3gpp.sms�application/vnd.3gpp2.bcmcsinfo+xml�application/vnd.3gpp2.sms�application/vnd.3gpp2.tcap�application/vnd.FloGraphIt�application/vnd.HandHeld-Entertainment+xml�application/vnd.Kinar�application/vnd.MFER�application/vnd.Mobius.DAF�application/vnd.Mobius.DIS�application/vnd.Mobius.MBK�application/vnd.Mobius.MQY�application/vnd.Mobius.MSL�application/vnd.Mobius.PLC�application/vnd.Mobius.TXF�application/vnd.Quark.QuarkXPress�application/vnd.RenLearn.rlprint�application/vnd.SimTech-MindMapper�application/vnd.accpac.simply.aso�application/vnd.accpac.simply.imp�application/vnd.acucobol�application/vnd.acucorp�application/vnd.adobe.xdp+xml�application/vnd.adobe.xfdf�application/vnd.aether.imp�application/vnd.americandynamics.acc�application/vnd.amiga.ami�application/vnd.anser-web-certificate-issue-initiation�application/vnd.antix.game-component�application/vnd.apple.installer+xml�application/vnd.audiograph�application/vnd.autopackage�application/vnd.avistar+xml�application/vnd.blueice.multipass�application/vnd.bmi�application/vnd.businessobjects�application/vnd.cab-jscript�application/vnd.canon-cpdl�application/vnd.canon-lips�application/vnd.cendio.thinlinc.clientconf�application/vnd.chemdraw+xml�application/vnd.chipnuts.karaoke-mmd�application/vnd.cinderella�application/vnd.cirpack.isdn-ext�application/vnd.claymore�application/vnd.clonk.c4group�application/vnd.commerce-battelle�application/vnd.commonspace�application/vnd.contact.cmsg�application/vnd.cosmocaller�application/vnd.crick.clicker�application/vnd.crick.clicker.keyboard�application/vnd.crick.clicker.palette�application/vnd.crick.clicker.template�application/vnd.crick.clicker.wordbank�application/vnd.criticaltools.wbs+xml�application/vnd.ctc-posml�application/vnd.ctct.ws+xml�application/vnd.cups-pdf�application/vnd.cups-postscript�application/vnd.cups-ppd�application/vnd.cups-raster�application/vnd.cups-raw�application/vnd.curl�application/vnd.cybank�application/vnd.data-vision.rdz�application/vnd.denovo.fcselayout-link�application/vnd.dna�application/vnd.dpgraph�application/vnd.dreamfactory�application/vnd.dvb.esgcontainer�application/vnd.dvb.ipdcesgaccess�application/vnd.dxr�application/vnd.ecdis-update�application/vnd.ecowin.chart�application/vnd.ecowin.filerequest�application/vnd.ecowin.fileupdate�application/vnd.ecowin.series�application/vnd.ecowin.seriesrequest�application/vnd.ecowin.seriesupdate�application/vnd.enliven�application/vnd.epson.esf�application/vnd.epson.msf�application/vnd.epson.quickanime�application/vnd.epson.salt�application/vnd.epson.ssf�application/vnd.ericsson.quickcall�application/vnd.eszigno3+xml�application/vnd.eudora.data�application/vnd.ezpix-album�application/vnd.ezpix-package�application/vnd.fdf�application/vnd.ffsns�application/vnd.fints�application/vnd.fluxtime.clip�application/vnd.framemaker�application/vnd.frogans.fnc�application/vnd.frogans.ltf�application/vnd.fsc.weblaunch�application/vnd.fujitsu.oasys�application/vnd.fujitsu.oasys2�application/vnd.fujitsu.oasys3�application/vnd.fujitsu.oasysgp�application/vnd.fujitsu.oasysprs�application/vnd.fujixerox.ART-EX�application/vnd.fujixerox.ART4�application/vnd.fujixerox.HBPL�application/vnd.fujixerox.ddd�application/vnd.fujixerox.docuworks�application/vnd.fujixerox.docuworks.binder�application/vnd.fut-misnet�application/vnd.fuzzysheet�application/vnd.genomatix.tuxedo�application/vnd.google-earth.kml+xml�application/vnd.google-earth.kmz�application/vnd.grafeq�application/vnd.gridmp�application/vnd.groove-account�application/vnd.groove-help�application/vnd.groove-identity-message�application/vnd.groove-injector�application/vnd.groove-tool-message�application/vnd.groove-tool-template�application/vnd.groove-vcard�application/vnd.hbci�application/vnd.hcl-bireports�application/vnd.hhe.lesson-player�application/vnd.hp-HPGL�application/vnd.hp-PCL�application/vnd.hp-PCLXL�application/vnd.hp-hpid�application/vnd.hp-hps�application/vnd.hp-jlyt�application/vnd.httphone�application/vnd.hzn-3d-crossword�application/vnd.ibm.MiniPay�application/vnd.ibm.afplinedata�application/vnd.ibm.electronic-media�application/vnd.ibm.modcap�application/vnd.ibm.rights-management�application/vnd.ibm.secure-container�application/vnd.iccprofile�application/vnd.igloader�application/vnd.immervision-ivp�application/vnd.immervision-ivu�application/vnd.informedcontrol.rms+xml�application/vnd.informix-visionary�application/vnd.intercon.formnet�application/vnd.intertrust.digibox�application/vnd.intertrust.nncp�application/vnd.intu.qbo�application/vnd.intu.qfx�application/vnd.ipunplugged.rcprofile�application/vnd.irepository.package+xml�application/vnd.is-xpr�application/vnd.jam�application/vnd.japannet-directory-service�application/vnd.japannet-jpnstore-wakeup�application/vnd.japannet-payment-wakeup�application/vnd.japannet-registration�application/vnd.japannet-registration-wakeup�application/vnd.japannet-setstore-wakeup�application/vnd.japannet-verification�application/vnd.japannet-verification-wakeup�application/vnd.jcp.javame.midlet-rms�application/vnd.jisp�application/vnd.joost.joda-archive�application/vnd.kahootz�application/vnd.kde.karbon�application/vnd.kde.kchart�application/vnd.kde.kformula�application/vnd.kde.kivio�application/vnd.kde.kontour�application/vnd.kde.kpresenter�application/vnd.kde.kspread�application/vnd.kde.kword�application/vnd.kenameaapp�application/vnd.kidspiration�application/vnd.koan�application/vnd.kodak-descriptor�application/vnd.liberty-request+xml�application/vnd.llamagraphics.life-balance.desktop�application/vnd.llamagraphics.life-balance.exchange+xml�application/vnd.lotus-1-2-3�application/vnd.lotus-approach�application/vnd.lotus-freelance�application/vnd.lotus-notes�application/vnd.lotus-organizer�application/vnd.lotus-screencam�application/vnd.lotus-wordpro�application/vnd.macports.portpkg�application/vnd.marlin.drm.actiontoken+xml�application/vnd.marlin.drm.conftoken+xml�application/vnd.marlin.drm.mdcf�application/vnd.mcd�application/vnd.medcalcdata�application/vnd.mediastation.cdkey�application/vnd.meridian-slingshot�application/vnd.mfmp�application/vnd.micrografx.flo�application/vnd.micrografx.igx�application/vnd.mif�application/vnd.minisoft-hp3000-save�application/vnd.mitsubishi.misty-guard.trustweb�application/vnd.mophun.application�application/vnd.mophun.certificate�application/vnd.motorola.flexsuite�application/vnd.motorola.flexsuite.adsi�application/vnd.motorola.flexsuite.fis�application/vnd.motorola.flexsuite.gotap�application/vnd.motorola.flexsuite.kmr�application/vnd.motorola.flexsuite.ttc�application/vnd.motorola.flexsuite.wem�application/vnd.mozilla.xul+xml�application/vnd.ms-artgalry�application/vnd.ms-asf�application/vnd.ms-cab-compressed�application/vnd.ms-excel�application/vnd.ms-fontobject�application/vnd.ms-htmlhelp�application/vnd.ms-ims�application/vnd.ms-lrm�application/vnd.ms-playready.initiator+xml�application/vnd.ms-powerpoint�application/vnd.ms-project�application/vnd.ms-tnef�application/vnd.ms-wmdrm.lic-chlg-req�application/vnd.ms-wmdrm.lic-resp�application/vnd.ms-wmdrm.meter-chlg-req�application/vnd.ms-wmdrm.meter-resp�application/vnd.ms-works�application/vnd.ms-wpl�application/vnd.ms-xpsdocument�application/vnd.mseq�application/vnd.msign�application/vnd.multiad.creator�application/vnd.multiad.creator.cif�application/vnd.music-niff�application/vnd.musician�application/vnd.muvee.style�application/vnd.ncd.control�application/vnd.ncd.reference�application/vnd.nervana�application/vnd.netfpx�application/vnd.neurolanguage.nlu�application/vnd.noblenet-directory�application/vnd.noblenet-sealer�application/vnd.noblenet-web�application/vnd.nokia.catalogs�application/vnd.nokia.conml+wbxml�application/vnd.nokia.conml+xml�application/vnd.nokia.iSDS-radio-presets�application/vnd.nokia.iptv.config+xml�application/vnd.nokia.landmark+wbxml�application/vnd.nokia.landmark+xml�application/vnd.nokia.landmarkcollection+xml�application/vnd.nokia.n-gage.ac+xml�application/vnd.nokia.n-gage.data�application/vnd.nokia.n-gage.symbian.install�application/vnd.nokia.ncd�application/vnd.nokia.pcd+wbxml�application/vnd.nokia.pcd+xml�application/vnd.nokia.radio-preset�application/vnd.nokia.radio-presets�application/vnd.novadigm.EDM�application/vnd.novadigm.EDX�application/vnd.novadigm.EXT�application/vnd.oasis.opendocument.chart�application/vnd.oasis.opendocument.chart-template�application/vnd.oasis.opendocument.formula�application/vnd.oasis.opendocument.formula-template�application/vnd.oasis.opendocument.graphics�application/vnd.oasis.opendocument.graphics-template�application/vnd.oasis.opendocument.image�application/vnd.oasis.opendocument.image-template�application/vnd.oasis.opendocument.presentation�application/vnd.oasis.opendocument.presentation-template�application/vnd.oasis.opendocument.spreadsheet�application/vnd.oasis.opendocument.spreadsheet-template�application/vnd.oasis.opendocument.text�application/vnd.oasis.opendocument.text-master�application/vnd.oasis.opendocument.text-template�application/vnd.oasis.opendocument.text-web�application/vnd.obn�application/vnd.olpc-sugar�application/vnd.oma-scws-config�application/vnd.oma-scws-http-request�application/vnd.oma-scws-http-response�application/vnd.oma.bcast.associated-procedure-parameter+xml�application/vnd.oma.bcast.drm-trigger+xml�application/vnd.oma.bcast.imd+xml�application/vnd.oma.bcast.ltkm�application/vnd.oma.bcast.notification+xml�application/vnd.oma.bcast.sgboot�application/vnd.oma.bcast.sgdd+xml�application/vnd.oma.bcast.sgdu�application/vnd.oma.bcast.simple-symbol-container�application/vnd.oma.bcast.smartcard-trigger+xml�application/vnd.oma.bcast.sprov+xml�application/vnd.oma.bcast.stkm�application/vnd.oma.dd2+xml�application/vnd.oma.drm.risd+xml�application/vnd.oma.group-usage-list+xml�application/vnd.oma.poc.detailed-progress-report+xml�application/vnd.oma.poc.final-report+xml�application/vnd.oma.poc.groups+xml�application/vnd.oma.poc.invocation-descriptor+xml�application/vnd.oma.poc.optimized-progress-report+xml�application/vnd.oma.xcap-directory+xml�application/vnd.omads-email+xml�application/vnd.omads-file+xml�application/vnd.omads-folder+xml�application/vnd.omaloc-supl-init�application/vnd.openofficeorg.extension�application/vnd.osa.netdeploy�application/vnd.osgi.bundle�application/vnd.osgi.dp�application/vnd.otps.ct-kip+xml�application/vnd.palm�application/vnd.paos.xml�application/vnd.pg.format�application/vnd.pg.osasli�application/vnd.piaccess.application-licence�application/vnd.picsel�application/vnd.poc.group-advertisement+xml�application/vnd.pocketlearn�application/vnd.powerbuilder6�application/vnd.powerbuilder6-s�application/vnd.powerbuilder7�application/vnd.powerbuilder7-s�application/vnd.powerbuilder75�application/vnd.powerbuilder75-s�application/vnd.preminet�application/vnd.previewsystems.box�application/vnd.proteus.magazine�application/vnd.publishare-delta-tree�application/vnd.pvi.ptid1�application/vnd.pwg-multiplexed�application/vnd.pwg-xhtml-print+xml�application/vnd.qualcomm.brew-app-res�application/vnd.rapid�application/vnd.recordare.musicxml�application/vnd.recordare.musicxml+xml�application/vnd.ruckus.download�application/vnd.s3sms�application/vnd.sbm.mid2�application/vnd.scribus�application/vnd.sealed.3df�application/vnd.sealed.csf�application/vnd.sealed.doc�application/vnd.sealed.eml�application/vnd.sealed.mht�application/vnd.sealed.net�application/vnd.sealed.ppt�application/vnd.sealed.tiff�application/vnd.sealed.xls�application/vnd.sealedmedia.softseal.html�application/vnd.sealedmedia.softseal.pdf�application/vnd.seemail�application/vnd.sema�application/vnd.semd�application/vnd.semf�application/vnd.shana.informed.formdata�application/vnd.shana.informed.formtemplate�application/vnd.shana.informed.interchange�application/vnd.shana.informed.package�application/vnd.smaf�application/vnd.solent.sdkm+xml�application/vnd.spotfire.dxp�application/vnd.spotfire.sfs�application/vnd.sss-cod�application/vnd.sss-dtf�application/vnd.sss-ntf�application/vnd.street-stream�application/vnd.sun.wadl+xml�application/vnd.sus-calendar�application/vnd.svd�application/vnd.swiftview-ics�application/vnd.syncml+xml�application/vnd.syncml.dm+wbxml�application/vnd.syncml.dm+xml�application/vnd.syncml.ds.notification�application/vnd.tao.intent-module-archive�application/vnd.tmobile-livetv�application/vnd.trid.tpt�application/vnd.triscape.mxs�application/vnd.trueapp�application/vnd.truedoc�application/vnd.ufdl�application/vnd.uiq.theme�application/vnd.umajin�application/vnd.unity�application/vnd.uoml+xml�application/vnd.uplanet.alert�application/vnd.uplanet.alert-wbxml�application/vnd.uplanet.bearer-choice�application/vnd.uplanet.bearer-choice-wbxml�application/vnd.uplanet.cacheop�application/vnd.uplanet.cacheop-wbxml�application/vnd.uplanet.channel�application/vnd.uplanet.channel-wbxml�application/vnd.uplanet.list�application/vnd.uplanet.list-wbxml�application/vnd.uplanet.listcmd�application/vnd.uplanet.listcmd-wbxml�application/vnd.uplanet.signal�application/vnd.vcx�application/vnd.vd-study�application/vnd.vectorworks�application/vnd.vidsoft.vidconference�application/vnd.visio�application/vnd.visionary�application/vnd.vividence.scriptfile�application/vnd.vsf�application/vnd.wap.sic�application/vnd.wap.slc�application/vnd.wap.wbxml�application/vnd.wap.wmlc�application/vnd.wap.wmlscriptc�application/vnd.webturbo�application/vnd.wfa.wsc�application/vnd.wmc�application/vnd.wmf.bootstrap�application/vnd.wordperfect�application/vnd.wqd�application/vnd.wrq-hp3000-labelled�application/vnd.wt.stf�application/vnd.wv.csp+wbxml�application/vnd.wv.csp+xml�application/vnd.wv.ssp+xml�application/vnd.xara�application/vnd.xfdl�application/vnd.xmpie.cpkg�application/vnd.xmpie.dpkg�application/vnd.xmpie.plan�application/vnd.xmpie.ppkg�application/vnd.xmpie.xlim�application/vnd.yamaha.hv-dic�application/vnd.yamaha.hv-script�application/vnd.yamaha.hv-voice�application/vnd.yamaha.smaf-audio�application/vnd.yamaha.smaf-phrase�application/vnd.yellowriver-custom-menu�application/vnd.zzazz.deck+xml�application/voicexml+xml�application/watcherinfo+xml�application/whoispp-query�application/whoispp-response�application/wita�application/wordperfect5.1�application/wsdl+xml�application/wspolicy+xml�application/x400-bp�application/xcap-att+xml�application/xcap-caps+xml�application/xcap-el+xml�application/xcap-error+xml�application/xcap-ns+xml�application/xenc+xml�application/xhtml+xml�application/xhtml-voice+xml (Obsolete)�application/xml�application/xml-dtd�application/xml-external-parsed-entity�application/xmpp+xml�application/xop+xml�application/xv+xml�application/zip�audio/32kadpcm�audio/3gpp�audio/3gpp2�audio/AMR�audio/AMR-WB�audio/BV16�audio/BV32�audio/CN�audio/DAT12�audio/DVI4�audio/EVRC�audio/EVRC-QCP�audio/EVRC0�audio/EVRC1�audio/EVRCB�audio/EVRCB0�audio/EVRCB1�audio/EVRCWB�audio/EVRCWB0�audio/EVRCWB1�audio/G722�audio/G7221�audio/G723�audio/G726-16�audio/G726-24�audio/G726-32�audio/G726-40�audio/G728�audio/G729�audio/G7291�audio/G729D�audio/G729E�audio/GSM�audio/GSM-EFR�audio/L16�audio/L20�audio/L24�audio/L8�audio/LPC�audio/MP4A-LATM�audio/MPA�audio/PCMA�audio/PCMU�audio/QCELP�audio/RED�audio/SMV�audio/SMV-QCP�audio/SMV0�audio/VDVI�audio/VMR-WB�audio/ac3�audio/amr-wb+�audio/asc�audio/basic�audio/clearmode�audio/dls�audio/dsr-es201108�audio/dsr-es202050�audio/dsr-es202211�audio/dsr-es202212�audio/eac3�audio/example�audio/iLBC�audio/mobile-xmf�audio/mp4�audio/mpa-robust�audio/mpeg�audio/mpeg4-generic�audio/parityfec�audio/prs.sid�audio/rRFC2045tp-midi�audio/rtp-enc-aescm128�audio/rtx�audio/sp-midi�audio/t140c�audio/t38�audio/telephone-event�audio/tone�audio/ulpfec�audio/vnd.3gpp.iufp�audio/vnd.4SB�audio/vnd.CELP�audio/vnd.audiokoz�audio/vnd.cisco.nse�audio/vnd.cmles.radio-events�audio/vnd.cns.anp1�audio/vnd.cns.inf1�audio/vnd.digital-winds�audio/vnd.dlna.adts�audio/vnd.dolby.mlp�audio/vnd.everad.plj�audio/vnd.hns.audio�audio/vnd.lucent.voice�audio/vnd.nokia.mobile-xmf�audio/vnd.nortel.vbk�audio/vnd.nuera.ecelp4800�audio/vnd.nuera.ecelp7470�audio/vnd.nuera.ecelp9600�audio/vnd.octel.sbc�audio/vnd.qcelp - DEPRECATED - Please use audio/qcelp�audio/vnd.rhetorex.32kadpcm�audio/vnd.sealedmedia.softseal.mpeg�audio/vnd.vmx.cvsd�image/cgm�image/example�image/fits�image/g3fax�image/gif�image/ief�image/jp2�image/jpeg�image/jpm�image/jpx�image/naplps�image/png�image/prs.btif�image/prs.pti�image/t38�image/tiff�image/tiff-fx�image/vnd.adobe.photoshop�image/vnd.cns.inf2�image/vnd.djvu�image/vnd.dwg�image/vnd.dxf�image/vnd.fastbidsheet�image/vnd.fpx�image/vnd.fst�image/vnd.fujixerox.edmics-mmr�image/vnd.fujixerox.edmics-rlc�image/vnd.globalgraphics.pgb�image/vnd.microsoft.icon�image/vnd.mix�image/vnd.ms-modi�image/vnd.net-fpx�image/vnd.sealed.png�image/vnd.sealedmedia.softseal.gif�image/vnd.sealedmedia.softseal.jpg�image/vnd.svf�image/vnd.wap.wbmp�image/vnd.xiff�message/CPIM�message/delivery-status�message/disposition-notification�message/example�message/external-body�message/http�message/news�message/partial�message/rfc822�message/s-http�message/sip�message/sipfrag�message/tracking-status�message/vnd.si.simp�model/example�model/iges�model/mesh�model/vnd.dwf�model/vnd.flatland.3dml�model/vnd.gdl�model/vnd.gs-gdl�model/vnd.gtw�model/vnd.moml+xml�model/vnd.mts�model/vnd.parasolid.transmit.binary�model/vnd.parasolid.transmit.text�model/vnd.vtu�model/vrml�multipart/alternative�multipart/appledouble�multipart/byteranges�multipart/digest�multipart/encrypted�multipart/example�multipart/form-data�multipart/header-set�multipart/mixed�multipart/parallel�multipart/related�multipart/report�multipart/signed�multipart/voice-message�text/RED�text/calendar�text/css�text/csv�text/directory�text/dns�text/ecmascript (obsolete)�text/enriched�text/example�text/html�text/javascript (obsolete)�text/parityfec�text/plain�text/prs.fallenstein.rst�text/prs.lines.tag�text/rfc822-headers�text/richtext�text/rtf�text/rtp-enc-aescm128�text/rtx�text/sgml�text/t140�text/tab-separated-values�text/troff�text/ulpfec�text/uri-list�text/vnd.DMClientScript�text/vnd.IPTC.NITF�text/vnd.IPTC.NewsML�text/vnd.abc�text/vnd.curl�text/vnd.esmertec.theme-descriptor�text/vnd.fly�text/vnd.fmi.flexstor�text/vnd.in3d.3dml�text/vnd.in3d.spot�text/vnd.latex-z�text/vnd.motorola.reflex�text/vnd.ms-mediapackage�text/vnd.net2phone.commcenter.command�text/vnd.si.uricatalogue�text/vnd.sun.j2me.app-descriptor�text/vnd.trolltech.linguist�text/vnd.wap.si�text/vnd.wap.sl�text/vnd.wap.wml�text/vnd.wap.wmlscript�text/xml�text/xml-external-parsed-entity�video/3gpp�video/3gpp-tt�video/3gpp2�video/BMPEG�video/BT656�video/CelB�video/DV�video/H261�video/H263�video/H263-1998�video/H263-2000�video/H264�video/JPEG�video/MJ2�video/MP1S�video/MP2P�video/MP2T�video/MP4V-ES�video/MPV�video/SMPTE292M�video/example�video/mp4�video/mpeg�video/mpeg4-generic�video/nv�video/parityfec�video/pointer�video/quicktime�video/raw�video/rtp-enc-aescm128�video/rtx�video/ulpfec�video/vc1�video/vnd.dlna.mpeg-tts�video/vnd.fvt�video/vnd.hns.video�video/vnd.iptvforum.1dparityfec-1010�video/vnd.iptvforum.1dparityfec-2005�video/vnd.iptvforum.2dparityfec-1010�video/vnd.iptvforum.2dparityfec-2005�video/vnd.iptvforum.ttsavc�video/vnd.iptvforum.ttsmpeg2�video/vnd.motorola.video�video/vnd.motorola.videop�video/vnd.mpegurl�video/vnd.nokia.interleaved-multimedia�video/vnd.nokia.videovoip�video/vnd.objectvideo�video/vnd.sealed.mpeg1�video/vnd.sealed.mpeg4�video/vnd.sealed.swf�video/vnd.sealedmedia.softseal.mov�video/vnd.vivo�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�application/CSTAdata+xml�application/EDI-Consent�application/EDI-X12�application/EDIFACT�application/H224�application/activemessage�application/andrew-inset�application/applefile�application/atom+xml�application/atomcat+xml�application/atomicmail�application/atomsvc+xml�application/auth-policy+xml�application/batch-SMTP�application/beep+xml�application/cals-1840�application/ccxml+xml�application/cellml+xml�application/cnrp+xml�application/commonground�application/conference-info+xml�application/cpl+xml�application/csta+xml�application/cybercash�application/davmount+xml�application/dca-rft�application/dec-dx�application/dialog-info+xml�application/dicom�application/dns�application/dvcs�application/ecmascript�application/epp+xml�application/eshop�application/example�application/fastinfoset�application/fastsoap�application/fits�application/font-tdpfr�application/http�application/hyperstudio�application/iges�application/im-iscomposing+xml�application/index�application/index.cmd�application/index.obj�application/index.response�application/index.vnd�application/iotp�application/ipp�application/isup�application/javascript�application/json�application/kpml-request+xml�application/kpml-response+xml�application/mac-binhex40�application/macwriteii�application/marc�application/mathematica�application/mbms-associated-procedure-description+xml�application/mbms-deregister+xml�application/mbms-envelope+xml�application/mbms-msk+xml�application/mbms-msk-response+xml�application/mbms-protection-description+xml�application/mbms-reception-report+xml�application/mbms-register+xml�application/mbms-register-response+xml�application/mbms-user-service-description+xml�application/mbox�application/media_control+xml�application/mediaservercontrol+xml�application/mikey�application/moss-keys�application/moss-signature�application/mosskey-data�application/mosskey-request�application/mp4�application/mpeg4-generic�application/mpeg4-iod�application/mpeg4-iod-xmt�application/msword�application/mxf�application/nasdata�application/news-message-id�application/news-transmission�application/nss�application/ocsp-request�application/ocsp-response�application/octet-stream�application/oda�application/oebps-package+xml�application/ogg�application/parityfec�application/pdf�application/pgp-encrypted�application/pgp-keys�application/pgp-signature�application/pidf+xml�application/pkcs10�application/pkcs7-mime�application/pkcs7-signature�application/pkix-cert�application/pkix-crl�application/pkix-pkipath�application/pkixcmp�application/pls+xml�application/poc-settings+xml�application/postscript�application/prs.alvestrand.titrax-sheet�application/prs.cww�application/prs.nprend�application/prs.plucker�application/qsig�application/rdf+xml�application/reginfo+xml�application/relax-ng-compact-syntax�application/remote-printing�application/resource-lists+xml�application/riscos�application/rlmi+xml�application/rls-services+xml�application/rtf�application/rtx�application/samlassertion+xml�application/samlmetadata+xml�application/sbml+xml�application/scvp-cv-request�application/scvp-cv-response�application/scvp-vp-request�application/scvp-vp-response�application/sdp�application/set-payment�application/set-payment-initiation�application/set-registration�application/set-registration-initiation�application/sgml�application/sgml-open-catalog�application/shf+xml�application/sieve�application/simple-filter+xml�application/simple-message-summary�application/simpleSymbolContainer�application/slate�application/smil (OBSOLETE)�application/smil+xml�application/soap+fastinfoset�application/soap+xml�application/sparql-query�application/sparql-results+xml�application/spirits-event+xml�application/srgs�application/srgs+xml�application/ssml+xml�application/timestamp-query�application/timestamp-reply�application/tve-trigger�application/ulpfec�application/vemmi�application/vnd.3M.Post-it-Notes�application/vnd.3gpp.bsf+xml�application/vnd.3gpp.pic-bw-large�application/vnd.3gpp.pic-bw-small�application/vnd.3gpp.pic-bw-var�application/vnd.3gpp.sms�application/vnd.3gpp2.bcmcsinfo+xml�application/vnd.3gpp2.sms�application/vnd.3gpp2.tcap�application/vnd.FloGraphIt�application/vnd.HandHeld-Entertainment+xml�application/vnd.Kinar�application/vnd.MFER�application/vnd.Mobius.DAF�application/vnd.Mobius.DIS�application/vnd.Mobius.MBK�application/vnd.Mobius.MQY�application/vnd.Mobius.MSL�application/vnd.Mobius.PLC�application/vnd.Mobius.TXF�application/vnd.Quark.QuarkXPress�application/vnd.RenLearn.rlprint�application/vnd.SimTech-MindMapper�application/vnd.accpac.simply.aso�application/vnd.accpac.simply.imp�application/vnd.acucobol�application/vnd.acucorp�application/vnd.adobe.xdp+xml�application/vnd.adobe.xfdf�application/vnd.aether.imp�application/vnd.americandynamics.acc�application/vnd.amiga.ami�application/vnd.anser-web-certificate-issue-initiation�application/vnd.antix.game-component�application/vnd.apple.installer+xml�application/vnd.audiograph�application/vnd.autopackage�application/vnd.avistar+xml�application/vnd.blueice.multipass�application/vnd.bmi�application/vnd.businessobjects�application/vnd.cab-jscript�application/vnd.canon-cpdl�application/vnd.canon-lips�application/vnd.cendio.thinlinc.clientconf�application/vnd.chemdraw+xml�application/vnd.chipnuts.karaoke-mmd�application/vnd.cinderella�application/vnd.cirpack.isdn-ext�application/vnd.claymore�application/vnd.clonk.c4group�application/vnd.commerce-battelle�application/vnd.commonspace�application/vnd.contact.cmsg�application/vnd.cosmocaller�application/vnd.crick.clicker�application/vnd.crick.clicker.keyboard�application/vnd.crick.clicker.palette�application/vnd.crick.clicker.template�application/vnd.crick.clicker.wordbank�application/vnd.criticaltools.wbs+xml�application/vnd.ctc-posml�application/vnd.ctct.ws+xml�application/vnd.cups-pdf�application/vnd.cups-postscript�application/vnd.cups-ppd�application/vnd.cups-raster�application/vnd.cups-raw�application/vnd.curl�application/vnd.cybank�application/vnd.data-vision.rdz�application/vnd.denovo.fcselayout-link�application/vnd.dna�application/vnd.dpgraph�application/vnd.dreamfactory�application/vnd.dvb.esgcontainer�application/vnd.dvb.ipdcesgaccess�application/vnd.dxr�application/vnd.ecdis-update�application/vnd.ecowin.chart�application/vnd.ecowin.filerequest�application/vnd.ecowin.fileupdate�application/vnd.ecowin.series�application/vnd.ecowin.seriesrequest�application/vnd.ecowin.seriesupdate�application/vnd.enliven�application/vnd.epson.esf�application/vnd.epson.msf�application/vnd.epson.quickanime�application/vnd.epson.salt�application/vnd.epson.ssf�application/vnd.ericsson.quickcall�application/vnd.eszigno3+xml�application/vnd.eudora.data�application/vnd.ezpix-album�application/vnd.ezpix-package�application/vnd.fdf�application/vnd.ffsns�application/vnd.fints�application/vnd.fluxtime.clip�application/vnd.framemaker�application/vnd.frogans.fnc�application/vnd.frogans.ltf�application/vnd.fsc.weblaunch�application/vnd.fujitsu.oasys�application/vnd.fujitsu.oasys2�application/vnd.fujitsu.oasys3�application/vnd.fujitsu.oasysgp�application/vnd.fujitsu.oasysprs�application/vnd.fujixerox.ART-EX�application/vnd.fujixerox.ART4�application/vnd.fujixerox.HBPL�application/vnd.fujixerox.ddd�application/vnd.fujixerox.docuworks�application/vnd.fujixerox.docuworks.binder�application/vnd.fut-misnet�application/vnd.fuzzysheet�application/vnd.genomatix.tuxedo�application/vnd.google-earth.kml+xml�application/vnd.google-earth.kmz�application/vnd.grafeq�application/vnd.gridmp�application/vnd.groove-account�application/vnd.groove-help�application/vnd.groove-identity-message�application/vnd.groove-injector�application/vnd.groove-tool-message�application/vnd.groove-tool-template�application/vnd.groove-vcard�application/vnd.hbci�application/vnd.hcl-bireports�application/vnd.hhe.lesson-player�application/vnd.hp-HPGL�application/vnd.hp-PCL�application/vnd.hp-PCLXL�application/vnd.hp-hpid�application/vnd.hp-hps�application/vnd.hp-jlyt�application/vnd.httphone�application/vnd.hzn-3d-crossword�application/vnd.ibm.MiniPay�application/vnd.ibm.afplinedata�application/vnd.ibm.electronic-media�application/vnd.ibm.modcap�application/vnd.ibm.rights-management�application/vnd.ibm.secure-container�application/vnd.iccprofile�application/vnd.igloader�application/vnd.immervision-ivp�application/vnd.immervision-ivu�application/vnd.informedcontrol.rms+xml�application/vnd.informix-visionary�application/vnd.intercon.formnet�application/vnd.intertrust.digibox�application/vnd.intertrust.nncp�application/vnd.intu.qbo�application/vnd.intu.qfx�application/vnd.ipunplugged.rcprofile�application/vnd.irepository.package+xml�application/vnd.is-xpr�application/vnd.jam�application/vnd.japannet-directory-service�application/vnd.japannet-jpnstore-wakeup�application/vnd.japannet-payment-wakeup�application/vnd.japannet-registration�application/vnd.japannet-registration-wakeup�application/vnd.japannet-setstore-wakeup�application/vnd.japannet-verification�application/vnd.japannet-verification-wakeup�application/vnd.jcp.javame.midlet-rms�application/vnd.jisp�application/vnd.joost.joda-archive�application/vnd.kahootz�application/vnd.kde.karbon�application/vnd.kde.kchart�application/vnd.kde.kformula�application/vnd.kde.kivio�application/vnd.kde.kontour�application/vnd.kde.kpresenter�application/vnd.kde.kspread�application/vnd.kde.kword�application/vnd.kenameaapp�application/vnd.kidspiration�application/vnd.koan�application/vnd.kodak-descriptor�application/vnd.liberty-request+xml�application/vnd.llamagraphics.life-balance.desktop�application/vnd.llamagraphics.life-balance.exchange+xml�application/vnd.lotus-1-2-3�application/vnd.lotus-approach�application/vnd.lotus-freelance�application/vnd.lotus-notes�application/vnd.lotus-organizer�application/vnd.lotus-screencam�application/vnd.lotus-wordpro�application/vnd.macports.portpkg�application/vnd.marlin.drm.actiontoken+xml�application/vnd.marlin.drm.conftoken+xml�application/vnd.marlin.drm.mdcf�application/vnd.mcd�application/vnd.medcalcdata�application/vnd.mediastation.cdkey�application/vnd.meridian-slingshot�application/vnd.mfmp�application/vnd.micrografx.flo�application/vnd.micrografx.igx�application/vnd.mif�application/vnd.minisoft-hp3000-save�application/vnd.mitsubishi.misty-guard.trustweb�application/vnd.mophun.application�application/vnd.mophun.certificate�application/vnd.motorola.flexsuite�application/vnd.motorola.flexsuite.adsi�application/vnd.motorola.flexsuite.fis�application/vnd.motorola.flexsuite.gotap�application/vnd.motorola.flexsuite.kmr�application/vnd.motorola.flexsuite.ttc�application/vnd.motorola.flexsuite.wem�application/vnd.mozilla.xul+xml�application/vnd.ms-artgalry�application/vnd.ms-asf�application/vnd.ms-cab-compressed�application/vnd.ms-excel�application/vnd.ms-fontobject�application/vnd.ms-htmlhelp�application/vnd.ms-ims�application/vnd.ms-lrm�application/vnd.ms-playready.initiator+xml�application/vnd.ms-powerpoint�application/vnd.ms-project�application/vnd.ms-tnef�application/vnd.ms-wmdrm.lic-chlg-req�application/vnd.ms-wmdrm.lic-resp�application/vnd.ms-wmdrm.meter-chlg-req�application/vnd.ms-wmdrm.meter-resp�application/vnd.ms-works�application/vnd.ms-wpl�application/vnd.ms-xpsdocument�application/vnd.mseq�application/vnd.msign�application/vnd.multiad.creator�application/vnd.multiad.creator.cif�application/vnd.music-niff�application/vnd.musician�application/vnd.muvee.style�application/vnd.ncd.control�application/vnd.ncd.reference�application/vnd.nervana�application/vnd.netfpx�application/vnd.neurolanguage.nlu�application/vnd.noblenet-directory�application/vnd.noblenet-sealer�application/vnd.noblenet-web�application/vnd.nokia.catalogs�application/vnd.nokia.conml+wbxml�application/vnd.nokia.conml+xml�application/vnd.nokia.iSDS-radio-presets�application/vnd.nokia.iptv.config+xml�application/vnd.nokia.landmark+wbxml�application/vnd.nokia.landmark+xml�application/vnd.nokia.landmarkcollection+xml�application/vnd.nokia.n-gage.ac+xml�application/vnd.nokia.n-gage.data�application/vnd.nokia.n-gage.symbian.install�application/vnd.nokia.ncd�application/vnd.nokia.pcd+wbxml�application/vnd.nokia.pcd+xml�application/vnd.nokia.radio-preset�application/vnd.nokia.radio-presets�application/vnd.novadigm.EDM�application/vnd.novadigm.EDX�application/vnd.novadigm.EXT�application/vnd.oasis.opendocument.chart�application/vnd.oasis.opendocument.chart-template�application/vnd.oasis.opendocument.formula�application/vnd.oasis.opendocument.formula-template�application/vnd.oasis.opendocument.graphics�application/vnd.oasis.opendocument.graphics-template�application/vnd.oasis.opendocument.image�application/vnd.oasis.opendocument.image-template�application/vnd.oasis.opendocument.presentation�application/vnd.oasis.opendocument.presentation-template�application/vnd.oasis.opendocument.spreadsheet�application/vnd.oasis.opendocument.spreadsheet-template�application/vnd.oasis.opendocument.text�application/vnd.oasis.opendocument.text-master�application/vnd.oasis.opendocument.text-template�application/vnd.oasis.opendocument.text-web�application/vnd.obn�application/vnd.olpc-sugar�application/vnd.oma-scws-config�application/vnd.oma-scws-http-request�application/vnd.oma-scws-http-response�application/vnd.oma.bcast.associated-procedure-parameter+xml�application/vnd.oma.bcast.drm-trigger+xml�application/vnd.oma.bcast.imd+xml�application/vnd.oma.bcast.ltkm�application/vnd.oma.bcast.notification+xml�application/vnd.oma.bcast.sgboot�application/vnd.oma.bcast.sgdd+xml�application/vnd.oma.bcast.sgdu�application/vnd.oma.bcast.simple-symbol-container�application/vnd.oma.bcast.smartcard-trigger+xml�application/vnd.oma.bcast.sprov+xml�application/vnd.oma.bcast.stkm�application/vnd.oma.dd2+xml�application/vnd.oma.drm.risd+xml�application/vnd.oma.group-usage-list+xml�application/vnd.oma.poc.detailed-progress-report+xml�application/vnd.oma.poc.final-report+xml�application/vnd.oma.poc.groups+xml�application/vnd.oma.poc.invocation-descriptor+xml�application/vnd.oma.poc.optimized-progress-report+xml�application/vnd.oma.xcap-directory+xml�application/vnd.omads-email+xml�application/vnd.omads-file+xml�application/vnd.omads-folder+xml�application/vnd.omaloc-supl-init�application/vnd.openofficeorg.extension�application/vnd.osa.netdeploy�application/vnd.osgi.bundle�application/vnd.osgi.dp�application/vnd.otps.ct-kip+xml�application/vnd.palm�application/vnd.paos.xml�application/vnd.pg.format�application/vnd.pg.osasli�application/vnd.piaccess.application-licence�application/vnd.picsel�application/vnd.poc.group-advertisement+xml�application/vnd.pocketlearn�application/vnd.powerbuilder6�application/vnd.powerbuilder6-s�application/vnd.powerbuilder7�application/vnd.powerbuilder7-s�application/vnd.powerbuilder75�application/vnd.powerbuilder75-s�application/vnd.preminet�application/vnd.previewsystems.box�application/vnd.proteus.magazine�application/vnd.publishare-delta-tree�application/vnd.pvi.ptid1�application/vnd.pwg-multiplexed�application/vnd.pwg-xhtml-print+xml�application/vnd.qualcomm.brew-app-res�application/vnd.rapid�application/vnd.recordare.musicxml�application/vnd.recordare.musicxml+xml�application/vnd.ruckus.download�application/vnd.s3sms�application/vnd.sbm.mid2�application/vnd.scribus�application/vnd.sealed.3df�application/vnd.sealed.csf�application/vnd.sealed.doc�application/vnd.sealed.eml�application/vnd.sealed.mht�application/vnd.sealed.net�application/vnd.sealed.ppt�application/vnd.sealed.tiff�application/vnd.sealed.xls�application/vnd.sealedmedia.softseal.html�application/vnd.sealedmedia.softseal.pdf�application/vnd.seemail�application/vnd.sema�application/vnd.semd�application/vnd.semf�application/vnd.shana.informed.formdata�application/vnd.shana.informed.formtemplate�application/vnd.shana.informed.interchange�application/vnd.shana.informed.package�application/vnd.smaf�application/vnd.solent.sdkm+xml�application/vnd.spotfire.dxp�application/vnd.spotfire.sfs�application/vnd.sss-cod�application/vnd.sss-dtf�application/vnd.sss-ntf�application/vnd.street-stream�application/vnd.sun.wadl+xml�application/vnd.sus-calendar�application/vnd.svd�application/vnd.swiftview-ics�application/vnd.syncml+xml�application/vnd.syncml.dm+wbxml�application/vnd.syncml.dm+xml�application/vnd.syncml.ds.notification�application/vnd.tao.intent-module-archive�application/vnd.tmobile-livetv�application/vnd.trid.tpt�application/vnd.triscape.mxs�application/vnd.trueapp�application/vnd.truedoc�application/vnd.ufdl�application/vnd.uiq.theme�application/vnd.umajin�application/vnd.unity�application/vnd.uoml+xml�application/vnd.uplanet.alert�application/vnd.uplanet.alert-wbxml�application/vnd.uplanet.bearer-choice�application/vnd.uplanet.bearer-choice-wbxml�application/vnd.uplanet.cacheop�application/vnd.uplanet.cacheop-wbxml�application/vnd.uplanet.channel�application/vnd.uplanet.channel-wbxml�application/vnd.uplanet.list�application/vnd.uplanet.list-wbxml�application/vnd.uplanet.listcmd�application/vnd.uplanet.listcmd-wbxml�application/vnd.uplanet.signal�application/vnd.vcx�application/vnd.vd-study�application/vnd.vectorworks�application/vnd.vidsoft.vidconference�application/vnd.visio�application/vnd.visionary�application/vnd.vividence.scriptfile�application/vnd.vsf�application/vnd.wap.sic�application/vnd.wap.slc�application/vnd.wap.wbxml�application/vnd.wap.wmlc�application/vnd.wap.wmlscriptc�application/vnd.webturbo�application/vnd.wfa.wsc�application/vnd.wmc�application/vnd.wmf.bootstrap�application/vnd.wordperfect�application/vnd.wqd�application/vnd.wrq-hp3000-labelled�application/vnd.wt.stf�application/vnd.wv.csp+wbxml�application/vnd.wv.csp+xml�application/vnd.wv.ssp+xml�application/vnd.xara�application/vnd.xfdl�application/vnd.xmpie.cpkg�application/vnd.xmpie.dpkg�application/vnd.xmpie.plan�application/vnd.xmpie.ppkg�application/vnd.xmpie.xlim�application/vnd.yamaha.hv-dic�application/vnd.yamaha.hv-script�application/vnd.yamaha.hv-voice�application/vnd.yamaha.smaf-audio�application/vnd.yamaha.smaf-phrase�application/vnd.yellowriver-custom-menu�application/vnd.zzazz.deck+xml�application/voicexml+xml�application/watcherinfo+xml�application/whoispp-query�application/whoispp-response�application/wita�application/wordperfect5.1�application/wsdl+xml�application/wspolicy+xml�application/x400-bp�application/xcap-att+xml�application/xcap-caps+xml�application/xcap-el+xml�application/xcap-error+xml�application/xcap-ns+xml�application/xenc+xml�application/xhtml+xml�application/xhtml-voice+xml (Obsolete)�application/xml�application/xml-dtd�application/xml-external-parsed-entity�application/xmpp+xml�application/xop+xml�application/xv+xml�application/zip�audio/32kadpcm�audio/3gpp�audio/3gpp2�audio/AMR�audio/AMR-WB�audio/BV16�audio/BV32�audio/CN�audio/DAT12�audio/DVI4�audio/EVRC�audio/EVRC-QCP�audio/EVRC0�audio/EVRC1�audio/EVRCB�audio/EVRCB0�audio/EVRCB1�audio/EVRCWB�audio/EVRCWB0�audio/EVRCWB1�audio/G722�audio/G7221�audio/G723�audio/G726-16�audio/G726-24�audio/G726-32�audio/G726-40�audio/G728�audio/G729�audio/G7291�audio/G729D�audio/G729E�audio/GSM�audio/GSM-EFR�audio/L16�audio/L20�audio/L24�audio/L8�audio/LPC�audio/MP4A-LATM�audio/MPA�audio/PCMA�audio/PCMU�audio/QCELP�audio/RED�audio/SMV�audio/SMV-QCP�audio/SMV0�audio/VDVI�audio/VMR-WB�audio/ac3�audio/amr-wb+�audio/asc�audio/basic�audio/clearmode�audio/dls�audio/dsr-es201108�audio/dsr-es202050�audio/dsr-es202211�audio/dsr-es202212�audio/eac3�audio/example�audio/iLBC�audio/mobile-xmf�audio/mp4�audio/mpa-robust�audio/mpeg�audio/mpeg4-generic�audio/parityfec�audio/prs.sid�audio/rRFC2045tp-midi�audio/rtp-enc-aescm128�audio/rtx�audio/sp-midi�audio/t140c�audio/t38�audio/telephone-event�audio/tone�audio/ulpfec�audio/vnd.3gpp.iufp�audio/vnd.4SB�audio/vnd.CELP�audio/vnd.audiokoz�audio/vnd.cisco.nse�audio/vnd.cmles.radio-events�audio/vnd.cns.anp1�audio/vnd.cns.inf1�audio/vnd.digital-winds�audio/vnd.dlna.adts�audio/vnd.dolby.mlp�audio/vnd.everad.plj�audio/vnd.hns.audio�audio/vnd.lucent.voice�audio/vnd.nokia.mobile-xmf�audio/vnd.nortel.vbk�audio/vnd.nuera.ecelp4800�audio/vnd.nuera.ecelp7470�audio/vnd.nuera.ecelp9600�audio/vnd.octel.sbc�audio/vnd.qcelp - DEPRECATED - Please use audio/qcelp�audio/vnd.rhetorex.32kadpcm�audio/vnd.sealedmedia.softseal.mpeg�audio/vnd.vmx.cvsd�image/cgm�image/example�image/fits�image/g3fax�image/gif�image/ief�image/jp2�image/jpeg�image/jpm�image/jpx�image/naplps�image/png�image/prs.btif�image/prs.pti�image/t38�image/tiff�image/tiff-fx�image/vnd.adobe.photoshop�image/vnd.cns.inf2�image/vnd.djvu�image/vnd.dwg�image/vnd.dxf�image/vnd.fastbidsheet�image/vnd.fpx�image/vnd.fst�image/vnd.fujixerox.edmics-mmr�image/vnd.fujixerox.edmics-rlc�image/vnd.globalgraphics.pgb�image/vnd.microsoft.icon�image/vnd.mix�image/vnd.ms-modi�image/vnd.net-fpx�image/vnd.sealed.png�image/vnd.sealedmedia.softseal.gif�image/vnd.sealedmedia.softseal.jpg�image/vnd.svf�image/vnd.wap.wbmp�image/vnd.xiff�message/CPIM�message/delivery-status�message/disposition-notification�message/example�message/external-body�message/http�message/news�message/partial�message/rfc822�message/s-http�message/sip�message/sipfrag�message/tracking-status�message/vnd.si.simp�model/example�model/iges�model/mesh�model/vnd.dwf�model/vnd.flatland.3dml�model/vnd.gdl�model/vnd.gs-gdl�model/vnd.gtw�model/vnd.moml+xml�model/vnd.mts�model/vnd.parasolid.transmit.binary�model/vnd.parasolid.transmit.text�model/vnd.vtu�model/vrml�multipart/alternative�multipart/appledouble�multipart/byteranges�multipart/digest�multipart/encrypted�multipart/example�multipart/form-data�multipart/header-set�multipart/mixed�multipart/parallel�multipart/related�multipart/report�multipart/signed�multipart/voice-message�text/RED�text/calendar�text/css�text/csv�text/directory�text/dns�text/ecmascript (obsolete)�text/enriched�text/example�text/html�text/javascript (obsolete)�text/parityfec�text/plain�text/prs.fallenstein.rst�text/prs.lines.tag�text/rfc822-headers�text/richtext�text/rtf�text/rtp-enc-aescm128�text/rtx�text/sgml�text/t140�text/tab-separated-values�text/troff�text/ulpfec�text/uri-list�text/vnd.DMClientScript�text/vnd.IPTC.NITF�text/vnd.IPTC.NewsML�text/vnd.abc�text/vnd.curl�text/vnd.esmertec.theme-descriptor�text/vnd.fly�text/vnd.fmi.flexstor�text/vnd.in3d.3dml�text/vnd.in3d.spot�text/vnd.latex-z�text/vnd.motorola.reflex�text/vnd.ms-mediapackage�text/vnd.net2phone.commcenter.command�text/vnd.si.uricatalogue�text/vnd.sun.j2me.app-descriptor�text/vnd.trolltech.linguist�text/vnd.wap.si�text/vnd.wap.sl�text/vnd.wap.wml�text/vnd.wap.wmlscript�text/xml�text/xml-external-parsed-entity�video/3gpp�video/3gpp-tt�video/3gpp2�video/BMPEG�video/BT656�video/CelB�video/DV�video/H261�video/H263�video/H263-1998�video/H263-2000�video/H264�video/JPEG�video/MJ2�video/MP1S�video/MP2P�video/MP2T�video/MP4V-ES�video/MPV�video/SMPTE292M�video/example�video/mp4�video/mpeg�video/mpeg4-generic�video/nv�video/parityfec�video/pointer�video/quicktime�video/raw�video/rtp-enc-aescm128�video/rtx�video/ulpfec�video/vc1�video/vnd.dlna.mpeg-tts�video/vnd.fvt�video/vnd.hns.video�video/vnd.iptvforum.1dparityfec-1010�video/vnd.iptvforum.1dparityfec-2005�video/vnd.iptvforum.2dparityfec-1010�video/vnd.iptvforum.2dparityfec-2005�video/vnd.iptvforum.ttsavc�video/vnd.iptvforum.ttsmpeg2�video/vnd.motorola.video�video/vnd.motorola.videop�video/vnd.mpegurl�video/vnd.nokia.interleaved-multimedia�video/vnd.nokia.videovoip�video/vnd.objectvideo�video/vnd.sealed.mpeg1�video/vnd.sealed.mpeg4�video/vnd.sealed.swf�video/vnd.sealedmedia.softseal.mov�video/vnd.vivo�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">OP-T01-R003</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[OP-T01-R003]-A Binary Object MIME code attribute MUST be coded using MIME Code Type version 2008 code list</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cbc:EndpointID/@schemeID" mode="M8" priority="1005">
    <svrl:fired-rule context="cbc:EndpointID/@schemeID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�AD:VAT�AL:VAT�AT:GOV�AT:KUR�AT:VAT�BA:VAT�BE:VAT�BG:VAT�CH:VAT�CY:VAT�CZ:VAT�DE:VAT�DK:CPR�DK:CVR�DK:P�DK:SE�DK:VANS�DUNS�EE:VAT�ES:VAT�EU:REID�FI:OVT�FR:SIRENE�FR:SIRET�GB:VAT�GLN�GR:VAT�HR:VAT�HU:VAT�IBAN�IE:VAT�IS:KT�IT:CF�IT:FTI�IT:IPA�IT:SECETI�IT:SIA�IT:VAT�LI:VAT�LT:VAT�LU:VAT�LV:VAT�MC:VAT�ME:VAT�MK:VAT�MT:VAT�NL:ION�NL:KVK�NL:VAT�NO:ORGNR�NO:VAT�PL:VAT�PT:VAT�RO:VAT�RS:VAT�SE:ORGNR�SE:VAT�SI:VAT�SK:VAT�SM:VAT�TR:VAT�VA:VAT�ZZZ�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�AD:VAT�AL:VAT�AT:GOV�AT:KUR�AT:VAT�BA:VAT�BE:VAT�BG:VAT�CH:VAT�CY:VAT�CZ:VAT�DE:VAT�DK:CPR�DK:CVR�DK:P�DK:SE�DK:VANS�DUNS�EE:VAT�ES:VAT�EU:REID�FI:OVT�FR:SIRENE�FR:SIRET�GB:VAT�GLN�GR:VAT�HR:VAT�HU:VAT�IBAN�IE:VAT�IS:KT�IT:CF�IT:FTI�IT:IPA�IT:SECETI�IT:SIA�IT:VAT�LI:VAT�LT:VAT�LU:VAT�LV:VAT�MC:VAT�ME:VAT�MK:VAT�MT:VAT�NL:ION�NL:KVK�NL:VAT�NO:ORGNR�NO:VAT�PL:VAT�PT:VAT�RO:VAT�RS:VAT�SE:ORGNR�SE:VAT�SI:VAT�SK:VAT�SM:VAT�TR:VAT�VA:VAT�ZZZ�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">OP-T01-R004</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[OP-T01-R004]-An Enpoint Identifier Scheme identifier MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:PartyIdentification/cbc:ID/@schemeID" mode="M8" priority="1004">
    <svrl:fired-rule context="cac:PartyIdentification/cbc:ID/@schemeID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�AD:VAT�AL:VAT�AT:GOV�AT:KUR�AT:VAT�BA:VAT�BE:VAT�BG:VAT�CH:VAT�CY:VAT�CZ:VAT�DE:VAT�DK:CPR�DK:CVR�DK:P�DK:SE�DK:VANS�DUNS�EE:VAT�ES:VAT�EU:REID�FI:OVT�FR:SIRENE�FR:SIRET�GB:VAT�GLN�GR:VAT�HR:VAT�HU:VAT�IBAN�IE:VAT�IS:KT�IT:CF�IT:FTI�IT:IPA�IT:SECETI�IT:SIA�IT:VAT�LI:VAT�LT:VAT�LU:VAT�LV:VAT�MC:VAT�ME:VAT�MK:VAT�MT:VAT�NL:ION�NL:KVK�NL:VAT�NO:ORGNR�NO:VAT�PL:VAT�PT:VAT�RO:VAT�RS:VAT�SE:ORGNR�SE:VAT�SI:VAT�SK:VAT�SM:VAT�TR:VAT�VA:VAT�ZZZ�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�AD:VAT�AL:VAT�AT:GOV�AT:KUR�AT:VAT�BA:VAT�BE:VAT�BG:VAT�CH:VAT�CY:VAT�CZ:VAT�DE:VAT�DK:CPR�DK:CVR�DK:P�DK:SE�DK:VANS�DUNS�EE:VAT�ES:VAT�EU:REID�FI:OVT�FR:SIRENE�FR:SIRET�GB:VAT�GLN�GR:VAT�HR:VAT�HU:VAT�IBAN�IE:VAT�IS:KT�IT:CF�IT:FTI�IT:IPA�IT:SECETI�IT:SIA�IT:VAT�LI:VAT�LT:VAT�LU:VAT�LV:VAT�MC:VAT�ME:VAT�MK:VAT�MT:VAT�NL:ION�NL:KVK�NL:VAT�NO:ORGNR�NO:VAT�PL:VAT�PT:VAT�RO:VAT�RS:VAT�SE:ORGNR�SE:VAT�SI:VAT�SK:VAT�SM:VAT�TR:VAT�VA:VAT�ZZZ�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">OP-T01-R005</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[OP-T01-R005]-An Party Identifier Scheme identifier MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:Country/cbc:IdentificationCode" mode="M8" priority="1003">
    <svrl:fired-rule context="cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�AD�AE�AF�AG�AI�AL�AM�AN�AO�AQ�AR�AS�AT�AU�AW�AX�AZ�BA�BB�BD�BE�BF�BG�BH�BI�BJ�BL�BM�BN�BO�BR�BS�BT�BV�BW�BY�BZ�CA�CC�CD�CF�CG�CH�CI�CK�CL�CM�CN�CO�CR�CU�CV�CX�CY�CZ�DE�DJ�DK�DM�DO�DZ�EC�EE�EG�EH�ER�ES�ET�FI�FJ�FK�FM�FO�FR�GA�GB�GD�GE�GF�GG�GH�GI�GL�GM�GN�GP�GQ�GR�GS�GT�GU�GW�GY�HK�HM�HN�HR�HT�HU�ID�IE�IL�IM�IN�IO�IQ�IR�IS�IT�JE�JM�JO�JP�KE�KG�KH�KI�KM�KN�KP�KR�KW�KY�KZ�LA�LB�LC�LI�LK�LR�LS�LT�LU�LV�LY�MA�MC�MD�ME�MF�MG�MH�MK�ML�MM�MN�MO�MP�MQ�MR�MS�MT�MU�MV�MW�MX�MY�MZ�NA�NC�NE�NF�NG�NI�NL�NO�NP�NR�NU�NZ�OM�PA�PE�PF�PG�PH�PK�PL�PM�PN�PR�PS�PT�PW�PY�QA�RO�RS�RU�RW�SA�SB�SC�SD�SE�SG�SH�SI�SJ�SK�SL�SM�SN�SO�SR�ST�SV�SY�SZ�TC�TD�TF�TG�TH�TJ�TK�TL�TM�TN�TO�TR�TT�TV�TW�TZ�UA�UG�UM�US�UY�UZ�VA�VC�VE�VG�VI�VN�VU�WF�WS�YE�YT�ZA�ZM�ZW�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�AD�AE�AF�AG�AI�AL�AM�AN�AO�AQ�AR�AS�AT�AU�AW�AX�AZ�BA�BB�BD�BE�BF�BG�BH�BI�BJ�BL�BM�BN�BO�BR�BS�BT�BV�BW�BY�BZ�CA�CC�CD�CF�CG�CH�CI�CK�CL�CM�CN�CO�CR�CU�CV�CX�CY�CZ�DE�DJ�DK�DM�DO�DZ�EC�EE�EG�EH�ER�ES�ET�FI�FJ�FK�FM�FO�FR�GA�GB�GD�GE�GF�GG�GH�GI�GL�GM�GN�GP�GQ�GR�GS�GT�GU�GW�GY�HK�HM�HN�HR�HT�HU�ID�IE�IL�IM�IN�IO�IQ�IR�IS�IT�JE�JM�JO�JP�KE�KG�KH�KI�KM�KN�KP�KR�KW�KY�KZ�LA�LB�LC�LI�LK�LR�LS�LT�LU�LV�LY�MA�MC�MD�ME�MF�MG�MH�MK�ML�MM�MN�MO�MP�MQ�MR�MS�MT�MU�MV�MW�MX�MY�MZ�NA�NC�NE�NF�NG�NI�NL�NO�NP�NR�NU�NZ�OM�PA�PE�PF�PG�PH�PK�PL�PM�PN�PR�PS�PT�PW�PY�QA�RO�RS�RU�RW�SA�SB�SC�SD�SE�SG�SH�SI�SJ�SK�SL�SM�SN�SO�SR�ST�SV�SY�SZ�TC�TD�TF�TG�TH�TJ�TK�TL�TM�TN�TO�TR�TT�TV�TW�TZ�UA�UG�UM�US�UY�UZ�VA�VC�VE�VG�VI�VN�VU�WF�WS�YE�YT�ZA�ZM�ZW�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">OP-T01-R006</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[OP-T01-R006]-Country codes in an order MUST be coded using ISO code list 3166-1</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="@currencyID" mode="M8" priority="1002">
    <svrl:fired-rule context="@currencyID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�AED�AFN�ALL�AMD�ANG�AOA�ARS�AUD�AWG�AZN�BAM�BBD�BDT�BGN�BHD�BIF�BMD�BND�BOB�BOV�BRL�BSD�BTN�BWP�BYR�BZD�CAD�CDF�CHE�CHF�CHW�CLF�CLP�CNY�COP�COU�CRC�CUP�CVE�CZK�DJF�DKK�DOP�DZD�EEK�EGP�ERN�ETB�EUR�FJD�FKP�GBP�GEL�GHS�GIP�GMD�GNF�GTQ�GWP�GYD�HKD�HNL�HRK�HTG�HUF�IDR�ILS�INR�IQD�IRR�ISK�JMD�JOD�JPY�KES�KGS�KHR�KMF�KPW�KRW�KWD�KYD�KZT�LAK�LBP�LKR�LRD�LSL�LTL�LVL�LYD�MAD�MDL�MGA�MKD�MMK�MNT�MOP�MRO�MUR�MVR�MWK�MXN�MXV�MYR�MZN�NAD�NGN�NIO�NOK�NPR�NZD�OMR�PAB�PEN�PGK�PHP�PKR�PLN�PYG�QAR�RON�RSD�RUB�RWF�SAR�SBD�SCR�SDG�SEK�SGD�SHP�SKK�SLL�SOS�SRD�STD�SVC�SYP�SZL�THB�TJS�TMM�TND�TOP�TRY�TTD�TWD�TZS�UAH�UGX�USD�USN�USS�UYI�UYU�UZS�VEF�VND�VUV�WST�XAF�XAG�XAU�XBA�XBB�XBC�XBD�XCD�XDR�XFU�XOF�XPD�XPF�XTS�XXX�YER�ZAR�ZMK�ZWD�ZWR�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�AED�AFN�ALL�AMD�ANG�AOA�ARS�AUD�AWG�AZN�BAM�BBD�BDT�BGN�BHD�BIF�BMD�BND�BOB�BOV�BRL�BSD�BTN�BWP�BYR�BZD�CAD�CDF�CHE�CHF�CHW�CLF�CLP�CNY�COP�COU�CRC�CUP�CVE�CZK�DJF�DKK�DOP�DZD�EEK�EGP�ERN�ETB�EUR�FJD�FKP�GBP�GEL�GHS�GIP�GMD�GNF�GTQ�GWP�GYD�HKD�HNL�HRK�HTG�HUF�IDR�ILS�INR�IQD�IRR�ISK�JMD�JOD�JPY�KES�KGS�KHR�KMF�KPW�KRW�KWD�KYD�KZT�LAK�LBP�LKR�LRD�LSL�LTL�LVL�LYD�MAD�MDL�MGA�MKD�MMK�MNT�MOP�MRO�MUR�MVR�MWK�MXN�MXV�MYR�MZN�NAD�NGN�NIO�NOK�NPR�NZD�OMR�PAB�PEN�PGK�PHP�PKR�PLN�PYG�QAR�RON�RSD�RUB�RWF�SAR�SBD�SCR�SDG�SEK�SGD�SHP�SKK�SLL�SOS�SRD�STD�SVC�SYP�SZL�THB�TJS�TMM�TND�TOP�TRY�TTD�TWD�TZS�UAH�UGX�USD�USN�USS�UYI�UYU�UZS�VEF�VND�VUV�WST�XAF�XAG�XAU�XBA�XBB�XBC�XBD�XCD�XDR�XFU�XOF�XPD�XPF�XTS�XXX�YER�ZAR�ZMK�ZWD�ZWR�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">OP-T01-R007</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[OP-T01-R007]-currencyID MUST be coded using ISO code list 4217</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:TaxCategory/cbc:ID" mode="M8" priority="1001">
    <svrl:fired-rule context="cac:TaxCategory/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�AA�AE�E�H�S�Z�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�AA�AE�E�H�S�Z�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">OP-T01-R008</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[OP-T01-R008]-A tax category identifier MUST be coded using UN/ECE 5305 BII2 Subset</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="@unitCode" mode="M8" priority="1000">
    <svrl:fired-rule context="@unitCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�10�11�13�14�15�16�17�18�19�1A�1B�1C�1D�1E�1F�1G�1H�1I�1J�1K�1L�1M�1X�20�21�22�23�24�25�26�27�28�29�2A�2B�2C�2G�2H�2I�2J�2K�2L�2M�2N�2P�2Q�2R�2U�2V�2W�2X�2Y�2Z�30�31�32�33�34�35�36�37�38�3B�3C�3E�3G�3H�3I�40�41�43�44�45�46�47�48�4A�4B�4C�4E�4G�4H�4K�4L�4M�4N�4O�4P�4Q�4R�4T�4U�4W�4X�5�53�54�56�57�58�59�5A�5B�5C�5E�5F�5G�5H�5I�5J�5K�5P�5Q�6�60�61�62�63�64�66�69�71�72�73�74�76�77�78�8�80�81�84�85�87�89�90�91�92�93�94�95�96�97�98�A1�A10�A11�A12�A13�A14�A15�A16�A17�A18�A19�A2�A20�A21�A22�A23�A24�A25�A26�A27�A28�A29�A3�A30�A31�A32�A33�A34�A35�A36�A37�A38�A39�A4�A40�A41�A42�A43�A44�A45�A47�A48�A49�A5�A50�A51�A52�A53�A54�A55�A56�A57�A58�A59�A6�A60�A61�A62�A63�A64�A65�A66�A67�A68�A69�A7�A70�A71�A73�A74�A75�A76�A77�A78�A79�A8�A80�A81�A82�A83�A84�A85�A86�A87�A88�A89�A9�A90�A91�A93�A94�A95�A96�A97�A98�A99�AA�AB�ACR�ACT�AD�AE�AH�AI�AJ�AK�AL�AM�AMH�AMP�ANN�AP�APZ�AQ�AR�ARE�AS�ASM�ASU�ATM�ATT�AV�AW�AY�AZ�B0�B1�B10�B11�B12�B13�B14�B15�B16�B17�B18�B19�B2�B20�B21�B22�B23�B24�B25�B26�B27�B28�B29�B3�B30�B31�B32�B33�B34�B35�B36�B37�B38�B39�B4�B40�B41�B42�B43�B44�B45�B46�B47�B48�B49�B5�B50�B51�B52�B53�B54�B55�B56�B57�B58�B59�B6�B60�B61�B62�B63�B64�B65�B66�B67�B68�B69�B7�B70�B71�B72�B73�B74�B75�B76�B77�B78�B79�B8�B80�B81�B82�B83�B84�B85�B86�B87�B88�B89�B9�B90�B91�B92�B93�B94�B95�B96�B97�B98�B99�BAR�BB�BD�BE�BFT�BG�BH�BHP�BIL�BJ�BK�BL�BLD�BLL�BO�BP�BQL�BR�BT�BTU�BUA�BUI�BW�BX�BZ�C0�C1�C10�C11�C12�C13�C14�C15�C16�C17�C18�C19�C2�C20�C21�C22�C23�C24�C25�C26�C27�C28�C29�C3�C30�C31�C32�C33�C34�C35�C36�C37�C38�C39�C4�C40�C41�C42�C43�C44�C45�C46�C47�C48�C49�C5�C50�C51�C52�C53�C54�C55�C56�C57�C58�C59�C6�C60�C61�C62�C63�C64�C65�C66�C67�C68�C69�C7�C70�C71�C72�C73�C74�C75�C76�C77�C78�C79�C8�C80�C81�C82�C83�C84�C85�C86�C87�C88�C89�C9�C90�C91�C92�C93�C94�C95�C96�C97�C98�C99�CA�CCT�CDL�CEL�CEN�CG�CGM�CH�CJ�CK�CKG�CL�CLF�CLT�CMK�CMQ�CMT�CNP�CNT�CO�COU�CQ�CR�CS�CT�CTG�CTM�CTN�CU�CUR�CV�CWA�CWI�CY�CZ�D03�D04�D1�D10�D11�D12�D13�D14�D15�D16�D17�D18�D19�D2�D20�D21�D22�D23�D24�D25�D26�D27�D28�D29�D30�D31�D32�D33�D34�D35�D36�D37�D38�D39�D40�D41�D42�D43�D44�D45�D46�D47�D48�D49�D5�D50�D51�D52�D53�D54�D55�D56�D57�D58�D59�D6�D60�D61�D62�D63�D64�D65�D66�D67�D68�D69�D7�D70�D71�D72�D73�D74�D75�D76�D77�D78�D79�D8�D80�D81�D82�D83�D85�D86�D87�D88�D89�D9�D90�D91�D92�D93�D94�D95�D96�D97�D98�D99�DAA�DAD�DAY�DB�DC�DD�DE�DEC�DG�DI�DJ�DLT�DMA�DMK�DMO�DMQ�DMT�DN�DPC�DPR�DPT�DQ�DR�DRA�DRI�DRL�DRM�DS�DT�DTN�DU�DWT�DX�DY�DZN�DZP�E01�E07�E08�E09�E10�E11�E12�E14�E15�E16�E17�E18�E19�E2�E20�E21�E22�E23�E25�E27�E28�E3�E30�E31�E32�E33�E34�E35�E36�E37�E38�E39�E4�E40�E41�E42�E43�E44�E45�E46�E47�E48�E49�E5�E50�E51�E52�E53�E54�E55�E56�E57�E58�E59�E60�E61�E62�E63�E64�E65�E66�E67�E68�E69�E70�E71�E72�E73�E74�E75�E76�E77�E78�E79�E80�E81�E82�E83�E84�E85�E86�E87�E88�E89�E90�E91�E92�E93�E94�E95�E96�E97�E98�E99�EA�EB�EC�EP�EQ�EV�F01�F02�F03�F04�F05�F06�F07�F08�F1�F10�F11�F12�F13�F14�F15�F16�F17�F18�F19�F20�F21�F22�F23�F24�F25�F26�F27�F28�F29�F30�F31�F32�F33�F34�F35�F36�F37�F38�F39�F40�F41�F42�F43�F44�F45�F46�F47�F48�F49�F50�F51�F52�F53�F54�F55�F56�F57�F58�F59�F60�F61�F62�F63�F64�F65�F66�F67�F68�F69�F70�F71�F72�F73�F74�F75�F76�F77�F78�F79�F80�F81�F82�F83�F84�F85�F86�F87�F88�F89�F9�F90�F91�F92�F93�F94�F95�F96�F97�F98�F99�FAH�FAR�FB�FBM�FC�FD�FE�FF�FG�FH�FIT�FL�FM�FOT�FP�FR�FS�FTK�FTQ�G01�G04�G05�G06�G08�G09�G10�G11�G12�G13�G14�G15�G16�G17�G18�G19�G2�G20�G21�G23�G24�G25�G26�G27�G28�G29�G3�G30�G31�G32�G33�G34�G35�G36�G37�G38�G39�G40�G41�G42�G43�G44�G45�G46�G47�G48�G49�G50�G51�G52�G53�G54�G55�G56�G57�G58�G59�G60�G61�G62�G63�G64�G65�G66�G67�G68�G69�G7�G70�G71�G72�G73�G74�G75�G76�G77�G78�G79�G80�G81�G82�G83�G84�G85�G86�G87�G88�G89�G90�G91�G92�G93�G94�G95�G96�G97�G98�G99�GB�GBQ�GC�GD�GDW�GE�GF�GFI�GGR�GH�GIA�GIC�GII�GIP�GJ�GK�GL�GLD�GLI�GLL�GM�GN�GO�GP�GQ�GRM�GRN�GRO�GRT�GT�GV�GW�GWH�GY�GZ�H03�H04�H05�H06�H07�H08�H09�H1�H10�H11�H12�H13�H14�H15�H16�H18�H19�H2�H20�H21�H22�H23�H24�H25�H26�H27�H28�H29�H30�H31�H32�H33�H34�H35�H36�H37�H38�H39�H40�H41�H42�H43�H44�H45�H46�H47�H48�H49�H50�H51�H52�H53�H54�H55�H56�H57�H58�H59�H60�H61�H62�H63�H64�H65�H66�H67�H68�H69�H70�H71�H72�H73�H74�H75�H76�H77�H78�H79�H80�H81�H82�H83�H84�H85�H87�H88�H89�H90�H91�H92�H93�H94�H95�H96�H98�H99�HA�HAR�HBA�HBX�HC�HD�HDW�HE�HF�HGM�HH�HI�HIU�HJ�HK�HKM�HL�HLT�HM�HMQ�HMT�HN�HO�HP�HPA�HS�HT�HTZ�HUR�HY�IA�IC�IE�IF�II�IL�IM�INH�INK�INQ�IP�ISD�IT�IU�IV�J10�J12�J13�J14�J15�J16�J17�J18�J19�J2�J20�J21�J22�J23�J24�J25�J26�J27�J28�J29�J30�J31�J32�J33�J34�J35�J36�J38�J39�J40�J41�J42�J43�J44�J45�J46�J47�J48�J49�J50�J51�J52�J53�J54�J55�J56�J57�J58�J59�J60�J61�J62�J63�J64�J65�J66�J67�J68�J69�J70�J71�J72�J73�J74�J75�J76�J78�J79�J81�J82�J83�J84�J85�J87�J89�J90�J91�J92�J93�J94�J95�J96�J97�J98�J99�JB�JE�JG�JK�JM�JNT�JO�JOU�JPS�JR�JWL�K1�K10�K11�K12�K13�K14�K15�K16�K17�K18�K19�K2�K20�K21�K22�K23�K24�K25�K26�K27�K28�K3�K30�K31�K32�K33�K34�K35�K36�K37�K38�K39�K40�K41�K42�K43�K45�K46�K47�K48�K49�K5�K50�K51�K52�K53�K54�K55�K58�K59�K6�K60�K61�K62�K63�K64�K65�K66�K67�K68�K69�K70�K71�K73�K74�K75�K76�K77�K78�K79�K80�K81�K82�K83�K84�K85�K86�K87�K88�K89�K90�K91�K92�K93�K94�K95�K96�K97�K98�K99�KA�KAT�KB�KBA�KCC�KD�KDW�KEL�KF�KG�KGM�KGS�KHY�KHZ�KI�KIC�KIP�KJ�KJO�KL�KLK�KMA�KMH�KMK�KMQ�KMT�KNI�KNS�KNT�KO�KPA�KPH�KPO�KPP�KR�KS�KSD�KSH�KT�KTM�KTN�KUR�KVA�KVR�KVT�KW�KWH�KWO�KWT�KX�L10�L11�L12�L13�L14�L15�L16�L17�L18�L19�L2�L20�L21�L23�L24�L25�L26�L27�L28�L29�L30�L31�L32�L33�L34�L35�L36�L37�L38�L39�L40�L41�L42�L43�L44�L45�L46�L47�L48�L49�L50�L51�L52�L53�L54�L55�L56�L57�L58�L59�L60�L61�L62�L63�L64�L65�L66�L67�L68�L69�L70�L71�L72�L73�L74�L75�L76�L77�L78�L79�L80�L81�L82�L83�L84�L85�L86�L87�L88�L89�L90�L91�L92�L93�L94�L95�L96�L98�L99�LA�LAC�LBR�LBT�LC�LD�LE�LEF�LF�LH�LI�LJ�LK�LM�LN�LO�LP�LPA�LR�LS�LTN�LTR�LUB�LUM�LUX�LX�LY�M0�M1�M10�M11�M12�M13�M14�M15�M16�M17�M18�M19�M20�M21�M22�M23�M24�M25�M26�M27�M29�M30�M31�M32�M33�M34�M35�M36�M37�M4�M5�M7�M9�MA�MAH�MAL�MAM�MAR�MAW�MBE�MBF�MBR�MC�MCU�MD�MF�MGM�MHZ�MIK�MIL�MIN�MIO�MIU�MK�MLD�MLT�MMK�MMQ�MMT�MND�MON�MPA�MQ�MQH�MQS�MSK�MT�MTK�MTQ�MTR�MTS�MV�MVA�MWH�N1�N2�N3�NA�NAR�NB�NBB�NC�NCL�ND�NE�NEW�NF�NG�NH�NI�NIL�NIU�NJ�NL�NMI�NMP�NN�NPL�NPR�NPT�NQ�NR�NRL�NT�NTT�NU�NV�NX�NY�OA�ODE�OHM�ON�ONZ�OP�OT�OZ�OZA�OZI�P0�P1�P2�P3�P4�P5�P6�P7�P8�P9�PA�PAL�PB�PD�PE�PF�PFL�PG�PGL�PI�PK�PL�PLA�PM�PN�PO�PQ�PR�PS�PT�PTD�PTI�PTL�PU�PV�PW�PY�PZ�Q3�QA�QAN�QB�QD�QH�QK�QR�QT�QTD�QTI�QTL�QTR�R1�R4�R9�RA�RD�RG�RH�RK�RL�RM�RN�RO�RP�RPM�RPS�RS�RT�RU�S3�S4�S5�S6�S7�S8�SA�SAN�SCO�SCR�SD�SE�SEC�SET�SG�SHT�SIE�SK�SL�SMI�SN�SO�SP�SQ�SQR�SR�SS�SST�ST�STI�STK�STL�STN�SV�SW�SX�T0�T1�T3�T4�T5�T6�T7�T8�TA�TAH�TC�TD�TE�TF�TI�TIC�TIP�TJ�TK�TL�TMS�TN�TNE�TP�TPR�TQ�TQD�TR�TRL�TS�TSD�TSH�TT�TU�TV�TW�TY�U1�U2�UA�UB�UC�UD�UE�UF�UH�UM�VA�VI�VLT�VP�VQ�VS�W2�W4�WA�WB�WCD�WE�WEB�WEE�WG�WH�WHR�WI�WM�WR�WSD�WTT�WW�X1�YDK�YDQ�YL�YRD�YT�Z1�Z2�Z3�Z4�Z5�Z6�Z8�ZP�ZZ�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�10�11�13�14�15�16�17�18�19�1A�1B�1C�1D�1E�1F�1G�1H�1I�1J�1K�1L�1M�1X�20�21�22�23�24�25�26�27�28�29�2A�2B�2C�2G�2H�2I�2J�2K�2L�2M�2N�2P�2Q�2R�2U�2V�2W�2X�2Y�2Z�30�31�32�33�34�35�36�37�38�3B�3C�3E�3G�3H�3I�40�41�43�44�45�46�47�48�4A�4B�4C�4E�4G�4H�4K�4L�4M�4N�4O�4P�4Q�4R�4T�4U�4W�4X�5�53�54�56�57�58�59�5A�5B�5C�5E�5F�5G�5H�5I�5J�5K�5P�5Q�6�60�61�62�63�64�66�69�71�72�73�74�76�77�78�8�80�81�84�85�87�89�90�91�92�93�94�95�96�97�98�A1�A10�A11�A12�A13�A14�A15�A16�A17�A18�A19�A2�A20�A21�A22�A23�A24�A25�A26�A27�A28�A29�A3�A30�A31�A32�A33�A34�A35�A36�A37�A38�A39�A4�A40�A41�A42�A43�A44�A45�A47�A48�A49�A5�A50�A51�A52�A53�A54�A55�A56�A57�A58�A59�A6�A60�A61�A62�A63�A64�A65�A66�A67�A68�A69�A7�A70�A71�A73�A74�A75�A76�A77�A78�A79�A8�A80�A81�A82�A83�A84�A85�A86�A87�A88�A89�A9�A90�A91�A93�A94�A95�A96�A97�A98�A99�AA�AB�ACR�ACT�AD�AE�AH�AI�AJ�AK�AL�AM�AMH�AMP�ANN�AP�APZ�AQ�AR�ARE�AS�ASM�ASU�ATM�ATT�AV�AW�AY�AZ�B0�B1�B10�B11�B12�B13�B14�B15�B16�B17�B18�B19�B2�B20�B21�B22�B23�B24�B25�B26�B27�B28�B29�B3�B30�B31�B32�B33�B34�B35�B36�B37�B38�B39�B4�B40�B41�B42�B43�B44�B45�B46�B47�B48�B49�B5�B50�B51�B52�B53�B54�B55�B56�B57�B58�B59�B6�B60�B61�B62�B63�B64�B65�B66�B67�B68�B69�B7�B70�B71�B72�B73�B74�B75�B76�B77�B78�B79�B8�B80�B81�B82�B83�B84�B85�B86�B87�B88�B89�B9�B90�B91�B92�B93�B94�B95�B96�B97�B98�B99�BAR�BB�BD�BE�BFT�BG�BH�BHP�BIL�BJ�BK�BL�BLD�BLL�BO�BP�BQL�BR�BT�BTU�BUA�BUI�BW�BX�BZ�C0�C1�C10�C11�C12�C13�C14�C15�C16�C17�C18�C19�C2�C20�C21�C22�C23�C24�C25�C26�C27�C28�C29�C3�C30�C31�C32�C33�C34�C35�C36�C37�C38�C39�C4�C40�C41�C42�C43�C44�C45�C46�C47�C48�C49�C5�C50�C51�C52�C53�C54�C55�C56�C57�C58�C59�C6�C60�C61�C62�C63�C64�C65�C66�C67�C68�C69�C7�C70�C71�C72�C73�C74�C75�C76�C77�C78�C79�C8�C80�C81�C82�C83�C84�C85�C86�C87�C88�C89�C9�C90�C91�C92�C93�C94�C95�C96�C97�C98�C99�CA�CCT�CDL�CEL�CEN�CG�CGM�CH�CJ�CK�CKG�CL�CLF�CLT�CMK�CMQ�CMT�CNP�CNT�CO�COU�CQ�CR�CS�CT�CTG�CTM�CTN�CU�CUR�CV�CWA�CWI�CY�CZ�D03�D04�D1�D10�D11�D12�D13�D14�D15�D16�D17�D18�D19�D2�D20�D21�D22�D23�D24�D25�D26�D27�D28�D29�D30�D31�D32�D33�D34�D35�D36�D37�D38�D39�D40�D41�D42�D43�D44�D45�D46�D47�D48�D49�D5�D50�D51�D52�D53�D54�D55�D56�D57�D58�D59�D6�D60�D61�D62�D63�D64�D65�D66�D67�D68�D69�D7�D70�D71�D72�D73�D74�D75�D76�D77�D78�D79�D8�D80�D81�D82�D83�D85�D86�D87�D88�D89�D9�D90�D91�D92�D93�D94�D95�D96�D97�D98�D99�DAA�DAD�DAY�DB�DC�DD�DE�DEC�DG�DI�DJ�DLT�DMA�DMK�DMO�DMQ�DMT�DN�DPC�DPR�DPT�DQ�DR�DRA�DRI�DRL�DRM�DS�DT�DTN�DU�DWT�DX�DY�DZN�DZP�E01�E07�E08�E09�E10�E11�E12�E14�E15�E16�E17�E18�E19�E2�E20�E21�E22�E23�E25�E27�E28�E3�E30�E31�E32�E33�E34�E35�E36�E37�E38�E39�E4�E40�E41�E42�E43�E44�E45�E46�E47�E48�E49�E5�E50�E51�E52�E53�E54�E55�E56�E57�E58�E59�E60�E61�E62�E63�E64�E65�E66�E67�E68�E69�E70�E71�E72�E73�E74�E75�E76�E77�E78�E79�E80�E81�E82�E83�E84�E85�E86�E87�E88�E89�E90�E91�E92�E93�E94�E95�E96�E97�E98�E99�EA�EB�EC�EP�EQ�EV�F01�F02�F03�F04�F05�F06�F07�F08�F1�F10�F11�F12�F13�F14�F15�F16�F17�F18�F19�F20�F21�F22�F23�F24�F25�F26�F27�F28�F29�F30�F31�F32�F33�F34�F35�F36�F37�F38�F39�F40�F41�F42�F43�F44�F45�F46�F47�F48�F49�F50�F51�F52�F53�F54�F55�F56�F57�F58�F59�F60�F61�F62�F63�F64�F65�F66�F67�F68�F69�F70�F71�F72�F73�F74�F75�F76�F77�F78�F79�F80�F81�F82�F83�F84�F85�F86�F87�F88�F89�F9�F90�F91�F92�F93�F94�F95�F96�F97�F98�F99�FAH�FAR�FB�FBM�FC�FD�FE�FF�FG�FH�FIT�FL�FM�FOT�FP�FR�FS�FTK�FTQ�G01�G04�G05�G06�G08�G09�G10�G11�G12�G13�G14�G15�G16�G17�G18�G19�G2�G20�G21�G23�G24�G25�G26�G27�G28�G29�G3�G30�G31�G32�G33�G34�G35�G36�G37�G38�G39�G40�G41�G42�G43�G44�G45�G46�G47�G48�G49�G50�G51�G52�G53�G54�G55�G56�G57�G58�G59�G60�G61�G62�G63�G64�G65�G66�G67�G68�G69�G7�G70�G71�G72�G73�G74�G75�G76�G77�G78�G79�G80�G81�G82�G83�G84�G85�G86�G87�G88�G89�G90�G91�G92�G93�G94�G95�G96�G97�G98�G99�GB�GBQ�GC�GD�GDW�GE�GF�GFI�GGR�GH�GIA�GIC�GII�GIP�GJ�GK�GL�GLD�GLI�GLL�GM�GN�GO�GP�GQ�GRM�GRN�GRO�GRT�GT�GV�GW�GWH�GY�GZ�H03�H04�H05�H06�H07�H08�H09�H1�H10�H11�H12�H13�H14�H15�H16�H18�H19�H2�H20�H21�H22�H23�H24�H25�H26�H27�H28�H29�H30�H31�H32�H33�H34�H35�H36�H37�H38�H39�H40�H41�H42�H43�H44�H45�H46�H47�H48�H49�H50�H51�H52�H53�H54�H55�H56�H57�H58�H59�H60�H61�H62�H63�H64�H65�H66�H67�H68�H69�H70�H71�H72�H73�H74�H75�H76�H77�H78�H79�H80�H81�H82�H83�H84�H85�H87�H88�H89�H90�H91�H92�H93�H94�H95�H96�H98�H99�HA�HAR�HBA�HBX�HC�HD�HDW�HE�HF�HGM�HH�HI�HIU�HJ�HK�HKM�HL�HLT�HM�HMQ�HMT�HN�HO�HP�HPA�HS�HT�HTZ�HUR�HY�IA�IC�IE�IF�II�IL�IM�INH�INK�INQ�IP�ISD�IT�IU�IV�J10�J12�J13�J14�J15�J16�J17�J18�J19�J2�J20�J21�J22�J23�J24�J25�J26�J27�J28�J29�J30�J31�J32�J33�J34�J35�J36�J38�J39�J40�J41�J42�J43�J44�J45�J46�J47�J48�J49�J50�J51�J52�J53�J54�J55�J56�J57�J58�J59�J60�J61�J62�J63�J64�J65�J66�J67�J68�J69�J70�J71�J72�J73�J74�J75�J76�J78�J79�J81�J82�J83�J84�J85�J87�J89�J90�J91�J92�J93�J94�J95�J96�J97�J98�J99�JB�JE�JG�JK�JM�JNT�JO�JOU�JPS�JR�JWL�K1�K10�K11�K12�K13�K14�K15�K16�K17�K18�K19�K2�K20�K21�K22�K23�K24�K25�K26�K27�K28�K3�K30�K31�K32�K33�K34�K35�K36�K37�K38�K39�K40�K41�K42�K43�K45�K46�K47�K48�K49�K5�K50�K51�K52�K53�K54�K55�K58�K59�K6�K60�K61�K62�K63�K64�K65�K66�K67�K68�K69�K70�K71�K73�K74�K75�K76�K77�K78�K79�K80�K81�K82�K83�K84�K85�K86�K87�K88�K89�K90�K91�K92�K93�K94�K95�K96�K97�K98�K99�KA�KAT�KB�KBA�KCC�KD�KDW�KEL�KF�KG�KGM�KGS�KHY�KHZ�KI�KIC�KIP�KJ�KJO�KL�KLK�KMA�KMH�KMK�KMQ�KMT�KNI�KNS�KNT�KO�KPA�KPH�KPO�KPP�KR�KS�KSD�KSH�KT�KTM�KTN�KUR�KVA�KVR�KVT�KW�KWH�KWO�KWT�KX�L10�L11�L12�L13�L14�L15�L16�L17�L18�L19�L2�L20�L21�L23�L24�L25�L26�L27�L28�L29�L30�L31�L32�L33�L34�L35�L36�L37�L38�L39�L40�L41�L42�L43�L44�L45�L46�L47�L48�L49�L50�L51�L52�L53�L54�L55�L56�L57�L58�L59�L60�L61�L62�L63�L64�L65�L66�L67�L68�L69�L70�L71�L72�L73�L74�L75�L76�L77�L78�L79�L80�L81�L82�L83�L84�L85�L86�L87�L88�L89�L90�L91�L92�L93�L94�L95�L96�L98�L99�LA�LAC�LBR�LBT�LC�LD�LE�LEF�LF�LH�LI�LJ�LK�LM�LN�LO�LP�LPA�LR�LS�LTN�LTR�LUB�LUM�LUX�LX�LY�M0�M1�M10�M11�M12�M13�M14�M15�M16�M17�M18�M19�M20�M21�M22�M23�M24�M25�M26�M27�M29�M30�M31�M32�M33�M34�M35�M36�M37�M4�M5�M7�M9�MA�MAH�MAL�MAM�MAR�MAW�MBE�MBF�MBR�MC�MCU�MD�MF�MGM�MHZ�MIK�MIL�MIN�MIO�MIU�MK�MLD�MLT�MMK�MMQ�MMT�MND�MON�MPA�MQ�MQH�MQS�MSK�MT�MTK�MTQ�MTR�MTS�MV�MVA�MWH�N1�N2�N3�NA�NAR�NB�NBB�NC�NCL�ND�NE�NEW�NF�NG�NH�NI�NIL�NIU�NJ�NL�NMI�NMP�NN�NPL�NPR�NPT�NQ�NR�NRL�NT�NTT�NU�NV�NX�NY�OA�ODE�OHM�ON�ONZ�OP�OT�OZ�OZA�OZI�P0�P1�P2�P3�P4�P5�P6�P7�P8�P9�PA�PAL�PB�PD�PE�PF�PFL�PG�PGL�PI�PK�PL�PLA�PM�PN�PO�PQ�PR�PS�PT�PTD�PTI�PTL�PU�PV�PW�PY�PZ�Q3�QA�QAN�QB�QD�QH�QK�QR�QT�QTD�QTI�QTL�QTR�R1�R4�R9�RA�RD�RG�RH�RK�RL�RM�RN�RO�RP�RPM�RPS�RS�RT�RU�S3�S4�S5�S6�S7�S8�SA�SAN�SCO�SCR�SD�SE�SEC�SET�SG�SHT�SIE�SK�SL�SMI�SN�SO�SP�SQ�SQR�SR�SS�SST�ST�STI�STK�STL�STN�SV�SW�SX�T0�T1�T3�T4�T5�T6�T7�T8�TA�TAH�TC�TD�TE�TF�TI�TIC�TIP�TJ�TK�TL�TMS�TN�TNE�TP�TPR�TQ�TQD�TR�TRL�TS�TSD�TSH�TT�TU�TV�TW�TY�U1�U2�UA�UB�UC�UD�UE�UF�UH�UM�VA�VI�VLT�VP�VQ�VS�W2�W4�WA�WB�WCD�WE�WEB�WEE�WG�WH�WHR�WI�WM�WR�WSD�WTT�WW�X1�YDK�YDQ�YL�YRD�YT�Z1�Z2�Z3�Z4�Z5�Z6�Z8�ZP�ZZ�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">OP-T01-R009</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[OP-T01-R009]-Unit code MUST be coded according to the UN/ECE Recommendation 20 (2009)</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*" />
  </xsl:template>
  <xsl:template match="text()" mode="M8" priority="-1" />
  <xsl:template match="@*|node()" mode="M8" priority="-2">
    <xsl:apply-templates mode="M8" select="*" />
  </xsl:template>

<!--PATTERN UBL-T01-->


	<!--RULE -->
<xsl:template match="//cac:Country/cbc:IdentificationCode" mode="M9" priority="1006">
    <svrl:fired-rule context="//cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID = 'ISO3166-1:Alpha2'" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID = 'ISO3166-1:Alpha2'">
          <xsl:attribute name="id">EUGEN-T01-R015</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[EUGEN-T01-R015]-A country identification code MUST have a list identifier attribute “ISO3166-1:Alpha2”</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cbc:DocumentCurrencyCode" mode="M9" priority="1005">
    <svrl:fired-rule context="//cbc:DocumentCurrencyCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID='ISO4217'" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID='ISO4217'">
          <xsl:attribute name="id">EUGEN-T01-R014</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[EUGEN-T01-R014]-A document currency code MUST have a list identifier attribute “ISO4217”</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cbc:EndpointID" mode="M9" priority="1004">
    <svrl:fired-rule context="//cbc:EndpointID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EUGEN-T01-R011</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[EUGEN-T01-R011]-An endpoint identifier MUST have a scheme identifier attribute</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cbc:OrderTypeCode" mode="M9" priority="1003">
    <svrl:fired-rule context="//cbc:OrderTypeCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID='UNCL1001' or @listID='UNCLD1001' " />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID='UNCL1001' or @listID='UNCLD1001'">
          <xsl:attribute name="id">EUGEN-T01-R013</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[EUGEN-T01-R013]-An order type code MUST have a list identifier attribute “UNCL1001”</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:PartyIdentification/cbc:ID" mode="M9" priority="1002">
    <svrl:fired-rule context="//cac:PartyIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">EUGEN-T01-R012</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[EUGEN-T01-R012]-A party identifier MUST have a scheme identifier attribute</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:ClassifiedTaxCategory/cbc:ID" mode="M9" priority="1001">
    <svrl:fired-rule context="//cac:ClassifiedTaxCategory/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID  = 'UNCL5305'" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID = 'UNCL5305'">
          <xsl:attribute name="id">EUGEN-T01-R017</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[EUGEN-T01-R017]-A tax category identifier MUST have a scheme identifier attribute “UNCL5305”</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//*[contains(name(),'Quantity')]" mode="M9" priority="1000">
    <svrl:fired-rule context="//*[contains(name(),'Quantity')]" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(attribute::unitCode) or (attribute::unitCode and attribute::unitCodeListID = 'UNECERec20')" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(attribute::unitCode) or (attribute::unitCode and attribute::unitCodeListID = 'UNECERec20')">
          <xsl:attribute name="id">EUGEN-T01-R016</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[EUGEN-T01-R016]-A unit code attribute MUST have a unit code list identifier attribute “UNECERec20”</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*" />
  </xsl:template>
  <xsl:template match="text()" mode="M9" priority="-1" />
  <xsl:template match="@*|node()" mode="M9" priority="-2">
    <xsl:apply-templates mode="M9" select="*" />
  </xsl:template>
</xsl:stylesheet>
