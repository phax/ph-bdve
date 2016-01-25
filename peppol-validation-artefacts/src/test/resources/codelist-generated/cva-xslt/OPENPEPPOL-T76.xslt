<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<stylesheet exclude-result-prefixes="ccs" version="2.0" xmlns="http://www.w3.org/1999/XSL/Transform">
  <output indent="yes" />
  <template match="/">
    <for-each select="document('')">
      <ns0:pattern id="OPENPEPPOL-T76" xmlns:ns0="http://purl.oclc.org/dsdl/schematron">
<!--This CVA to Schematron implementation supports genericode code lists.-->
<!--
    Start of synthesis of a stylesheet creating rules from code list context
    associations.  This is an XSLT 1.0 stylesheet that can be executed without
    any input file (any supplied input file is ignored; most processors
    require the specification of an input file; when necessary, any XML
    document will do, such as providing the stylesheet itself as the input).

    The end result of running this synthesized stylesheet with no or any input 
    is a Schematron schema expressing the constraints found in the CVA file
    that was input to the creation this stylesheet.  Any changes to those
    inputs will require this stylesheet to be recreated.
  -->
<text />
        <comment />

<ns0:rule context="cbc:OrderResponseCode" flag="fatal" role="fatal">
  <!--{}[](OrderResponseCode)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](OrderResponseCode)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;27&#127;29&#127;30&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[OP-T76-R001]-An order response code MUST be coded according to the code list 1225.          </ns0:assert>
</ns0:rule>

<ns0:rule context="cac:LineItem/cbc:LineStatusCode" flag="fatal" role="fatal">
  <!--{}[](OrderResponseCode)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](OrderResponseCode)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;27&#127;29&#127;30&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[OP-T76-R002]-An order response line status code MUST be coded according to the code list 1225.          </ns0:assert>
</ns0:rule>

<ns0:rule context="cbc:DocumentCurrencyCode" flag="fatal" role="fatal">
  <!--{}[](CurrencyCodeList)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](CurrencyCodeList)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;AED&#127;AFN&#127;ALL&#127;AMD&#127;ANG&#127;AOA&#127;ARS&#127;AUD&#127;AWG&#127;AZN&#127;BAM&#127;BBD&#127;BDT&#127;BGN&#127;BHD&#127;BIF&#127;BMD&#127;BND&#127;BOB&#127;BOV&#127;BRL&#127;BSD&#127;BTN&#127;BWP&#127;BYR&#127;BZD&#127;CAD&#127;CDF&#127;CHE&#127;CHF&#127;CHW&#127;CLF&#127;CLP&#127;CNY&#127;COP&#127;COU&#127;CRC&#127;CUP&#127;CVE&#127;CZK&#127;DJF&#127;DKK&#127;DOP&#127;DZD&#127;EEK&#127;EGP&#127;ERN&#127;ETB&#127;EUR&#127;FJD&#127;FKP&#127;GBP&#127;GEL&#127;GHS&#127;GIP&#127;GMD&#127;GNF&#127;GTQ&#127;GWP&#127;GYD&#127;HKD&#127;HNL&#127;HRK&#127;HTG&#127;HUF&#127;IDR&#127;ILS&#127;INR&#127;IQD&#127;IRR&#127;ISK&#127;JMD&#127;JOD&#127;JPY&#127;KES&#127;KGS&#127;KHR&#127;KMF&#127;KPW&#127;KRW&#127;KWD&#127;KYD&#127;KZT&#127;LAK&#127;LBP&#127;LKR&#127;LRD&#127;LSL&#127;LTL&#127;LVL&#127;LYD&#127;MAD&#127;MDL&#127;MGA&#127;MKD&#127;MMK&#127;MNT&#127;MOP&#127;MRO&#127;MUR&#127;MVR&#127;MWK&#127;MXN&#127;MXV&#127;MYR&#127;MZN&#127;NAD&#127;NGN&#127;NIO&#127;NOK&#127;NPR&#127;NZD&#127;OMR&#127;PAB&#127;PEN&#127;PGK&#127;PHP&#127;PKR&#127;PLN&#127;PYG&#127;QAR&#127;RON&#127;RSD&#127;RUB&#127;RWF&#127;SAR&#127;SBD&#127;SCR&#127;SDG&#127;SEK&#127;SGD&#127;SHP&#127;SKK&#127;SLL&#127;SOS&#127;SRD&#127;STD&#127;SVC&#127;SYP&#127;SZL&#127;THB&#127;TJS&#127;TMM&#127;TND&#127;TOP&#127;TRY&#127;TTD&#127;TWD&#127;TZS&#127;UAH&#127;UGX&#127;USD&#127;USN&#127;USS&#127;UYI&#127;UYU&#127;UZS&#127;VEF&#127;VND&#127;VUV&#127;WST&#127;XAF&#127;XAG&#127;XAU&#127;XBA&#127;XBB&#127;XBC&#127;XBD&#127;XCD&#127;XDR&#127;XFU&#127;XOF&#127;XPD&#127;XPF&#127;XTS&#127;XXX&#127;YER&#127;ZAR&#127;ZMK&#127;ZWR&#127;ZWD&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[OP-T76-R003]-DocumentCurrencyCode MUST be coded using ISO code list 4217          </ns0:assert>
</ns0:rule>

