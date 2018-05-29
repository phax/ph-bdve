/**
 * Copyright (C) 2014-2018 Philip Helger (www.helger.com)
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
package com.helger.bdve.peppol;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.bdve.key.ValidationArtefactSectorKey;
import com.helger.bdve.spec.EBIITransaction;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;

/**
 * Peppol validation artefacts etc
 *
 * @author Philip Helger
 */
@Immutable
public final class CPeppolValidationArtefact
{
  @Nonnull
  private static ClassLoader _getCL ()
  {
    return CPeppolValidationArtefact.class.getClassLoader ();
  }

  // Predefined transaction keys, ordered by BIS and than by BII2 transaction
  public static final ValidationArtefactKey VK_CATALOGUE_01_T19 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T19)
                                                                                                      .build ();
  public static final ValidationArtefactKey VK_CATALOGUE_01_T58 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T58)
                                                                                                      .build ();
  public static final ValidationArtefactKey VK_ORDER_03_T01 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T01)
                                                                                                  .build ();
  public static final ValidationArtefactKey VK_INVOICE_04_T10 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T10)
                                                                                                    .build ();
  public static final ValidationArtefactKey VK_INVOICE_04_T10_ATNAT = new ValidationArtefactKey.Builder (VK_INVOICE_04_T10).setCountry ("AT")
                                                                                                                           .setPrerequisiteXPath ("/ubl:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                                                           .build ();
  public static final ValidationArtefactKey VK_INVOICE_04_T10_ATGOV = new ValidationArtefactKey.Builder (VK_INVOICE_04_T10_ATNAT).setSectorKey (CPeppolValidationArtefact.SECTOR_AT_GOV)
                                                                                                                                 .build ();
  public static final ValidationArtefactKey VK_BILLING_05_T14 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T14)
                                                                                                    .build ();
  public static final ValidationArtefactKey VK_BILLING_05_T14_ATNAT = new ValidationArtefactKey.Builder (VK_BILLING_05_T14).setCountry ("AT")
                                                                                                                           .setPrerequisiteXPath ("/ubl:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'AT'")
                                                                                                                           .build ();
  public static final ValidationArtefactKey VK_BILLING_05_T14_ATGOV = new ValidationArtefactKey.Builder (VK_BILLING_05_T14_ATNAT).setSectorKey (CPeppolValidationArtefact.SECTOR_AT_GOV)
                                                                                                                                 .build ();
  public static final ValidationArtefactKey VK_PUNCH_OUT_18_T77 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T77)
                                                                                                      .build ();
  public static final ValidationArtefactKey VK_ORDERING_28_T01 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T01)
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_ORDERING_28_T76 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T76)
                                                                                                     .build ();
  public static final ValidationArtefactKey VK_DESPATCH_ADVICE_30_T16 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T16)
                                                                                                            .build ();
  public static final ValidationArtefactKey VK_MLR_36_T71 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T71)
                                                                                                .build ();
  public static final ValidationArtefactKey VK_ORDER_AGREEMENT_42_T110 = new ValidationArtefactKey.Builder ().setTransaction (EBIITransaction.T110)
                                                                                                             .build ();

  public static final ValidationArtefactSectorKey SECTOR_AT_GOV = new ValidationArtefactSectorKey ("ATGOV",
                                                                                                   "Austrian Government");

  // Third party
  public static final IReadableResource INVOICE_AT_NAT = new ClassPathResource ("/thirdparty/invoice/ATNAT-UBL-T10.sch",
                                                                                _getCL ());
  public static final IReadableResource INVOICE_AT_GOV = new ClassPathResource ("/thirdparty/invoice/ATGOV-UBL-T10.sch",
                                                                                _getCL ());

  public static final IReadableResource CREDIT_NOTE_AT_NAT = new ClassPathResource ("/thirdparty/creditnote/ATNAT-UBL-T14.sch",
                                                                                    _getCL ());
  public static final IReadableResource CREDIT_NOTE_AT_GOV = new ClassPathResource ("/thirdparty/creditnote/ATGOV-UBL-T14.sch",
                                                                                    _getCL ());

  private CPeppolValidationArtefact ()
  {}
}
