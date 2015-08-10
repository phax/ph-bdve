<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<stylesheet exclude-result-prefixes="ccs" version="2.0" xmlns="http://www.w3.org/1999/XSL/Transform">
  <output indent="yes" />
  <template match="/">
    <for-each select="document('')">
      <ns0:pattern id="BIIRULES-T19" xmlns:ns0="http://purl.oclc.org/dsdl/schematron">
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

<ns0:rule context="cac:CatalogueLine/cbc:ActionCode/" flag="fatal" role="fatal">
  <!--{}[](ActionCode)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](ActionCode)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;Add&#127;Delete&#127;Update&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[CL-T19-R001]-The action code for a catalogue line MUST be Add, Update or Delete if present          </ns0:assert>
</ns0:rule>

<ns0:rule context="@mimeCode" flag="fatal" role="fatal">
  <!--{}[](BinaryObjectMimeCode)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](BinaryObjectMimeCode)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;application/activemessage&#127;application/andrew-inset&#127;application/applefile&#127;application/atom+xml&#127;application/atomicmail&#127;application/atomcat+xml&#127;application/atomsvc+xml&#127;application/auth-policy+xml&#127;application/batch-SMTP&#127;application/beep+xml&#127;application/cals-1840&#127;application/ccxml+xml&#127;application/cellml+xml&#127;application/cnrp+xml&#127;application/commonground&#127;application/conference-info+xml&#127;application/cpl+xml&#127;application/csta+xml&#127;application/CSTAdata+xml&#127;application/cybercash&#127;application/davmount+xml&#127;application/dca-rft&#127;application/dec-dx&#127;application/dialog-info+xml&#127;application/dicom&#127;application/dns&#127;application/dvcs&#127;application/ecmascript&#127;application/EDI-Consent&#127;application/EDIFACT&#127;application/EDI-X12&#127;application/epp+xml&#127;application/eshop&#127;application/example&#127;application/fastinfoset&#127;application/fastsoap&#127;application/fits&#127;application/font-tdpfr&#127;application/H224&#127;application/http&#127;application/hyperstudio&#127;application/iges&#127;application/im-iscomposing+xml&#127;application/index&#127;application/index.cmd&#127;application/index.obj&#127;application/index.response&#127;application/index.vnd&#127;application/iotp&#127;application/ipp&#127;application/isup&#127;application/javascript&#127;application/json&#127;application/kpml-request+xml&#127;application/kpml-response+xml&#127;application/mac-binhex40&#127;application/macwriteii&#127;application/marc&#127;application/mathematica&#127;application/mbms-associated-procedure-description+xml&#127;application/mbms-deregister+xml&#127;application/mbms-envelope+xml&#127;application/mbms-msk-response+xml&#127;application/mbms-msk+xml&#127;application/mbms-protection-description+xml&#127;application/mbms-reception-report+xml&#127;application/mbms-register-response+xml&#127;application/mbms-register+xml&#127;application/mbms-user-service-description+xml&#127;application/mbox&#127;application/media_control+xml&#127;application/mediaservercontrol+xml&#127;application/mikey&#127;application/moss-keys&#127;application/moss-signature&#127;application/mosskey-data&#127;application/mosskey-request&#127;application/mpeg4-generic&#127;application/mpeg4-iod&#127;application/mpeg4-iod-xmt&#127;application/mp4&#127;application/msword&#127;application/mxf&#127;application/nasdata&#127;application/news-message-id&#127;application/news-transmission&#127;application/nss&#127;application/ocsp-request&#127;application/ocsp-response&#127;application/octet-stream&#127;application/oda&#127;application/oebps-package+xml&#127;application/ogg&#127;application/parityfec&#127;application/pdf&#127;application/pgp-encrypted&#127;application/pgp-keys&#127;application/pgp-signature&#127;application/pidf+xml&#127;application/pkcs10&#127;application/pkcs7-mime&#127;application/pkcs7-signature&#127;application/pkix-cert&#127;application/pkixcmp&#127;application/pkix-crl&#127;application/pkix-pkipath&#127;application/pls+xml&#127;application/poc-settings+xml&#127;application/postscript&#127;application/prs.alvestrand.titrax-sheet&#127;application/prs.cww&#127;application/prs.nprend&#127;application/prs.plucker&#127;application/rdf+xml&#127;application/qsig&#127;application/reginfo+xml&#127;application/relax-ng-compact-syntax&#127;application/remote-printing&#127;application/resource-lists+xml&#127;application/riscos&#127;application/rlmi+xml&#127;application/rls-services+xml&#127;application/rtf&#127;application/rtx&#127;application/samlassertion+xml&#127;application/samlmetadata+xml&#127;application/sbml+xml&#127;application/scvp-cv-request&#127;application/scvp-cv-response&#127;application/scvp-vp-request&#127;application/scvp-vp-response&#127;application/sdp&#127;application/set-payment&#127;application/set-payment-initiation&#127;application/set-registration&#127;application/set-registration-initiation&#127;application/sgml&#127;application/sgml-open-catalog&#127;application/shf+xml&#127;application/sieve&#127;application/simple-filter+xml&#127;application/simple-message-summary&#127;application/simpleSymbolContainer&#127;application/slate&#127;application/smil (OBSOLETE)&#127;application/smil+xml&#127;application/soap+fastinfoset&#127;application/soap+xml&#127;application/sparql-query&#127;application/sparql-results+xml&#127;application/spirits-event+xml&#127;application/srgs&#127;application/srgs+xml&#127;application/ssml+xml&#127;application/timestamp-query&#127;application/timestamp-reply&#127;application/tve-trigger&#127;application/ulpfec&#127;application/vemmi&#127;application/vnd.3gpp.bsf+xml&#127;application/vnd.3gpp.pic-bw-large&#127;application/vnd.3gpp.pic-bw-small&#127;application/vnd.3gpp.pic-bw-var&#127;application/vnd.3gpp.sms&#127;application/vnd.3gpp2.bcmcsinfo+xml&#127;application/vnd.3gpp2.sms&#127;application/vnd.3gpp2.tcap&#127;application/vnd.3M.Post-it-Notes&#127;application/vnd.accpac.simply.aso&#127;application/vnd.accpac.simply.imp&#127;application/vnd.acucobol&#127;application/vnd.acucorp&#127;application/vnd.adobe.xdp+xml&#127;application/vnd.adobe.xfdf&#127;application/vnd.aether.imp&#127;application/vnd.americandynamics.acc&#127;application/vnd.amiga.ami&#127;application/vnd.anser-web-certificate-issue-initiation&#127;application/vnd.antix.game-component&#127;application/vnd.apple.installer+xml&#127;application/vnd.audiograph&#127;application/vnd.autopackage&#127;application/vnd.avistar+xml&#127;application/vnd.blueice.multipass&#127;application/vnd.bmi&#127;application/vnd.businessobjects&#127;application/vnd.cab-jscript&#127;application/vnd.canon-cpdl&#127;application/vnd.canon-lips&#127;application/vnd.cendio.thinlinc.clientconf&#127;application/vnd.chemdraw+xml&#127;application/vnd.chipnuts.karaoke-mmd&#127;application/vnd.cinderella&#127;application/vnd.cirpack.isdn-ext&#127;application/vnd.claymore&#127;application/vnd.clonk.c4group&#127;application/vnd.commerce-battelle&#127;application/vnd.commonspace&#127;application/vnd.cosmocaller&#127;application/vnd.contact.cmsg&#127;application/vnd.crick.clicker&#127;application/vnd.crick.clicker.keyboard&#127;application/vnd.crick.clicker.palette&#127;application/vnd.crick.clicker.template&#127;application/vnd.crick.clicker.wordbank&#127;application/vnd.criticaltools.wbs+xml&#127;application/vnd.ctc-posml&#127;application/vnd.ctct.ws+xml&#127;application/vnd.cups-pdf&#127;application/vnd.cups-postscript&#127;application/vnd.cups-ppd&#127;application/vnd.cups-raster&#127;application/vnd.cups-raw&#127;application/vnd.curl&#127;application/vnd.cybank&#127;application/vnd.data-vision.rdz&#127;application/vnd.denovo.fcselayout-link&#127;application/vnd.dna&#127;application/vnd.dpgraph&#127;application/vnd.dreamfactory&#127;application/vnd.dvb.esgcontainer&#127;application/vnd.dvb.ipdcesgaccess&#127;application/vnd.dxr&#127;application/vnd.ecdis-update&#127;application/vnd.ecowin.chart&#127;application/vnd.ecowin.filerequest&#127;application/vnd.ecowin.fileupdate&#127;application/vnd.ecowin.series&#127;application/vnd.ecowin.seriesrequest&#127;application/vnd.ecowin.seriesupdate&#127;application/vnd.enliven&#127;application/vnd.epson.esf&#127;application/vnd.epson.msf&#127;application/vnd.epson.quickanime&#127;application/vnd.epson.salt&#127;application/vnd.epson.ssf&#127;application/vnd.ericsson.quickcall&#127;application/vnd.eszigno3+xml&#127;application/vnd.eudora.data&#127;application/vnd.ezpix-album&#127;application/vnd.ezpix-package&#127;application/vnd.fdf&#127;application/vnd.ffsns&#127;application/vnd.fints&#127;application/vnd.FloGraphIt&#127;application/vnd.fluxtime.clip&#127;application/vnd.framemaker&#127;application/vnd.frogans.fnc&#127;application/vnd.frogans.ltf&#127;application/vnd.fsc.weblaunch&#127;application/vnd.fujitsu.oasys&#127;application/vnd.fujitsu.oasys2&#127;application/vnd.fujitsu.oasys3&#127;application/vnd.fujitsu.oasysgp&#127;application/vnd.fujitsu.oasysprs&#127;application/vnd.fujixerox.ART4&#127;application/vnd.fujixerox.ART-EX&#127;application/vnd.fujixerox.ddd&#127;application/vnd.fujixerox.docuworks&#127;application/vnd.fujixerox.docuworks.binder&#127;application/vnd.fujixerox.HBPL&#127;application/vnd.fut-misnet&#127;application/vnd.fuzzysheet&#127;application/vnd.genomatix.tuxedo&#127;application/vnd.google-earth.kml+xml&#127;application/vnd.google-earth.kmz&#127;application/vnd.grafeq&#127;application/vnd.gridmp&#127;application/vnd.groove-account&#127;application/vnd.groove-help&#127;application/vnd.groove-identity-message&#127;application/vnd.groove-injector&#127;application/vnd.groove-tool-message&#127;application/vnd.groove-tool-template&#127;application/vnd.groove-vcard&#127;application/vnd.HandHeld-Entertainment+xml&#127;application/vnd.hbci&#127;application/vnd.hcl-bireports&#127;application/vnd.hhe.lesson-player&#127;application/vnd.hp-HPGL&#127;application/vnd.hp-hpid&#127;application/vnd.hp-hps&#127;application/vnd.hp-jlyt&#127;application/vnd.hp-PCL&#127;application/vnd.hp-PCLXL&#127;application/vnd.httphone&#127;application/vnd.hzn-3d-crossword&#127;application/vnd.ibm.afplinedata&#127;application/vnd.ibm.electronic-media&#127;application/vnd.ibm.MiniPay&#127;application/vnd.ibm.modcap&#127;application/vnd.ibm.rights-management&#127;application/vnd.ibm.secure-container&#127;application/vnd.iccprofile&#127;application/vnd.igloader&#127;application/vnd.immervision-ivp&#127;application/vnd.immervision-ivu&#127;application/vnd.informedcontrol.rms+xml&#127;application/vnd.informix-visionary&#127;application/vnd.intercon.formnet&#127;application/vnd.intertrust.digibox&#127;application/vnd.intertrust.nncp&#127;application/vnd.intu.qbo&#127;application/vnd.intu.qfx&#127;application/vnd.ipunplugged.rcprofile&#127;application/vnd.irepository.package+xml&#127;application/vnd.is-xpr&#127;application/vnd.jam&#127;application/vnd.japannet-directory-service&#127;application/vnd.japannet-jpnstore-wakeup&#127;application/vnd.japannet-payment-wakeup&#127;application/vnd.japannet-registration&#127;application/vnd.japannet-registration-wakeup&#127;application/vnd.japannet-setstore-wakeup&#127;application/vnd.japannet-verification&#127;application/vnd.japannet-verification-wakeup&#127;application/vnd.jcp.javame.midlet-rms&#127;application/vnd.jisp&#127;application/vnd.joost.joda-archive&#127;application/vnd.kahootz&#127;application/vnd.kde.karbon&#127;application/vnd.kde.kchart&#127;application/vnd.kde.kformula&#127;application/vnd.kde.kivio&#127;application/vnd.kde.kontour&#127;application/vnd.kde.kpresenter&#127;application/vnd.kde.kspread&#127;application/vnd.kde.kword&#127;application/vnd.kenameaapp&#127;application/vnd.kidspiration&#127;application/vnd.Kinar&#127;application/vnd.koan&#127;application/vnd.kodak-descriptor&#127;application/vnd.liberty-request+xml&#127;application/vnd.llamagraphics.life-balance.desktop&#127;application/vnd.llamagraphics.life-balance.exchange+xml&#127;application/vnd.lotus-1-2-3&#127;application/vnd.lotus-approach&#127;application/vnd.lotus-freelance&#127;application/vnd.lotus-notes&#127;application/vnd.lotus-organizer&#127;application/vnd.lotus-screencam&#127;application/vnd.lotus-wordpro&#127;application/vnd.macports.portpkg&#127;application/vnd.marlin.drm.actiontoken+xml&#127;application/vnd.marlin.drm.conftoken+xml&#127;application/vnd.marlin.drm.mdcf&#127;application/vnd.mcd&#127;application/vnd.medcalcdata&#127;application/vnd.mediastation.cdkey&#127;application/vnd.meridian-slingshot&#127;application/vnd.MFER&#127;application/vnd.mfmp&#127;application/vnd.micrografx.flo&#127;application/vnd.micrografx.igx&#127;application/vnd.mif&#127;application/vnd.minisoft-hp3000-save&#127;application/vnd.mitsubishi.misty-guard.trustweb&#127;application/vnd.Mobius.DAF&#127;application/vnd.Mobius.DIS&#127;application/vnd.Mobius.MBK&#127;application/vnd.Mobius.MQY&#127;application/vnd.Mobius.MSL&#127;application/vnd.Mobius.PLC&#127;application/vnd.Mobius.TXF&#127;application/vnd.mophun.application&#127;application/vnd.mophun.certificate&#127;application/vnd.motorola.flexsuite&#127;application/vnd.motorola.flexsuite.adsi&#127;application/vnd.motorola.flexsuite.fis&#127;application/vnd.motorola.flexsuite.gotap&#127;application/vnd.motorola.flexsuite.kmr&#127;application/vnd.motorola.flexsuite.ttc&#127;application/vnd.motorola.flexsuite.wem&#127;application/vnd.mozilla.xul+xml&#127;application/vnd.ms-artgalry&#127;application/vnd.ms-asf&#127;application/vnd.ms-cab-compressed&#127;application/vnd.mseq&#127;application/vnd.ms-excel&#127;application/vnd.ms-fontobject&#127;application/vnd.ms-htmlhelp&#127;application/vnd.msign&#127;application/vnd.ms-ims&#127;application/vnd.ms-lrm&#127;application/vnd.ms-playready.initiator+xml&#127;application/vnd.ms-powerpoint&#127;application/vnd.ms-project&#127;application/vnd.ms-tnef&#127;application/vnd.ms-wmdrm.lic-chlg-req&#127;application/vnd.ms-wmdrm.lic-resp&#127;application/vnd.ms-wmdrm.meter-chlg-req&#127;application/vnd.ms-wmdrm.meter-resp&#127;application/vnd.ms-works&#127;application/vnd.ms-wpl&#127;application/vnd.ms-xpsdocument&#127;application/vnd.multiad.creator&#127;application/vnd.multiad.creator.cif&#127;application/vnd.musician&#127;application/vnd.music-niff&#127;application/vnd.muvee.style&#127;application/vnd.ncd.control&#127;application/vnd.ncd.reference&#127;application/vnd.nervana&#127;application/vnd.netfpx&#127;application/vnd.neurolanguage.nlu&#127;application/vnd.noblenet-directory&#127;application/vnd.noblenet-sealer&#127;application/vnd.noblenet-web&#127;application/vnd.nokia.catalogs&#127;application/vnd.nokia.conml+wbxml&#127;application/vnd.nokia.conml+xml&#127;application/vnd.nokia.iptv.config+xml&#127;application/vnd.nokia.iSDS-radio-presets&#127;application/vnd.nokia.landmark+wbxml&#127;application/vnd.nokia.landmark+xml&#127;application/vnd.nokia.landmarkcollection+xml&#127;application/vnd.nokia.ncd&#127;application/vnd.nokia.n-gage.ac+xml&#127;application/vnd.nokia.n-gage.data&#127;application/vnd.nokia.n-gage.symbian.install&#127;application/vnd.nokia.pcd+wbxml&#127;application/vnd.nokia.pcd+xml&#127;application/vnd.nokia.radio-preset&#127;application/vnd.nokia.radio-presets&#127;application/vnd.novadigm.EDM&#127;application/vnd.novadigm.EDX&#127;application/vnd.novadigm.EXT&#127;application/vnd.oasis.opendocument.chart&#127;application/vnd.oasis.opendocument.chart-template&#127;application/vnd.oasis.opendocument.formula&#127;application/vnd.oasis.opendocument.formula-template&#127;application/vnd.oasis.opendocument.graphics&#127;application/vnd.oasis.opendocument.graphics-template&#127;application/vnd.oasis.opendocument.image&#127;application/vnd.oasis.opendocument.image-template&#127;application/vnd.oasis.opendocument.presentation&#127;application/vnd.oasis.opendocument.presentation-template&#127;application/vnd.oasis.opendocument.spreadsheet&#127;application/vnd.oasis.opendocument.spreadsheet-template&#127;application/vnd.oasis.opendocument.text&#127;application/vnd.oasis.opendocument.text-master&#127;application/vnd.oasis.opendocument.text-template&#127;application/vnd.oasis.opendocument.text-web&#127;application/vnd.obn&#127;application/vnd.olpc-sugar&#127;application/vnd.oma.bcast.associated-procedure-parameter+xml&#127;application/vnd.oma.bcast.drm-trigger+xml&#127;application/vnd.oma.bcast.imd+xml&#127;application/vnd.oma.bcast.ltkm&#127;application/vnd.oma.bcast.notification+xml&#127;application/vnd.oma.bcast.sgboot&#127;application/vnd.oma.bcast.sgdd+xml&#127;application/vnd.oma.bcast.sgdu&#127;application/vnd.oma.bcast.simple-symbol-container&#127;application/vnd.oma.bcast.smartcard-trigger+xml&#127;application/vnd.oma.bcast.sprov+xml&#127;application/vnd.oma.bcast.stkm&#127;application/vnd.oma.dd2+xml&#127;application/vnd.oma.drm.risd+xml&#127;application/vnd.oma.group-usage-list+xml&#127;application/vnd.oma.poc.detailed-progress-report+xml&#127;application/vnd.oma.poc.final-report+xml&#127;application/vnd.oma.poc.groups+xml&#127;application/vnd.oma.poc.invocation-descriptor+xml&#127;application/vnd.oma.poc.optimized-progress-report+xml&#127;application/vnd.oma.xcap-directory+xml&#127;application/vnd.omads-email+xml&#127;application/vnd.omads-file+xml&#127;application/vnd.omads-folder+xml&#127;application/vnd.omaloc-supl-init&#127;application/vnd.oma-scws-config&#127;application/vnd.oma-scws-http-request&#127;application/vnd.oma-scws-http-response&#127;application/vnd.openofficeorg.extension&#127;application/vnd.osa.netdeploy&#127;application/vnd.osgi.bundle&#127;application/vnd.osgi.dp&#127;application/vnd.otps.ct-kip+xml&#127;application/vnd.palm&#127;application/vnd.paos.xml&#127;application/vnd.pg.format&#127;application/vnd.pg.osasli&#127;application/vnd.piaccess.application-licence&#127;application/vnd.picsel&#127;application/vnd.poc.group-advertisement+xml&#127;application/vnd.pocketlearn&#127;application/vnd.powerbuilder6&#127;application/vnd.powerbuilder6-s&#127;application/vnd.powerbuilder7&#127;application/vnd.powerbuilder75&#127;application/vnd.powerbuilder75-s&#127;application/vnd.powerbuilder7-s&#127;application/vnd.preminet&#127;application/vnd.previewsystems.box&#127;application/vnd.proteus.magazine&#127;application/vnd.publishare-delta-tree&#127;application/vnd.pvi.ptid1&#127;application/vnd.pwg-multiplexed&#127;application/vnd.pwg-xhtml-print+xml&#127;application/vnd.qualcomm.brew-app-res&#127;application/vnd.Quark.QuarkXPress&#127;application/vnd.rapid&#127;application/vnd.recordare.musicxml&#127;application/vnd.recordare.musicxml+xml&#127;application/vnd.RenLearn.rlprint&#127;application/vnd.ruckus.download&#127;application/vnd.s3sms&#127;application/vnd.sbm.mid2&#127;application/vnd.scribus&#127;application/vnd.sealed.3df&#127;application/vnd.sealed.csf&#127;application/vnd.sealed.doc&#127;application/vnd.sealed.eml&#127;application/vnd.sealed.mht&#127;application/vnd.sealed.net&#127;application/vnd.sealed.ppt&#127;application/vnd.sealed.tiff&#127;application/vnd.sealed.xls&#127;application/vnd.sealedmedia.softseal.html&#127;application/vnd.sealedmedia.softseal.pdf&#127;application/vnd.seemail&#127;application/vnd.sema&#127;application/vnd.semd&#127;application/vnd.semf&#127;application/vnd.shana.informed.formdata&#127;application/vnd.shana.informed.formtemplate&#127;application/vnd.shana.informed.interchange&#127;application/vnd.shana.informed.package&#127;application/vnd.SimTech-MindMapper&#127;application/vnd.smaf&#127;application/vnd.solent.sdkm+xml&#127;application/vnd.spotfire.dxp&#127;application/vnd.spotfire.sfs&#127;application/vnd.sss-cod&#127;application/vnd.sss-dtf&#127;application/vnd.sss-ntf&#127;application/vnd.street-stream&#127;application/vnd.sun.wadl+xml&#127;application/vnd.sus-calendar&#127;application/vnd.svd&#127;application/vnd.swiftview-ics&#127;application/vnd.syncml.dm+wbxml&#127;application/vnd.syncml.dm+xml&#127;application/vnd.syncml.ds.notification&#127;application/vnd.syncml+xml&#127;application/vnd.tao.intent-module-archive&#127;application/vnd.tmobile-livetv&#127;application/vnd.trid.tpt&#127;application/vnd.triscape.mxs&#127;application/vnd.trueapp&#127;application/vnd.truedoc&#127;application/vnd.ufdl&#127;application/vnd.uiq.theme&#127;application/vnd.umajin&#127;application/vnd.unity&#127;application/vnd.uoml+xml&#127;application/vnd.uplanet.alert&#127;application/vnd.uplanet.alert-wbxml&#127;application/vnd.uplanet.bearer-choice&#127;application/vnd.uplanet.bearer-choice-wbxml&#127;application/vnd.uplanet.cacheop&#127;application/vnd.uplanet.cacheop-wbxml&#127;application/vnd.uplanet.channel&#127;application/vnd.uplanet.channel-wbxml&#127;application/vnd.uplanet.list&#127;application/vnd.uplanet.listcmd&#127;application/vnd.uplanet.listcmd-wbxml&#127;application/vnd.uplanet.list-wbxml&#127;application/vnd.uplanet.signal&#127;application/vnd.vcx&#127;application/vnd.vectorworks&#127;application/vnd.vd-study&#127;application/vnd.vidsoft.vidconference&#127;application/vnd.visio&#127;application/vnd.visionary&#127;application/vnd.vividence.scriptfile&#127;application/vnd.vsf&#127;application/vnd.wap.sic&#127;application/vnd.wap.slc&#127;application/vnd.wap.wbxml&#127;application/vnd.wap.wmlc&#127;application/vnd.wap.wmlscriptc&#127;application/vnd.webturbo&#127;application/vnd.wfa.wsc&#127;application/vnd.wmc&#127;application/vnd.wmf.bootstrap&#127;application/vnd.wordperfect&#127;application/vnd.wqd&#127;application/vnd.wrq-hp3000-labelled&#127;application/vnd.wt.stf&#127;application/vnd.wv.csp+xml&#127;application/vnd.wv.csp+wbxml&#127;application/vnd.wv.ssp+xml&#127;application/vnd.xara&#127;application/vnd.xfdl&#127;application/vnd.xmpie.cpkg&#127;application/vnd.xmpie.dpkg&#127;application/vnd.xmpie.plan&#127;application/vnd.xmpie.ppkg&#127;application/vnd.xmpie.xlim&#127;application/vnd.yamaha.hv-dic&#127;application/vnd.yamaha.hv-script&#127;application/vnd.yamaha.hv-voice&#127;application/vnd.yamaha.smaf-audio&#127;application/vnd.yamaha.smaf-phrase&#127;application/vnd.yellowriver-custom-menu&#127;application/vnd.zzazz.deck+xml&#127;application/voicexml+xml&#127;application/watcherinfo+xml&#127;application/whoispp-query&#127;application/whoispp-response&#127;application/wita&#127;application/wordperfect5.1&#127;application/wsdl+xml&#127;application/wspolicy+xml&#127;application/x400-bp&#127;application/xcap-att+xml&#127;application/xcap-caps+xml&#127;application/xcap-el+xml&#127;application/xcap-error+xml&#127;application/xcap-ns+xml&#127;application/xenc+xml&#127;application/xhtml-voice+xml (Obsolete)&#127;application/xhtml+xml&#127;application/xml&#127;application/xml-dtd&#127;application/xml-external-parsed-entity&#127;application/xmpp+xml&#127;application/xop+xml&#127;application/xv+xml&#127;application/zip&#127;audio/32kadpcm&#127;audio/3gpp&#127;audio/3gpp2&#127;audio/ac3&#127;audio/AMR&#127;audio/AMR-WB&#127;audio/amr-wb+&#127;audio/asc&#127;audio/basic&#127;audio/BV16&#127;audio/BV32&#127;audio/clearmode&#127;audio/CN&#127;audio/DAT12&#127;audio/dls&#127;audio/dsr-es201108&#127;audio/dsr-es202050&#127;audio/dsr-es202211&#127;audio/dsr-es202212&#127;audio/eac3&#127;audio/DVI4&#127;audio/EVRC&#127;audio/EVRC0&#127;audio/EVRC1&#127;audio/EVRCB&#127;audio/EVRCB0&#127;audio/EVRCB1&#127;audio/EVRC-QCP&#127;audio/EVRCWB&#127;audio/EVRCWB0&#127;audio/EVRCWB1&#127;audio/example&#127;audio/G722&#127;audio/G7221&#127;audio/G723&#127;audio/G726-16&#127;audio/G726-24&#127;audio/G726-32&#127;audio/G726-40&#127;audio/G728&#127;audio/G729&#127;audio/G7291&#127;audio/G729D&#127;audio/G729E&#127;audio/GSM&#127;audio/GSM-EFR&#127;audio/iLBC&#127;audio/L8&#127;audio/L16&#127;audio/L20&#127;audio/L24&#127;audio/LPC&#127;audio/mobile-xmf&#127;audio/MPA&#127;audio/mp4&#127;audio/MP4A-LATM&#127;audio/mpa-robust&#127;audio/mpeg&#127;audio/mpeg4-generic&#127;audio/parityfec&#127;audio/PCMA&#127;audio/PCMU&#127;audio/prs.sid&#127;audio/QCELP&#127;audio/RED&#127;audio/rtp-enc-aescm128&#127;audio/rRFC2045tp-midi&#127;audio/rtx&#127;audio/SMV&#127;audio/SMV0&#127;audio/SMV-QCP&#127;audio/sp-midi&#127;audio/t140c&#127;audio/t38&#127;audio/telephone-event&#127;audio/tone&#127;audio/ulpfec&#127;audio/VDVI&#127;audio/VMR-WB&#127;audio/vnd.3gpp.iufp&#127;audio/vnd.4SB&#127;audio/vnd.audiokoz&#127;audio/vnd.CELP&#127;audio/vnd.cisco.nse&#127;audio/vnd.cmles.radio-events&#127;audio/vnd.cns.anp1&#127;audio/vnd.cns.inf1&#127;audio/vnd.digital-winds&#127;audio/vnd.dlna.adts&#127;audio/vnd.dolby.mlp&#127;audio/vnd.everad.plj&#127;audio/vnd.hns.audio&#127;audio/vnd.lucent.voice&#127;audio/vnd.nokia.mobile-xmf&#127;audio/vnd.nortel.vbk&#127;audio/vnd.nuera.ecelp4800&#127;audio/vnd.nuera.ecelp7470&#127;audio/vnd.nuera.ecelp9600&#127;audio/vnd.octel.sbc&#127;audio/vnd.qcelp - DEPRECATED - Please use audio/qcelp&#127;audio/vnd.rhetorex.32kadpcm&#127;audio/vnd.sealedmedia.softseal.mpeg&#127;audio/vnd.vmx.cvsd&#127;image/cgm&#127;image/example&#127;image/fits&#127;image/g3fax&#127;image/gif&#127;image/ief&#127;image/jp2&#127;image/jpeg&#127;image/jpm&#127;image/jpx&#127;image/naplps&#127;image/png&#127;image/prs.btif&#127;image/prs.pti&#127;image/t38&#127;image/tiff&#127;image/tiff-fx&#127;image/vnd.adobe.photoshop&#127;image/vnd.cns.inf2&#127;image/vnd.djvu&#127;image/vnd.dwg&#127;image/vnd.dxf&#127;image/vnd.fastbidsheet&#127;image/vnd.fpx&#127;image/vnd.fst&#127;image/vnd.fujixerox.edmics-mmr&#127;image/vnd.fujixerox.edmics-rlc&#127;image/vnd.globalgraphics.pgb&#127;image/vnd.microsoft.icon&#127;image/vnd.mix&#127;image/vnd.ms-modi&#127;image/vnd.net-fpx&#127;image/vnd.sealed.png&#127;image/vnd.sealedmedia.softseal.gif&#127;image/vnd.sealedmedia.softseal.jpg&#127;image/vnd.svf&#127;image/vnd.wap.wbmp&#127;image/vnd.xiff&#127;message/CPIM&#127;message/delivery-status&#127;message/disposition-notification&#127;message/example&#127;message/external-body&#127;message/http&#127;message/news&#127;message/partial&#127;message/rfc822&#127;message/s-http&#127;message/sip&#127;message/sipfrag&#127;message/tracking-status&#127;message/vnd.si.simp&#127;model/example&#127;model/iges&#127;model/mesh&#127;model/vnd.dwf&#127;model/vnd.flatland.3dml&#127;model/vnd.gdl&#127;model/vnd.gs-gdl&#127;model/vnd.gtw&#127;model/vnd.moml+xml&#127;model/vnd.mts&#127;model/vnd.parasolid.transmit.binary&#127;model/vnd.parasolid.transmit.text&#127;model/vnd.vtu&#127;model/vrml&#127;multipart/alternative&#127;multipart/appledouble&#127;multipart/byteranges&#127;multipart/digest&#127;multipart/encrypted&#127;multipart/example&#127;multipart/form-data&#127;multipart/header-set&#127;multipart/mixed&#127;multipart/parallel&#127;multipart/related&#127;multipart/report&#127;multipart/signed&#127;multipart/voice-message&#127;text/calendar&#127;text/css&#127;text/csv&#127;text/directory&#127;text/dns&#127;text/ecmascript (obsolete)&#127;text/enriched&#127;text/example&#127;text/html&#127;text/javascript (obsolete)&#127;text/parityfec&#127;text/plain&#127;text/prs.fallenstein.rst&#127;text/prs.lines.tag&#127;text/RED&#127;text/rfc822-headers&#127;text/richtext&#127;text/rtf&#127;text/rtp-enc-aescm128&#127;text/rtx&#127;text/sgml&#127;text/t140&#127;text/tab-separated-values&#127;text/troff&#127;text/ulpfec&#127;text/uri-list&#127;text/vnd.abc&#127;text/vnd.curl&#127;text/vnd.DMClientScript&#127;text/vnd.esmertec.theme-descriptor&#127;text/vnd.fly&#127;text/vnd.fmi.flexstor&#127;text/vnd.in3d.3dml&#127;text/vnd.in3d.spot&#127;text/vnd.IPTC.NewsML&#127;text/vnd.IPTC.NITF&#127;text/vnd.latex-z&#127;text/vnd.motorola.reflex&#127;text/vnd.ms-mediapackage&#127;text/vnd.net2phone.commcenter.command&#127;text/vnd.si.uricatalogue&#127;text/vnd.sun.j2me.app-descriptor&#127;text/vnd.trolltech.linguist&#127;text/vnd.wap.si&#127;text/vnd.wap.sl&#127;text/vnd.wap.wml&#127;text/vnd.wap.wmlscript&#127;text/xml&#127;text/xml-external-parsed-entity&#127;video/3gpp&#127;video/3gpp2&#127;video/3gpp-tt&#127;video/BMPEG&#127;video/BT656&#127;video/CelB&#127;video/DV&#127;video/example&#127;video/H261&#127;video/H263&#127;video/H263-1998&#127;video/H263-2000&#127;video/H264&#127;video/JPEG&#127;video/MJ2&#127;video/MP1S&#127;video/MP2P&#127;video/MP2T&#127;video/mp4&#127;video/MP4V-ES&#127;video/MPV&#127;video/mpeg&#127;video/mpeg4-generic&#127;video/nv&#127;video/parityfec&#127;video/pointer&#127;video/quicktime&#127;video/raw&#127;video/rtp-enc-aescm128&#127;video/rtx&#127;video/SMPTE292M&#127;video/ulpfec&#127;video/vc1&#127;video/vnd.dlna.mpeg-tts&#127;video/vnd.fvt&#127;video/vnd.hns.video&#127;video/vnd.iptvforum.1dparityfec-1010&#127;video/vnd.iptvforum.1dparityfec-2005&#127;video/vnd.iptvforum.2dparityfec-1010&#127;video/vnd.iptvforum.2dparityfec-2005&#127;video/vnd.iptvforum.ttsavc&#127;video/vnd.iptvforum.ttsmpeg2&#127;video/vnd.motorola.video&#127;video/vnd.motorola.videop&#127;video/vnd.mpegurl&#127;video/vnd.nokia.interleaved-multimedia&#127;video/vnd.nokia.videovoip&#127;video/vnd.objectvideo&#127;video/vnd.sealed.mpeg1&#127;video/vnd.sealed.mpeg4&#127;video/vnd.sealed.swf&#127;video/vnd.sealedmedia.softseal.mov&#127;video/vnd.vivo&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[CL-T19-R002]-For Mime code in attribute use MIMEMediaType.          </ns0:assert>
