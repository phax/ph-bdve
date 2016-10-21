/**
 * Copyright (C) 2014-2016 Philip Helger (www.helger.com)
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
package com.helger.bdve.spec;

import java.io.Serializable;

import javax.annotation.Nonnull;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.id.IHasID;
import com.helger.commons.name.IHasName;
import com.helger.jaxb.builder.IJAXBDocumentType;

/**
 * Represents a single transaction within an {@link ISpecificationProfile}.
 *
 * @author Philip Helger
 */
public interface ISpecificationTransaction extends IHasID <String>, IHasName, Serializable
{
  /**
   * @return The pseudo name of this transaction. Does not require translation.
   *         Neither <code>null</code> nor empty.
   */
  @Nonnull
  @Nonempty
  String getName ();

  /**
   * @return The expected underlying document type for this transaction.
   *         Required for XSD validation. Never <code>null</code>.
   */
  @Nonnull
  IJAXBDocumentType getJAXBDocumentType ();
}