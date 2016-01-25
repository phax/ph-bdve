<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Abstract Schematron rules for T19-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T19">
  <rule context="$Catalogue">
    <assert flag="fatal" test="$BII2-T19-R001" id="BII2-T19-R001">[BII2-T19-R001]-A catalogue MUST have a customization identifier</assert>
    <assert flag="fatal" test="$BII2-T19-R002" id="BII2-T19-R002">[BII2-T19-R002]-A catalogue MUST have a profile identifier</assert>
    <assert flag="fatal" test="$BII2-T19-R003" id="BII2-T19-R003">[BII2-T19-R003]-A catalogue MUST contain the date of issue</assert>
    <assert flag="fatal" test="$BII2-T19-R004" id="BII2-T19-R004">[BII2-T19-R004]-A catalogue MUST contain the catalogue document identifier</assert>
    <assert flag="fatal" test="$BII2-T19-R007" id="BII2-T19-R007">[BII2-T19-R007]-The party providing the catalogue MUST be specified</assert>
    <assert flag="fatal" test="$BII2-T19-R008" id="BII2-T19-R008">[BII2-T19-R008]-The party receiving the catalogue MUST be specified</assert>
    <assert flag="fatal" test="$BII2-T19-R009" id="BII2-T19-R009">[BII2-T19-R009]-A catalogue MUST have maximum one catalogue supplier</assert>
    <assert flag="fatal" test="$BII2-T19-R023" id="BII2-T19-R023">[BII2-T19-R023]-A catalogue MUST have at least one catalogue line</assert>
  </rule>
  <rule context="$Catalogue_Customer">
    <assert flag="fatal" test="$BII2-T19-R013" id="BII2-T19-R013">[BII2-T19-R013]-A catalogue customer MUST contain the full name or an identifier</assert>
  </rule>
  <rule context="$Catalogue_Line">
    <assert flag="warning" test="$BII2-T19-R017" id="BII2-T19-R017">[BII2-T19-R017]-Catalogue line validity period MUST be within the range of the whole catalogue validity period</assert>
    <assert flag="warning" test="$BII2-T19-R018" id="BII2-T19-R018">[BII2-T19-R018]-Price validity period MUST be within the range of the whole catalogue line validity period</assert>
    <assert flag="fatal" test="$BII2-T19-R024" id="BII2-T19-R024">[BII2-T19-R024]-A catalogue line MUST contain a unique line identifier</assert>
    <assert flag="fatal" test="$BII2-T19-R026" id="BII2-T19-R026">[BII2-T19-R026]-Orderable quantities MUST be greater than zero</assert>
    <assert flag="warning" test="$BII2-T19-R029" id="BII2-T19-R029">[BII2-T19-R029]-Maximum quantity MUST be greater than zero</assert>
    <assert flag="warning" test="$BII2-T19-R030" id="BII2-T19-R030">[BII2-T19-R030]-Minimum quantity MUST be greater than zero</assert>
    <assert flag="warning" test="$BII2-T19-R031" id="BII2-T19-R031">[BII2-T19-R031]-Maximum quantity MUST be greater or equal to the Minimum quantity</assert>
  </rule>
  <rule context="$Catalogue_Provider">
    <assert flag="fatal" test="$BII2-T19-R010" id="BII2-T19-R010">[BII2-T19-R010]-A catalogue provider MUST contain the full name or an identifier</assert>
  </rule>
  <rule context="$Catalogue_Receiver">
    <assert flag="fatal" test="$BII2-T19-R011" id="BII2-T19-R011">[BII2-T19-R011]-A catalogue receiver MUST contain the full name or an identifier</assert>
  </rule>
  <rule context="$Catalogue_Supplier">
    <assert flag="fatal" test="$BII2-T19-R012" id="BII2-T19-R012">[BII2-T19-R012]-A catalogue supplier MUST contain the full name or an identifier</assert>
  </rule>
  <rule context="$Item">
    <assert flag="warning" test="$BII2-T19-R019" id="BII2-T19-R019">[BII2-T19-R019]-An item in a catalogue line SHOULD have a name</assert>
    <assert flag="fatal" test="$BII2-T19-R020" id="BII2-T19-R020">[BII2-T19-R020]-An item in a catalogue line MUST be uniquely identifiable by at least one of the following:
- Catalogue Provider identifier
- Standard identifier</assert>
  </rule>
  <rule context="$Item_Commodity">
    <assert flag="warning" test="$BII2-T19-R022" id="BII2-T19-R022">[BII2-T19-R022]-Classification codes SHOULD contain the Classification scheme Identifier (e.g. CPV or UNSPSC)</assert>
  </rule>
  <rule context="$Item_Price">
    <assert flag="fatal" test="$BII2-T19-R015" id="BII2-T19-R015">[BII2-T19-R015]-Prices of items MUST not be negative</assert>
  </rule>
  <rule context="$Item_Property">
    <assert flag="fatal" test="$BII2-T19-R027" id="BII2-T19-R027">[BII2-T19-R027]-An item property data name  MUST specify a data value</assert>
  </rule>
  <rule context="$Item_Standard">
    <assert flag="warning" test="$BII2-T19-R021" id="BII2-T19-R021">[BII2-T19-R021]-Standard Identifiers SHOULD contain the Schema Identifier (e.g. GTIN)</assert>
  </rule>
  <rule context="$Validity_Period">
    <assert flag="fatal" test="$BII2-T19-R006" id="BII2-T19-R006">[BII2-T19-R006]-A validity period end date MUST be later or equal to a validity period start date if both validity period end date and validaty period start date are present</assert>
  </rule>
</pattern>
