<?xml version="1.0" encoding="UTF-8"?>
<!--This file is generated automatically! Do NOT edit!-->
<!--Schematron tests for binding UBL and transaction T10-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T10" id="UBL-T10">
  <param name="BII2-T10-R001" value="(cbc:CustomizationID)" />
  <param name="BII2-T10-R002" value="(cbc:ProfileID)" />
  <param name="BII2-T10-R003" value="(cbc:ID)" />
  <param name="BII2-T10-R004" value="(cbc:IssueDate)" />
  <param name="BII2-T10-R005" value="(cbc:DocumentCurrencyCode)" />
  <param name="BII2-T10-R006" value="(cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name) or (cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID)" />
  <param name="BII2-T10-R008" value="(cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name) or (cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID)" />
  <param name="BII2-T10-R010" value="(cac:LegalMonetaryTotal/cbc:LineExtensionAmount)" />
  <param name="BII2-T10-R011" value="(cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount)" />
  <param name="BII2-T10-R012" value="(cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount)" />
  <param name="BII2-T10-R013" value="(cac:LegalMonetaryTotal/cbc:PayableAmount)" />
  <param name="BII2-T10-R014" value="(cac:InvoiceLine)" />
  <param name="BII2-T10-R015" value="(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount) or not(cac:InvoiceLine/cac:TaxTotal)" />
  <param name="BII2-T10-R017" value="(cbc:ID)" />
  <param name="BII2-T10-R018" value="(cbc:InvoicedQuantity)" />
  <param name="BII2-T10-R019" value="(cbc:InvoicedQuantity/@unitCode)" />
  <param name="BII2-T10-R020" value="cbc:LineExtensionAmount" />
  <param name="BII2-T10-R021" value="(cac:Item/cbc:Name) or (cac:Item/cac:StandardItemIdentification/cbc:ID) or  (cac:Item/cac:SellersItemIdentification/cbc:ID)" />
  <param name="BII2-T10-R023" value="(cbc:StartDate)" />
  <param name="BII2-T10-R024" value="(cbc:EndDate)" />
  <param name="BII2-T10-R025" value="(cbc:AllowanceChargeReason)" />
  <param name="BII2-T10-R026" value="(//cac:TaxScheme/cbc:ID = 'VAT') or not(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount)" />
  <param name="BII2-T10-R027" value="(cbc:TaxableAmount)" />
  <param name="BII2-T10-R028" value="(cbc:TaxAmount)" />
  <param name="BII2-T10-R029" value="(cac:TaxCategory/cbc:ID)" />
  <param name="BII2-T10-R030" value="(cac:TaxCategory/cbc:Percent) or not(normalize-space(cac:TaxCategory/cbc:ID) = 'S')" />
  <param name="BII2-T10-R031" value="(cbc:StartDate and cbc:EndDate) and (number(translate(cbc:StartDate,'-','')) &lt;= number(translate(cbc:EndDate,'-','')))" />
  <param name="BII2-T10-R032" value="(cac:Item/cac:StandardItemIdentification/cbc:ID/@schemeID) or not(cac:Item/cac:StandardItemIdentification)" />
  <param name="BII2-T10-R033" value="(//cac:CommodityClassification/cbc:ItemClassificationCode/@listID) or not(//cac:CommodityClassification)" />
  <param name="BII2-T10-R034" value="(cac:Price/cbc:PriceAmount) >= 0" />
  <param name="BII2-T10-R035" value="(cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount) >= 0" />
  <param name="BII2-T10-R037" value="(cac:LegalMonetaryTotal/cbc:PayableAmount) >= 0" />
  <param name="BII2-T10-R039" value="((normalize-space(cbc:PaymentMeansCode) = '31') and (cac:PayeeFinancialAccount/cbc:ID)) or (string(cbc:PaymentMeansCode) != '31')" />
  <param name="BII2-T10-R040" value="(cac:PayeeFinancialAccount/cbc:ID/@schemeID and (cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') and cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID) or (cac:PayeeFinancialAccount/cbc:ID/@schemeID != 'IBAN') or (not(cac:PayeeFinancialAccount/cbc:ID/@schemeID))" />
  <param name="BII2-T10-R041" value="(cbc:PaymentMeansCode)" />
  <param name="BII2-T10-R042" value="(cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID='BIC') and (cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') or not(cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN')" />
  <param name="BII2-T10-R043" value="(/ubl:Invoice/cac:TaxTotal/*/*/*/cbc:ID = 'VAT') and (cac:TaxCategory/cbc:ID)" />
  <param name="BII2-T10-R044" value="(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not(cac:TaxTotal/*/*/*/cbc:ID = 'VAT')" />
  <param name="BII2-T10-R045" value="(cac:TaxCategory/cbc:TaxExemptionReason) or not ((normalize-space(cac:TaxCategory/cbc:ID)='E') or (normalize-space(cac:TaxCategory/cbc:ID)='AE'))" />
  <param name="BII2-T10-R046" value="(cac:Item/cac:ClassifiedTaxCategory/cbc:ID) or not(/ubl:Invoice/cac:TaxTotal/*/*/*/cbc:ID='VAT')" />
  <param name="BII2-T10-R047" value="(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not(cac:TaxTotal/*/*/cbc:ID = 'AE')" />
  <param name="BII2-T10-R048" value="count(child::cac:TaxTotal/*/*/cbc:ID) = count(child::cac:TaxTotal/*/*/cbc:ID[. = 'AE']) or count(child::cac:TaxTotal/*/*/cbc:ID[. = 'AE']) = 0" />
  <param name="BII2-T10-R049" value="(xs:decimal(cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxableAmount) = xs:decimal(cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount)) or  not(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE'])" />
  <param name="BII2-T10-R050" value="(xs:decimal(cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxAmount) = 0) or  not(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE'])" />
  <param name="BII2-T10-R051" value="(xs:decimal(cbc:LineExtensionAmount)) = (round(xs:decimal(sum(//cac:InvoiceLine/cbc:LineExtensionAmount)) * 10 * 10) div 100)" />
  <param name="BII2-T10-R052" value="((cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and ((xs:decimal(cbc:TaxExclusiveAmount)) = round((xs:decimal(cbc:LineExtensionAmount) + xs:decimal(cbc:ChargeTotalAmount) - xs:decimal(cbc:AllowanceTotalAmount)) * 10 * 10) div 100 ))  or (not(cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and ((xs:decimal(cbc:TaxExclusiveAmount)) = round((xs:decimal(cbc:LineExtensionAmount) - xs:decimal(cbc:AllowanceTotalAmount)) * 10 * 10 ) div 100)) or ((cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and ((xs:decimal(cbc:TaxExclusiveAmount)) = round((xs:decimal(cbc:LineExtensionAmount) + xs:decimal(cbc:ChargeTotalAmount)) * 10 * 10 ) div 100)) or (not(cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (xs:decimal(cbc:TaxExclusiveAmount) = xs:decimal(cbc:LineExtensionAmount)))" />
  <param name="BII2-T10-R053" value="((cbc:PayableRoundingAmount) and ((xs:decimal(cbc:TaxInclusiveAmount)) = (round((xs:decimal(cbc:TaxExclusiveAmount) + (xs:decimal(sum(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount))) + xs:decimal(cbc:PayableRoundingAmount)) *10 * 10) div 100))) or (not(cbc:PayableRoundingAmount) and  ((xs:decimal(cbc:TaxInclusiveAmount)) = round((xs:decimal(cbc:TaxExclusiveAmount) + (xs:decimal(sum(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount)))) * 10 * 10) div 100))" />
  <param name="BII2-T10-R054" value="(xs:decimal(cbc:AllowanceTotalAmount)) = (round(xs:decimal(sum(/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator=&quot;false&quot;]/cbc:Amount)) * 10 * 10) div 100) or not(cbc:AllowanceTotalAmount)" />
  <param name="BII2-T10-R055" value="(xs:decimal(cbc:ChargeTotalAmount)) = (round(xs:decimal(sum(/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator=&quot;true&quot;]/cbc:Amount)) * 10 * 10) div 100) or not(cbc:ChargeTotalAmount)" />
  <param name="BII2-T10-R056" value="((cbc:PrepaidAmount) and ((xs:decimal(cbc:PayableAmount)) = (round((xs:decimal(cbc:TaxInclusiveAmount) - xs:decimal(cbc:PrepaidAmount)) * 10 * 10) div 100))) or (xs:decimal(cbc:PayableAmount) = xs:decimal(cbc:TaxInclusiveAmount))" />
  <param name="BII2-T10-R058" value="((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount) and (round(xs:decimal(sum(cac:TaxTotal//cac:TaxSubtotal/cbc:TaxableAmount)) *10 * 10) div 100 = (xs:decimal(cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount)))) or  not((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']))" />
  <param name="Payment_Means" value="//cac:PaymentMeans" />
  <param name="VAT_category" value="//cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']" />
  <param name="Invoice_Line" value="//cac:InvoiceLine" />
  <param name="Invoice_Period_Information" value="//cac:InvoicePeriod" />
  <param name="Allowance_Charge" value="/ubl:Invoice/cac:AllowanceCharge" />
  <param name="Invoice" value="/ubl:Invoice" />
  <param name="Total_Invoice" value="//cac:LegalMonetaryTotal" />
</pattern>
