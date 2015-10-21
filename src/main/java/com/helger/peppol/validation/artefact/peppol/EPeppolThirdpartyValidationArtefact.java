/**
 * Copyright (C) 2014-2015 Philip Helger (www.helger.com)
 * philip[at]helger[dot]com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.helger.peppol.validation.artefact.peppol;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Nonnull;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.peppol.validation.artefact.IValidationArtefact;
import com.helger.peppol.validation.domain.TransactionKey;
import com.helger.peppol.validation.domain.peppol.PeppolTransactionKey;

/**
 * This enumeration contains all the extended country specific OpenPEPPOL
 * Schematron artefacts I'm aware of. They are ordered ascending country, than
 * by BIS number, by transaction and finally by desired execution order.
 *
 * @author Philip Helger
 */
public enum EPeppolThirdpartyValidationArtefact implements IValidationArtefact
{
 INVOICE_AT_NAT ("Invoice-Thirdparty/ATNAT-UBL-T10.sch",
                 new TransactionKey.Builder (PeppolTransactionKey.INVOICE_04_T10).setCountry ("AT")
                                                                                 .setPrerequisiteXPath ("/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                 .build ()),
 INVOICE_AT_GOV ("Invoice-Thirdparty/ATGOV-UBL-T10.sch",
                 new TransactionKey.Builder (PeppolTransactionKey.INVOICE_04_T10).setCountry ("AT")
                                                                                 .setIsSectorSpecific (true)
                                                                                 .setPrerequisiteXPath ("/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                 .build ()),

 BILLING_CREDIT_NOTE_AT_NAT ("Billing-Thirdparty/ATNAT-UBL-T14.sch",
                             new TransactionKey.Builder (PeppolTransactionKey.BILLING_05_T14).setCountry ("AT")
                                                                                             .setPrerequisiteXPath ("/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                             .build ()),
 BILLING_CREDIT_NOTE_AT_GOV ("Billing-Thirdparty/ATGOV-UBL-T14.sch",
                             new TransactionKey.Builder (PeppolTransactionKey.BILLING_05_T14).setCountry ("AT")
                                                                                             .setIsSectorSpecific (true)
                                                                                             .setPrerequisiteXPath ("/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                             .build ());

  private final ClassPathResource m_aResource;
  private final TransactionKey m_aTransactionKey;

  private EPeppolThirdpartyValidationArtefact (@Nonnull @Nonempty final String sPath, @Nonnull final TransactionKey aTransactionKey)
  {
    m_aResource = new ClassPathResource ("/peppol-rules/" + sPath);
    m_aTransactionKey = aTransactionKey;
  }

  @Nonnull
  public IReadableResource getSchematronResource ()
  {
    return m_aResource;
  }

  @Nonnull
  public TransactionKey getTransactionKey ()
  {
    return m_aTransactionKey;
  }

  /**
   * Get all validation artefacts matching the passed transaction key in the
   * correct execution order. It matches business specification, transaction,
   * country and sector?.
   *
   * @param aTransactionKey
   *        The transaction to search. May not be <code>null</code>.
   * @return A non-<code>null</code> list with all matching artefacts in the
   *         order they were defined. This list may be empty, if no matching
   *         artefact is present.
   */
  @Nonnull
  @ReturnsMutableCopy
  public static List <EPeppolThirdpartyValidationArtefact> getAllMatchingValidationArtefacts (@Nonnull final TransactionKey aTransactionKey)
  {
    ValueEnforcer.notNull (aTransactionKey, "TransactionKey");

    final List <EPeppolThirdpartyValidationArtefact> ret = new ArrayList <EPeppolThirdpartyValidationArtefact> ();
    for (final EPeppolThirdpartyValidationArtefact e : values ())
      if (e.getTransactionKey ().hasSameSpecificationAndTransactionAndCountryAndSector (aTransactionKey))
        ret.add (e);
    return ret;
  }
}
