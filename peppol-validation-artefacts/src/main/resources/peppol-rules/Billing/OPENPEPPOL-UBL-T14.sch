<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Schematron assembly for OPENPEPPOL using binding UBL and transaction T14 based on OpenPEPPOL-T14-BusinessRules-v03.ods-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt">
  <title>OPENPEPPOL T14 bound to UBL</title>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
  <ns prefix="cec" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
  <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema" />
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" />
  <phase id="OPENPEPPOL_T14_phase">
    <active pattern="UBL-T14" />
  </phase>
  <phase id="codelist_phase">
    <active pattern="Codes-T14" />
  </phase>
  <include href="include/OPENPEPPOL-T14-abstract.sch" />
  <include href="include/OPENPEPPOL-UBL-T14-codes.sch" />
  <include href="include/OPENPEPPOL-UBL-T14-test.sch" />
</schema>