<ns0:rule context="cbc:EndpointID/@schemeID" flag="fatal" role="fatal">
  <!--{}[](PartyIdentifierScheme)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](PartyIdentifierScheme)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;FR:SIRENE&#127;SE:ORGNR&#127;FR:SIRET&#127;FI:OVT&#127;DUNS&#127;GLN&#127;DK:P&#127;IT:FTI&#127;NL:KVK&#127;IT:SIA&#127;IT:SECETI&#127;DK:CPR&#127;DK:CVR&#127;DK:SE&#127;DK:VANS&#127;IT:VAT&#127;IT:CF&#127;NO:ORGNR&#127;NO:VAT&#127;HU:VAT&#127;EU:REID&#127;AT:VAT&#127;AT:GOV&#127;IS:KT&#127;IBAN&#127;AT:KUR&#127;ES:VAT&#127;IT:IPA&#127;AD:VAT&#127;AL:VAT&#127;BA:VAT&#127;BE:VAT&#127;BG:VAT&#127;CH:VAT&#127;CY:VAT&#127;CZ:VAT&#127;DE:VAT&#127;EE:VAT&#127;GB:VAT&#127;GR:VAT&#127;HR:VAT&#127;IE:VAT&#127;LI:VAT&#127;LT:VAT&#127;LU:VAT&#127;LV:VAT&#127;MC:VAT&#127;ME:VAT&#127;MK:VAT&#127;MT:VAT&#127;NL:VAT&#127;PL:VAT&#127;PT:VAT&#127;RO:VAT&#127;RS:VAT&#127;SI:VAT&#127;SK:VAT&#127;SM:VAT&#127;TR:VAT&#127;VA:VAT&#127;NL:ION&#127;SE:VAT&#127;ZZZ&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[OP-T76-R004]-An Enpoint Identifier Scheme identifier MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".          </ns0:assert>
</ns0:rule>

<ns0:rule context="cac:PartyIdentification/cbc:ID/@schemeID" flag="fatal" role="fatal">
  <!--{}[](PartyIdentifierScheme)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](PartyIdentifierScheme)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;FR:SIRENE&#127;SE:ORGNR&#127;FR:SIRET&#127;FI:OVT&#127;DUNS&#127;GLN&#127;DK:P&#127;IT:FTI&#127;NL:KVK&#127;IT:SIA&#127;IT:SECETI&#127;DK:CPR&#127;DK:CVR&#127;DK:SE&#127;DK:VANS&#127;IT:VAT&#127;IT:CF&#127;NO:ORGNR&#127;NO:VAT&#127;HU:VAT&#127;EU:REID&#127;AT:VAT&#127;AT:GOV&#127;IS:KT&#127;IBAN&#127;AT:KUR&#127;ES:VAT&#127;IT:IPA&#127;AD:VAT&#127;AL:VAT&#127;BA:VAT&#127;BE:VAT&#127;BG:VAT&#127;CH:VAT&#127;CY:VAT&#127;CZ:VAT&#127;DE:VAT&#127;EE:VAT&#127;GB:VAT&#127;GR:VAT&#127;HR:VAT&#127;IE:VAT&#127;LI:VAT&#127;LT:VAT&#127;LU:VAT&#127;LV:VAT&#127;MC:VAT&#127;ME:VAT&#127;MK:VAT&#127;MT:VAT&#127;NL:VAT&#127;PL:VAT&#127;PT:VAT&#127;RO:VAT&#127;RS:VAT&#127;SI:VAT&#127;SK:VAT&#127;SM:VAT&#127;TR:VAT&#127;VA:VAT&#127;NL:ION&#127;SE:VAT&#127;ZZZ&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[OP-T76-R005]-An Party Identifier Scheme identifier MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".          </ns0:assert>
</ns0:rule>

