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
package com.helger.bdve.teapps;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.executorset.VESID;
import com.helger.bdve.executorset.ValidationExecutorSet;
import com.helger.bdve.executorset.ValidationExecutorSetRegistry;
import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.jaxb.builder.JAXBDocumentType;

/**
 * Generic TEAPPS validation configuration
 *
 * @author Philip Helger
 */
@Immutable
public final class TEAPPSValidation
{
  public static final String GROUP_ID = "com.tieto";
  public static final String VERSION_272 = "2.7.2";
  public static final String VERSION_30 = "3.0";

  public static final VESID VID_TEAPPS_272 = new VESID (GROUP_ID, "TEAPPSXML", VERSION_272);
  public static final VESID VID_TEAPPS_30 = new VESID (GROUP_ID, "TEAPPSXML", VERSION_30);

  private TEAPPSValidation ()
  {}

  /**
   * Register all standard TEAPPS validation execution sets to the provided
   * registry.
   *
   * @param aRegistry
   *        The registry to add the artefacts. May not be <code>null</code>.
   */
  public static void initTEAPPS (@Nonnull final ValidationExecutorSetRegistry aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    // No Schematrons here
    aRegistry.registerValidationExecutorSet (ValidationExecutorSet.create (VID_TEAPPS_272,
                                                                           "TEAPPSXML " + VERSION_272,
                                                                           new ValidationArtefactKey.Builder ().setDocType (new JAXBDocumentType (String.class,
                                                                                                                                                  new CommonsArrayList <> ("/schemas/TEAPPSXMLv272_schema_INVOICES.xsd"),
                                                                                                                                                  null))
                                                                                                               .build (),
                                                                           false));
  }
}