</ns0:rule>

<ns0:rule context="cac:ClassifiedTaxCategory/cbc:ID/" flag="fatal" role="fatal">
  <!--{}[](TaxCategoryID)-->
  <text xml:space="preserve">
      </text>
          <comment>{}[](TaxCategoryID)</comment>
  <ns0:assert flag="fatal">
            <attribute name="test">( false() or ( contains('&#127;AE&#127;E&#127;S&#127;Z&#127;AA&#127;H&#127;',concat('&#127;',.,'&#127;')) ) ) </attribute>[CL-T19-R004]-Tax categories MUST be coded using UN/ECE 5305 code list          </ns0:assert>
</ns0:rule>
<!--
    End of synthesis of rules from code list context associations.
-->
</ns0:pattern>
    </for-each>
  </template>

<key match="ccs:Identification" name="identification" use="@xml:id" />


<!--{}(ActionCode)-->
<ns0:Identification xmlns:ns0="urn:x-Crane:ss:Crane-Constraints2Schematron" xml:id="d58e3">

<ns1:Identification xmlns:ns1="">
      <ns1:ShortName>ActionCode</ns1:ShortName>
      <ns1:Version>1.0</ns1:Version>
      <ns1:CanonicalUri>BII</ns1:CanonicalUri>
      <ns1:CanonicalVersionUri>BII-1.0</ns1:CanonicalVersionUri>
      <ns1:LocationUri />
    </ns1:Identification>