<ns0:rule context="@unitCode" flag="fatal" role="fatal">
  <!--{}[](UnitCode)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](UnitCode)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;5&#127;6&#127;8&#127;10&#127;11&#127;13&#127;14&#127;15&#127;16&#127;17&#127;18&#127;19&#127;20&#127;21&#127;22&#127;23&#127;24&#127;25&#127;26&#127;27&#127;28&#127;29&#127;30&#127;31&#127;32&#127;33&#127;34&#127;35&#127;36&#127;37&#127;38&#127;40&#127;41&#127;43&#127;44&#127;45&#127;46&#127;47&#127;48&#127;53&#127;54&#127;56&#127;57&#127;58&#127;59&#127;60&#127;61&#127;62&#127;63&#127;64&#127;66&#127;69&#127;71&#127;72&#127;73&#127;74&#127;76&#127;77&#127;78&#127;80&#127;81&#127;84&#127;85&#127;87&#127;89&#127;90&#127;91&#127;92&#127;93&#127;94&#127;95&#127;96&#127;97&#127;98&#127;1A&#127;1B&#127;1C&#127;1D&#127;1E&#127;1F&#127;1G&#127;1H&#127;1I&#127;1J&#127;1K&#127;1L&#127;1M&#127;1X&#127;2A&#127;2B&#127;2C&#127;2G&#127;2H&#127;2I&#127;2J&#127;2K&#127;2L&#127;2M&#127;2N&#127;2P&#127;2Q&#127;2R&#127;2U&#127;2V&#127;2W&#127;2X&#127;2Y&#127;2Z&#127;3B&#127;3C&#127;3E&#127;3G&#127;3H&#127;3I&#127;4A&#127;4B&#127;4C&#127;4E&#127;4G&#127;4H&#127;4K&#127;4L&#127;4M&#127;4N&#127;4O&#127;4P&#127;4Q&#127;4R&#127;4T&#127;4U&#127;4W&#127;4X&#127;5A&#127;5B&#127;5C&#127;5E&#127;5F&#127;5G&#127;5H&#127;5I&#127;5J&#127;5K&#127;5P&#127;5Q&#127;A1&#127;A10&#127;A11&#127;A12&#127;A13&#127;A14&#127;A15&#127;A16&#127;A17&#127;A18&#127;A19&#127;A2&#127;A20&#127;A21&#127;A22&#127;A23&#127;A24&#127;A25&#127;A26&#127;A27&#127;A28&#127;A29&#127;A3&#127;A30&#127;A31&#127;A32&#127;A33&#127;A34&#127;A35&#127;A36&#127;A37&#127;A38&#127;A39&#127;A4&#127;A40&#127;A41&#127;A42&#127;A43&#127;A44&#127;A45&#127;A47&#127;A48&#127;A49&#127;A5&#127;A50&#127;A51&#127;A52&#127;A53&#127;A54&#127;A55&#127;A56&#127;A57&#127;A58&#127;A59&#127;A6&#127;A60&#127;A61&#127;A62&#127;A63&#127;A64&#127;A65&#127;A66&#127;A67&#127;A68&#127;A69&#127;A7&#127;A70&#127;A71&#127;A73&#127;A74&#127;A75&#127;A76&#127;A77&#127;A78&#127;A79&#127;A8&#127;A80&#127;A81&#127;A82&#127;A83&#127;A84&#127;A85&#127;A86&#127;A87&#127;A88&#127;A89&#127;A9&#127;A90&#127;A91&#127;A93&#127;A94&#127;A95&#127;A96&#127;A97&#127;A98&#127;A99&#127;AA&#127;AB&#127;ACR&#127;ACT&#127;AD&#127;AE&#127;AH&#127;AI&#127;AJ&#127;AK&#127;AL&#127;AM&#127;AMH&#127;AMP&#127;ANN&#127;AP&#127;APZ&#127;AQ&#127;AR&#127;ARE&#127;AS&#127;ASM&#127;ASU&#127;ATM&#127;ATT&#127;AV&#127;AW&#127;AY&#127;AZ&#127;B0&#127;B1&#127;B10&#127;B11&#127;B12&#127;B13&#127;B14&#127;B15&#127;B16&#127;B17&#127;B18&#127;B19&#127;B2&#127;B20&#127;B21&#127;B22&#127;B23&#127;B24&#127;B25&#127;B26&#127;B27&#127;B28&#127;B29&#127;B3&#127;B30&#127;B31&#127;B32&#127;B33&#127;B34&#127;B35&#127;B36&#127;B37&#127;B38&#127;B39&#127;B4&#127;B40&#127;B41&#127;B42&#127;B43&#127;B44&#127;B45&#127;B46&#127;B47&#127;B48&#127;B49&#127;B5&#127;B50&#127;B51&#127;B52&#127;B53&#127;B54&#127;B55&#127;B56&#127;B57&#127;B58&#127;B59&#127;B6&#127;B60&#127;B61&#127;B62&#127;B63&#127;B64&#127;B65&#127;B66&#127;B67&#127;B68&#127;B69&#127;B7&#127;B70&#127;B71&#127;B72&#127;B73&#127;B74&#127;B75&#127;B76&#127;B77&#127;B78&#127;B79&#127;B8&#127;B80&#127;B81&#127;B82&#127;B83&#127;B84&#127;B85&#127;B86&#127;B87&#127;B88&#127;B89&#127;B9&#127;B90&#127;B91&#127;B92&#127;B93&#127;B94&#127;B95&#127;B96&#127;B97&#127;B98&#127;B99&#127;BAR&#127;BB&#127;BD&#127;BE&#127;BFT&#127;BG&#127;BH&#127;BHP&#127;BIL&#127;BJ&#127;BK&#127;BL&#127;BLD&#127;BLL&#127;BO&#127;BP&#127;BQL&#127;BR&#127;BT&#127;BTU&#127;BUA&#127;BUI&#127;BW&#127;BX&#127;BZ&#127;C0&#127;C1&#127;C10&#127;C11&#127;C12&#127;C13&#127;C14&#127;C15&#127;C16&#127;C17&#127;C18&#127;C19&#127;C2&#127;C20&#127;C21&#127;C22&#127;C23&#127;C24&#127;C25&#127;C26&#127;C27&#127;C28&#127;C29&#127;C3&#127;C30&#127;C31&#127;C32&#127;C33&#127;C34&#127;C35&#127;C36&#127;C37&#127;C38&#127;C39&#127;C4&#127;C40&#127;C41&#127;C42&#127;C43&#127;C44&#127;C45&#127;C46&#127;C47&#127;C48&#127;C49&#127;C5&#127;C50&#127;C51&#127;C52&#127;C53&#127;C54&#127;C55&#127;C56&#127;C57&#127;C58&#127;C59&#127;C6&#127;C60&#127;C61&#127;C62&#127;C63&#127;C64&#127;C65&#127;C66&#127;C67&#127;C68&#127;C69&#127;C7&#127;C70&#127;C71&#127;C72&#127;C73&#127;C74&#127;C75&#127;C76&#127;C77&#127;C78&#127;C79&#127;C8&#127;C80&#127;C81&#127;C82&#127;C83&#127;C84&#127;C85&#127;C86&#127;C87&#127;C88&#127;C89&#127;C9&#127;C90&#127;C91&#127;C92&#127;C93&#127;C94&#127;C95&#127;C96&#127;C97&#127;C98&#127;C99&#127;CA&#127;CCT&#127;CDL&#127;CEL&#127;CEN&#127;CG&#127;CGM&#127;CH&#127;CJ&#127;CK&#127;CKG&#127;CL&#127;CLF&#127;CLT&#127;CMK&#127;CMQ&#127;CMT&#127;CNP&#127;CNT&#127;CO&#127;COU&#127;CQ&#127;CR&#127;CS&#127;CT&#127;CTG&#127;CTM&#127;CTN&#127;CU&#127;CUR&#127;CV&#127;CWA&#127;CWI&#127;CY&#127;CZ&#127;D03&#127;D04&#127;D1&#127;D10&#127;D11&#127;D12&#127;D13&#127;D14&#127;D15&#127;D16&#127;D17&#127;D18&#127;D19&#127;D2&#127;D20&#127;D21&#127;D22&#127;D23&#127;D24&#127;D25&#127;D26&#127;D27&#127;D28&#127;D29&#127;D30&#127;D31&#127;D32&#127;D33&#127;D34&#127;D35&#127;D36&#127;D37&#127;D38&#127;D39&#127;D40&#127;D41&#127;D42&#127;D43&#127;D44&#127;D45&#127;D46&#127;D47&#127;D48&#127;D49&#127;D5&#127;D50&#127;D51&#127;D52&#127;D53&#127;D54&#127;D55&#127;D56&#127;D57&#127;D58&#127;D59&#127;D6&#127;D60&#127;D61&#127;D62&#127;D63&#127;D64&#127;D65&#127;D66&#127;D67&#127;D68&#127;D69&#127;D7&#127;D70&#127;D71&#127;D72&#127;D73&#127;D74&#127;D75&#127;D76&#127;D77&#127;D78&#127;D79&#127;D8&#127;D80&#127;D81&#127;D82&#127;D83&#127;D85&#127;D86&#127;D87&#127;D88&#127;D89&#127;D9&#127;D90&#127;D91&#127;D92&#127;D93&#127;D94&#127;D95&#127;D96&#127;D97&#127;D98&#127;D99&#127;DAA&#127;DAD&#127;DAY&#127;DB&#127;DC&#127;DD&#127;DE&#127;DEC&#127;DG&#127;DI&#127;DJ&#127;DLT&#127;DMA&#127;DMK&#127;DMO&#127;DMQ&#127;DMT&#127;DN&#127;DPC&#127;DPR&#127;DPT&#127;DQ&#127;DR&#127;DRA&#127;DRI&#127;DRL&#127;DRM&#127;DS&#127;DT&#127;DTN&#127;DU&#127;DWT&#127;DX&#127;DY&#127;DZN&#127;DZP&#127;E01&#127;E07&#127;E08&#127;E09&#127;E10&#127;E11&#127;E12&#127;E14&#127;E15&#127;E16&#127;E17&#127;E18&#127;E19&#127;E2&#127;E20&#127;E21&#127;E22&#127;E23&#127;E25&#127;E27&#127;E28&#127;E3&#127;E30&#127;E31&#127;E32&#127;E33&#127;E34&#127;E35&#127;E36&#127;E37&#127;E38&#127;E39&#127;E4&#127;E40&#127;E41&#127;E42&#127;E43&#127;E44&#127;E45&#127;E46&#127;E47&#127;E48&#127;E49&#127;E5&#127;E50&#127;E51&#127;E52&#127;E53&#127;E54&#127;E55&#127;E56&#127;E57&#127;E58&#127;E59&#127;E60&#127;E61&#127;E62&#127;E63&#127;E64&#127;E65&#127;E66&#127;E67&#127;E68&#127;E69&#127;E70&#127;E71&#127;E72&#127;E73&#127;E74&#127;E75&#127;E76&#127;E77&#127;E78&#127;E79&#127;E80&#127;E81&#127;E82&#127;E83&#127;E84&#127;E85&#127;E86&#127;E87&#127;E88&#127;E89&#127;E90&#127;E91&#127;E92&#127;E93&#127;E94&#127;E95&#127;E96&#127;E97&#127;E98&#127;E99&#127;EA&#127;EB&#127;EC&#127;EP&#127;EQ&#127;EV&#127;F01&#127;F02&#127;F03&#127;F04&#127;F05&#127;F06&#127;F07&#127;F08&#127;F1&#127;F10&#127;F11&#127;F12&#127;F13&#127;F14&#127;F15&#127;F16&#127;F17&#127;F18&#127;F19&#127;F20&#127;F21&#127;F22&#127;F23&#127;F24&#127;F25&#127;F26&#127;F27&#127;F28&#127;F29&#127;F30&#127;F31&#127;F32&#127;F33&#127;F34&#127;F35&#127;F36&#127;F37&#127;F38&#127;F39&#127;F40&#127;F41&#127;F42&#127;F43&#127;F44&#127;F45&#127;F46&#127;F47&#127;F48&#127;F49&#127;F50&#127;F51&#127;F52&#127;F53&#127;F54&#127;F55&#127;F56&#127;F57&#127;F58&#127;F59&#127;F60&#127;F61&#127;F62&#127;F63&#127;F64&#127;F65&#127;F66&#127;F67&#127;F68&#127;F69&#127;F70&#127;F71&#127;F72&#127;F73&#127;F74&#127;F75&#127;F76&#127;F77&#127;F78&#127;F79&#127;F80&#127;F81&#127;F82&#127;F83&#127;F84&#127;F85&#127;F86&#127;F87&#127;F88&#127;F89&#127;F9&#127;F90&#127;F91&#127;F92&#127;F93&#127;F94&#127;F95&#127;F96&#127;F97&#127;F98&#127;F99&#127;FAH&#127;FAR&#127;FB&#127;FBM&#127;FC&#127;FD&#127;FE&#127;FF&#127;FG&#127;FH&#127;FIT&#127;FL&#127;FM&#127;FOT&#127;FP&#127;FR&#127;FS&#127;FTK&#127;FTQ&#127;G01&#127;G04&#127;G05&#127;G06&#127;G08&#127;G09&#127;G10&#127;G11&#127;G12&#127;G13&#127;G14&#127;G15&#127;G16&#127;G17&#127;G18&#127;G19&#127;G2&#127;G20&#127;G21&#127;G23&#127;G24&#127;G25&#127;G26&#127;G27&#127;G28&#127;G29&#127;G3&#127;G30&#127;G31&#127;G32&#127;G33&#127;G34&#127;G35&#127;G36&#127;G37&#127;G38&#127;G39&#127;G40&#127;G41&#127;G42&#127;G43&#127;G44&#127;G45&#127;G46&#127;G47&#127;G48&#127;G49&#127;G50&#127;G51&#127;G52&#127;G53&#127;G54&#127;G55&#127;G56&#127;G57&#127;G58&#127;G59&#127;G60&#127;G61&#127;G62&#127;G63&#127;G64&#127;G65&#127;G66&#127;G67&#127;G68&#127;G69&#127;G7&#127;G70&#127;G71&#127;G72&#127;G73&#127;G74&#127;G75&#127;G76&#127;G77&#127;G78&#127;G79&#127;G80&#127;G81&#127;G82&#127;G83&#127;G84&#127;G85&#127;G86&#127;G87&#127;G88&#127;G89&#127;G90&#127;G91&#127;G92&#127;G93&#127;G94&#127;G95&#127;G96&#127;G97&#127;G98&#127;G99&#127;GB&#127;GBQ&#127;GC&#127;GD&#127;GDW&#127;GE&#127;GF&#127;GFI&#127;GGR&#127;GH&#127;GIA&#127;GIC&#127;GII&#127;GIP&#127;GJ&#127;GK&#127;GL&#127;GLD&#127;GLI&#127;GLL&#127;GM&#127;GN&#127;GO&#127;GP&#127;GQ&#127;GRM&#127;GRN&#127;GRO&#127;GRT&#127;GT&#127;GV&#127;GW&#127;GWH&#127;GY&#127;GZ&#127;H03&#127;H04&#127;H05&#127;H06&#127;H07&#127;H08&#127;H09&#127;H1&#127;H10&#127;H11&#127;H12&#127;H13&#127;H14&#127;H15&#127;H16&#127;H18&#127;H19&#127;H2&#127;H20&#127;H21&#127;H22&#127;H23&#127;H24&#127;H25&#127;H26&#127;H27&#127;H28&#127;H29&#127;H30&#127;H31&#127;H32&#127;H33&#127;H34&#127;H35&#127;H36&#127;H37&#127;H38&#127;H39&#127;H40&#127;H41&#127;H42&#127;H43&#127;H44&#127;H45&#127;H46&#127;H47&#127;H48&#127;H49&#127;H50&#127;H51&#127;H52&#127;H53&#127;H54&#127;H55&#127;H56&#127;H57&#127;H58&#127;H59&#127;H60&#127;H61&#127;H62&#127;H63&#127;H64&#127;H65&#127;H66&#127;H67&#127;H68&#127;H69&#127;H70&#127;H71&#127;H72&#127;H73&#127;H74&#127;H75&#127;H76&#127;H77&#127;H78&#127;H79&#127;H80&#127;H81&#127;H82&#127;H83&#127;H84&#127;H85&#127;H87&#127;H88&#127;H89&#127;H90&#127;H91&#127;H92&#127;H93&#127;H94&#127;H95&#127;H96&#127;H98&#127;H99&#127;HA&#127;HAR&#127;HBA&#127;HBX&#127;HC&#127;HD&#127;HDW&#127;HE&#127;HF&#127;HGM&#127;HH&#127;HI&#127;HIU&#127;HJ&#127;HK&#127;HKM&#127;HL&#127;HLT&#127;HM&#127;HMQ&#127;HMT&#127;HN&#127;HO&#127;HP&#127;HPA&#127;HS&#127;HT&#127;HTZ&#127;HUR&#127;HY&#127;IA&#127;IC&#127;IE&#127;IF&#127;II&#127;IL&#127;IM&#127;INH&#127;INK&#127;INQ&#127;IP&#127;ISD&#127;IT&#127;IU&#127;IV&#127;J10&#127;J12&#127;J13&#127;J14&#127;J15&#127;J16&#127;J17&#127;J18&#127;J19&#127;J2&#127;J20&#127;J21&#127;J22&#127;J23&#127;J24&#127;J25&#127;J26&#127;J27&#127;J28&#127;J29&#127;J30&#127;J31&#127;J32&#127;J33&#127;J34&#127;J35&#127;J36&#127;J38&#127;J39&#127;J40&#127;J41&#127;J42&#127;J43&#127;J44&#127;J45&#127;J46&#127;J47&#127;J48&#127;J49&#127;J50&#127;J51&#127;J52&#127;J53&#127;J54&#127;J55&#127;J56&#127;J57&#127;J58&#127;J59&#127;J60&#127;J61&#127;J62&#127;J63&#127;J64&#127;J65&#127;J66&#127;J67&#127;J68&#127;J69&#127;J70&#127;J71&#127;J72&#127;J73&#127;J74&#127;J75&#127;J76&#127;J78&#127;J79&#127;J81&#127;J82&#127;J83&#127;J84&#127;J85&#127;J87&#127;J89&#127;J90&#127;J91&#127;J92&#127;J93&#127;J94&#127;J95&#127;J96&#127;J97&#127;J98&#127;J99&#127;JB&#127;JE&#127;JG&#127;JK&#127;JM&#127;JNT&#127;JO&#127;JOU&#127;JPS&#127;JR&#127;JWL&#127;K1&#127;K10&#127;K11&#127;K12&#127;K13&#127;K14&#127;K15&#127;K16&#127;K17&#127;K18&#127;K19&#127;K2&#127;K20&#127;K21&#127;K22&#127;K23&#127;K24&#127;K25&#127;K26&#127;K27&#127;K28&#127;K3&#127;K30&#127;K31&#127;K32&#127;K33&#127;K34&#127;K35&#127;K36&#127;K37&#127;K38&#127;K39&#127;K40&#127;K41&#127;K42&#127;K43&#127;K45&#127;K46&#127;K47&#127;K48&#127;K49&#127;K5&#127;K50&#127;K51&#127;K52&#127;K53&#127;K54&#127;K55&#127;K58&#127;K59&#127;K6&#127;K60&#127;K61&#127;K62&#127;K63&#127;K64&#127;K65&#127;K66&#127;K67&#127;K68&#127;K69&#127;K70&#127;K71&#127;K73&#127;K74&#127;K75&#127;K76&#127;K77&#127;K78&#127;K79&#127;K80&#127;K81&#127;K82&#127;K83&#127;K84&#127;K85&#127;K86&#127;K87&#127;K88&#127;K89&#127;K90&#127;K91&#127;K92&#127;K93&#127;K94&#127;K95&#127;K96&#127;K97&#127;K98&#127;K99&#127;KA&#127;KAT&#127;KB&#127;KBA&#127;KCC&#127;KD&#127;KDW&#127;KEL&#127;KF&#127;KG&#127;KGM&#127;KGS&#127;KHY&#127;KHZ&#127;KI&#127;KIC&#127;KIP&#127;KJ&#127;KJO&#127;KL&#127;KLK&#127;KMA&#127;KMH&#127;KMK&#127;KMQ&#127;KMT&#127;KNI&#127;KNS&#127;KNT&#127;KO&#127;KPA&#127;KPH&#127;KPO&#127;KPP&#127;KR&#127;KS&#127;KSD&#127;KSH&#127;KT&#127;KTM&#127;KTN&#127;KUR&#127;KVA&#127;KVR&#127;KVT&#127;KW&#127;KWH&#127;KWO&#127;KWT&#127;KX&#127;L10&#127;L11&#127;L12&#127;L13&#127;L14&#127;L15&#127;L16&#127;L17&#127;L18&#127;L19&#127;L2&#127;L20&#127;L21&#127;L23&#127;L24&#127;L25&#127;L26&#127;L27&#127;L28&#127;L29&#127;L30&#127;L31&#127;L32&#127;L33&#127;L34&#127;L35&#127;L36&#127;L37&#127;L38&#127;L39&#127;L40&#127;L41&#127;L42&#127;L43&#127;L44&#127;L45&#127;L46&#127;L47&#127;L48&#127;L49&#127;L50&#127;L51&#127;L52&#127;L53&#127;L54&#127;L55&#127;L56&#127;L57&#127;L58&#127;L59&#127;L60&#127;L61&#127;L62&#127;L63&#127;L64&#127;L65&#127;L66&#127;L67&#127;L68&#127;L69&#127;L70&#127;L71&#127;L72&#127;L73&#127;L74&#127;L75&#127;L76&#127;L77&#127;L78&#127;L79&#127;L80&#127;L81&#127;L82&#127;L83&#127;L84&#127;L85&#127;L86&#127;L87&#127;L88&#127;L89&#127;L90&#127;L91&#127;L92&#127;L93&#127;L94&#127;L95&#127;L96&#127;L98&#127;L99&#127;LA&#127;LAC&#127;LBR&#127;LBT&#127;LC&#127;LD&#127;LE&#127;LEF&#127;LF&#127;LH&#127;LI&#127;LJ&#127;LK&#127;LM&#127;LN&#127;LO&#127;LP&#127;LPA&#127;LR&#127;LS&#127;LTN&#127;LTR&#127;LUB&#127;LUM&#127;LUX&#127;LX&#127;LY&#127;M0&#127;M1&#127;M10&#127;M11&#127;M12&#127;M13&#127;M14&#127;M15&#127;M16&#127;M17&#127;M18&#127;M19&#127;M20&#127;M21&#127;M22&#127;M23&#127;M24&#127;M25&#127;M26&#127;M27&#127;M29&#127;M30&#127;M31&#127;M32&#127;M33&#127;M34&#127;M35&#127;M36&#127;M37&#127;M4&#127;M5&#127;M7&#127;M9&#127;MA&#127;MAH&#127;MAL&#127;MAM&#127;MAR&#127;MAW&#127;MBE&#127;MBF&#127;MBR&#127;MC&#127;MCU&#127;MD&#127;MF&#127;MGM&#127;MHZ&#127;MIK&#127;MIL&#127;MIN&#127;MIO&#127;MIU&#127;MK&#127;MLD&#127;MLT&#127;MMK&#127;MMQ&#127;MMT&#127;MND&#127;MON&#127;MPA&#127;MQ&#127;MQH&#127;MQS&#127;MSK&#127;MT&#127;MTK&#127;MTQ&#127;MTR&#127;MTS&#127;MV&#127;MVA&#127;MWH&#127;N1&#127;N2&#127;N3&#127;NA&#127;NAR&#127;NB&#127;NBB&#127;NC&#127;NCL&#127;ND&#127;NE&#127;NEW&#127;NF&#127;NG&#127;NH&#127;NI&#127;NIL&#127;NIU&#127;NJ&#127;NL&#127;NMI&#127;NMP&#127;NN&#127;NPL&#127;NPR&#127;NPT&#127;NQ&#127;NR&#127;NRL&#127;NT&#127;NTT&#127;NU&#127;NV&#127;NX&#127;NY&#127;OA&#127;ODE&#127;OHM&#127;ON&#127;ONZ&#127;OP&#127;OT&#127;OZ&#127;OZA&#127;OZI&#127;P0&#127;P1&#127;P2&#127;P3&#127;P4&#127;P5&#127;P6&#127;P7&#127;P8&#127;P9&#127;PA&#127;PAL&#127;PB&#127;PD&#127;PE&#127;PF&#127;PFL&#127;PG&#127;PGL&#127;PI&#127;PK&#127;PL&#127;PLA&#127;PM&#127;PN&#127;PO&#127;PQ&#127;PR&#127;PS&#127;PT&#127;PTD&#127;PTI&#127;PTL&#127;PU&#127;PV&#127;PW&#127;PY&#127;PZ&#127;Q3&#127;QA&#127;QAN&#127;QB&#127;QD&#127;QH&#127;QK&#127;QR&#127;QT&#127;QTD&#127;QTI&#127;QTL&#127;QTR&#127;R1&#127;R4&#127;R9&#127;RA&#127;RD&#127;RG&#127;RH&#127;RK&#127;RL&#127;RM&#127;RN&#127;RO&#127;RP&#127;RPM&#127;RPS&#127;RS&#127;RT&#127;RU&#127;S3&#127;S4&#127;S5&#127;S6&#127;S7&#127;S8&#127;SA&#127;SAN&#127;SCO&#127;SCR&#127;SD&#127;SE&#127;SEC&#127;SET&#127;SG&#127;SHT&#127;SIE&#127;SK&#127;SL&#127;SMI&#127;SN&#127;SO&#127;SP&#127;SQ&#127;SQR&#127;SR&#127;SS&#127;SST&#127;ST&#127;STI&#127;STK&#127;STL&#127;STN&#127;SV&#127;SW&#127;SX&#127;T0&#127;T1&#127;T3&#127;T4&#127;T5&#127;T6&#127;T7&#127;T8&#127;TA&#127;TAH&#127;TC&#127;TD&#127;TE&#127;TF&#127;TI&#127;TIC&#127;TIP&#127;TJ&#127;TK&#127;TL&#127;TMS&#127;TN&#127;TNE&#127;TP&#127;TPR&#127;TQ&#127;TQD&#127;TR&#127;TRL&#127;TS&#127;TSD&#127;TSH&#127;TT&#127;TU&#127;TV&#127;TW&#127;TY&#127;U1&#127;U2&#127;UA&#127;UB&#127;UC&#127;UD&#127;UE&#127;UF&#127;UH&#127;UM&#127;VA&#127;VI&#127;VLT&#127;VP&#127;VQ&#127;VS&#127;W2&#127;W4&#127;WA&#127;WB&#127;WCD&#127;WE&#127;WEB&#127;WEE&#127;WG&#127;WH&#127;WHR&#127;WI&#127;WM&#127;WR&#127;WSD&#127;WTT&#127;WW&#127;X1&#127;YDK&#127;YDQ&#127;YL&#127;YRD&#127;YT&#127;Z1&#127;Z2&#127;Z3&#127;Z4&#127;Z5&#127;Z6&#127;Z8&#127;ZP&#127;ZZ&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[OP-T76-R006]-Unit code MUST be coded according to the UN/ECE Recommendation 20 (2009)          </ns0:assert>
