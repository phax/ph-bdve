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
package com.helger.peppol.validation;

import java.io.Serializable;

import javax.annotation.Nonnull;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.IResourceError;
import com.helger.commons.error.IResourceErrorGroup;
import com.helger.commons.error.ResourceErrorGroup;
import com.helger.commons.state.ETriState;
import com.helger.commons.state.ISuccessIndicator;
import com.helger.commons.string.ToStringGenerator;
import com.helger.peppol.validation.artefact.IValidationArtefact;

/**
 * This class captures the validation result of a single validation layer. It
 * contains the validation artefact and the errors occurred.
 *
 * @author Philip Helger
 */
public class ValidationLayerResult implements ISuccessIndicator, Serializable
{
  private final IValidationArtefact m_aValidationArtefact;
  private final IResourceErrorGroup m_aResourceErrors;
  private final ETriState m_eSuccess;

  public ValidationLayerResult (@Nonnull final IValidationArtefact aValidationArtefact, @Nonnull final IResourceError aResourceError)
  {
    this (aValidationArtefact, new ResourceErrorGroup (aResourceError));
  }

  public ValidationLayerResult (@Nonnull final IValidationArtefact aValidationArtefact, @Nonnull final Iterable <? extends IResourceError> aResourceErrors)
  {
    this (aValidationArtefact, new ResourceErrorGroup (aResourceErrors));
  }

  public ValidationLayerResult (@Nonnull final IValidationArtefact aValidationArtefact, @Nonnull final IResourceErrorGroup aResourceErrors)
  {
    this (aValidationArtefact, aResourceErrors, ETriState.valueOf (aResourceErrors.containsNoFailure ()));
  }

  private ValidationLayerResult (@Nonnull final IValidationArtefact aValidationArtefact, @Nonnull final IResourceErrorGroup aResourceErrors, @Nonnull final ETriState eSuccess)
  {
    m_aValidationArtefact = ValueEnforcer.notNull (aValidationArtefact, "ValidationArtefact");
    m_aResourceErrors = ValueEnforcer.notNull (aResourceErrors, "ResourceErrors");
    m_eSuccess = ValueEnforcer.notNull (eSuccess, "Success");
  }

  /**
   * @return The validation artefact used to perform validation. Never
   *         <code>null</code>.
   */
  @Nonnull
  public IValidationArtefact getValidationArtefact ()
  {
    return m_aValidationArtefact;
  }

  /**
   * @return The errors occurred during the validation execution on this layer.
   *         Never <code>null</code> but maybe empty.
   */
  @Nonnull
  public IResourceErrorGroup getResourceErrorGroup ()
  {
    return m_aResourceErrors;
  }

  public boolean isSuccess ()
  {
    return m_eSuccess.isTrue ();
  }

  public boolean isFailure ()
  {
    return m_eSuccess.isFalse ();
  }

  public boolean isIgnored ()
  {
    return m_eSuccess.isUndefined ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ValidationArtefact", m_aValidationArtefact).append ("ResourceErrorGroup", m_aResourceErrors).append ("Success", m_eSuccess).toString ();
  }

  @Nonnull
  public static ValidationLayerResult createIgnoredLayer (@Nonnull final IValidationArtefact aValidationArtefact)
  {
    return new ValidationLayerResult (aValidationArtefact, new ResourceErrorGroup (), ETriState.UNDEFINED);
  }
}