</ns0:Identification>

<!--{}(BinaryObjectMimeCode)-->
<ns0:Identification xmlns:ns0="urn:x-Crane:ss:Crane-Constraints2Schematron" xml:id="d58e4">

<ns1:Identification xmlns:ns1="">
      <ns1:ShortName>BinaryObjectMimeCode</ns1:ShortName>
      <ns1:Version>2008-11-12</ns1:Version>
      <ns1:CanonicalUri>IANA</ns1:CanonicalUri>
      <ns1:CanonicalVersionUri>IANA-2008-11-12</ns1:CanonicalVersionUri>
      <ns1:LocationUri />
    </ns1:Identification>
</ns0:Identification>

<!--{}(TaxCategoryID)-->
<ns0:Identification xmlns:ns0="urn:x-Crane:ss:Crane-Constraints2Schematron" xml:id="d58e5">

<ns1:Identification xmlns:ns1="">
      <ns1:ShortName>TaxCategoryID</ns1:ShortName>
      <ns1:Version />
      <ns1:CanonicalUri>United Nations Economic Commission for Europe</ns1:CanonicalUri>
      <ns1:CanonicalVersionUri>United Nations Economic Commission for Europe</ns1:CanonicalVersionUri>
      <ns1:LocationUri />
    </ns1:Identification>
</ns0:Identification>
<!--
    End of synthesis of tests from code list context associations.
-->
</stylesheet>