</ns0:rule>

<ns0:rule context="@currencyID" flag="fatal" role="fatal">
  <!--{}[](CurrencyCodeList)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](CurrencyCodeList)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;AED&#127;AFN&#127;ALL&#127;AMD&#127;ANG&#127;AOA&#127;ARS&#127;AUD&#127;AWG&#127;AZN&#127;BAM&#127;BBD&#127;BDT&#127;BGN&#127;BHD&#127;BIF&#127;BMD&#127;BND&#127;BOB&#127;BOV&#127;BRL&#127;BSD&#127;BTN&#127;BWP&#127;BYR&#127;BZD&#127;CAD&#127;CDF&#127;CHE&#127;CHF&#127;CHW&#127;CLF&#127;CLP&#127;CNY&#127;COP&#127;COU&#127;CRC&#127;CUP&#127;CVE&#127;CZK&#127;DJF&#127;DKK&#127;DOP&#127;DZD&#127;EEK&#127;EGP&#127;ERN&#127;ETB&#127;EUR&#127;FJD&#127;FKP&#127;GBP&#127;GEL&#127;GHS&#127;GIP&#127;GMD&#127;GNF&#127;GTQ&#127;GWP&#127;GYD&#127;HKD&#127;HNL&#127;HRK&#127;HTG&#127;HUF&#127;IDR&#127;ILS&#127;INR&#127;IQD&#127;IRR&#127;ISK&#127;JMD&#127;JOD&#127;JPY&#127;KES&#127;KGS&#127;KHR&#127;KMF&#127;KPW&#127;KRW&#127;KWD&#127;KYD&#127;KZT&#127;LAK&#127;LBP&#127;LKR&#127;LRD&#127;LSL&#127;LTL&#127;LVL&#127;LYD&#127;MAD&#127;MDL&#127;MGA&#127;MKD&#127;MMK&#127;MNT&#127;MOP&#127;MRO&#127;MUR&#127;MVR&#127;MWK&#127;MXN&#127;MXV&#127;MYR&#127;MZN&#127;NAD&#127;NGN&#127;NIO&#127;NOK&#127;NPR&#127;NZD&#127;OMR&#127;PAB&#127;PEN&#127;PGK&#127;PHP&#127;PKR&#127;PLN&#127;PYG&#127;QAR&#127;RON&#127;RSD&#127;RUB&#127;RWF&#127;SAR&#127;SBD&#127;SCR&#127;SDG&#127;SEK&#127;SGD&#127;SHP&#127;SKK&#127;SLL&#127;SOS&#127;SRD&#127;STD&#127;SVC&#127;SYP&#127;SZL&#127;THB&#127;TJS&#127;TMM&#127;TND&#127;TOP&#127;TRY&#127;TTD&#127;TWD&#127;TZS&#127;UAH&#127;UGX&#127;USD&#127;USN&#127;USS&#127;UYI&#127;UYU&#127;UZS&#127;VEF&#127;VND&#127;VUV&#127;WST&#127;XAF&#127;XAG&#127;XAU&#127;XBA&#127;XBB&#127;XBC&#127;XBD&#127;XCD&#127;XDR&#127;XFU&#127;XOF&#127;XPD&#127;XPF&#127;XTS&#127;XXX&#127;YER&#127;ZAR&#127;ZMK&#127;ZWR&#127;ZWD&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[OP-T76-R007]-CurrencyID MUST be coded using ISO code list 4217          </ns0:assert>
</ns0:rule>

<ns0:rule context="cac:TaxCategory/cbc:ID" flag="fatal" role="fatal">
  <!--{}[](TaxCategoryID)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](TaxCategoryID)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;AE&#127;E&#127;S&#127;Z&#127;AA&#127;H&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[OP-T76-R008]-A tax category identifier MUST be coded using UN/ECE 5305 BII2 Subset          </ns0:assert>
</ns0:rule>
<!--
    End of synthesis of rules from code list context associations.
-->
</ns0:pattern>
    </for-each>
  </template>

<key match="ccs:Identification" name="identification" use="@xml:id" />


<!--{}(CurrencyCodeList)-->
<ns0:Identification xmlns:ns0="urn:x-Crane:ss:Crane-Constraints2Schematron" xml:id="d260e3">

<ns1:Identification xmlns:ns1="">
      <ns1:ShortName>CurrencyCodeList</ns1:ShortName>
      <ns1:Version>2008</ns1:Version>
      <ns1:CanonicalUri>ISO</ns1:CanonicalUri>
      <ns1:CanonicalVersionUri>ISO-2008</ns1:CanonicalVersionUri>
      <ns1:LocationUri />
    </ns1:Identification>
</ns0:Identification>

<!--{}(OrderResponseCode)-->
<ns0:Identification xmlns:ns0="urn:x-Crane:ss:Crane-Constraints2Schematron" xml:id="d260e4">

<ns1:Identification xmlns:ns1="">
      <ns1:ShortName>OrderResponseCode</ns1:ShortName>
      <ns1:Version />
      <ns1:CanonicalUri>UN CEFACT</ns1:CanonicalUri>
      <ns1:CanonicalVersionUri>UN CEFACT</ns1:CanonicalVersionUri>
      <ns1:LocationUri />
    </ns1:Identification>
</ns0:Identification>

<!--{}(PartyIdentifierScheme)-->
<ns0:Identification xmlns:ns0="urn:x-Crane:ss:Crane-Constraints2Schematron" xml:id="d260e5">

<ns1:Identification xmlns:ns1="">
      <ns1:ShortName>PartyIdentifier</ns1:ShortName>
      <ns1:Version>2013</ns1:Version>
      <ns1:CanonicalUri>PEPPOL</ns1:CanonicalUri>
      <ns1:CanonicalVersionUri>PEPPOL-2013</ns1:CanonicalVersionUri>
      <ns1:LocationUri />
    </ns1:Identification>
</ns0:Identification>

<!--{}(TaxCategoryID)-->
<ns0:Identification xmlns:ns0="urn:x-Crane:ss:Crane-Constraints2Schematron" xml:id="d260e6">

<ns1:Identification xmlns:ns1="">
      <ns1:ShortName>TaxCategoryID</ns1:ShortName>
      <ns1:Version />
      <ns1:CanonicalUri>United Nations Economic Commission for Europe</ns1:CanonicalUri>
      <ns1:CanonicalVersionUri>United Nations Economic Commission for Europe</ns1:CanonicalVersionUri>
      <ns1:LocationUri />
    </ns1:Identification>
</ns0:Identification>

<!--{}(UnitCode)-->
<ns0:Identification xmlns:ns0="urn:x-Crane:ss:Crane-Constraints2Schematron" xml:id="d260e7">

<ns1:Identification xmlns:ns1="">
      <ns1:ShortName>UnitOfMeasureCode</ns1:ShortName>
      <ns1:Version>Revision 6e 2009</ns1:Version>
      <ns1:CanonicalUri>UN/ECE</ns1:CanonicalUri>
      <ns1:CanonicalVersionUri>UN/ECE-Revision 6e 2009</ns1:CanonicalVersionUri>
      <ns1:LocationUri>http://www.unece.org/cefact/recommendations/rec20/Rec20_Rev6e_2009.xls</ns1:LocationUri>
    </ns1:Identification>
</ns0:Identification>
<!--
    End of synthesis of tests from code list context associations.
-->
</stylesheet>
