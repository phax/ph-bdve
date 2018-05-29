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
package com.helger.bdve.key;

import java.io.Serializable;
import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.MustImplementEqualsAndHashcode;
import com.helger.commons.equals.EqualsHelper;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.locale.country.CountryCache;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;
import com.helger.jaxb.builder.IJAXBDocumentType;
import com.helger.xml.namespace.IIterableNamespaceContext;

/**
 * A validation key that uniquely identifies a set of validation artefacts. It
 * consists of the following elements:
 * <ul>
 * <li>A JAXB document type of type {@link IJAXBDocumentType}</li>
 * <li>An optional namespace context of type
 * {@link IIterableNamespaceContext}</li>
 * <li>An optional country code in case validation is country dependent.</li>
 * <li>An optional "sector key" of type {@link ValidationArtefactSectorKey} that
 * identifies the industry or sector to which the validation applies.</li>
 * <li>An optional "prerequisite expression" (like XPath) that may be used to
 * identify whether this validation key is applicable to a document or not.</li>
 * </ul>
 *
 * @author Philip Helger
 */
@Immutable
@MustImplementEqualsAndHashcode
public class ValidationArtefactKey implements Serializable
{
  private final IJAXBDocumentType m_aDocType;
  private final IIterableNamespaceContext m_aNamespaceContext;
  private final Locale m_aCountry;
  private final ValidationArtefactSectorKey m_aSectorKey;
  private final String m_sPrerequisiteXPath;

  public ValidationArtefactKey (@Nonnull final IJAXBDocumentType aDocType,
                                @Nullable final IIterableNamespaceContext aNamespaceContext,
                                @Nullable final String sCountryCode,
                                @Nullable final ValidationArtefactSectorKey aSectorKey,
                                @Nullable final String sPrerequisiteXPath)
  {
    ValueEnforcer.notNull (aDocType, "DocType");

    m_aDocType = aDocType;
    m_aNamespaceContext = aNamespaceContext;
    if (StringHelper.hasText (sCountryCode))
    {
      m_aCountry = CountryCache.getInstance ().getCountry (sCountryCode);
      if (m_aCountry == null)
        throw new IllegalArgumentException ("The passed country '" + sCountryCode + "' does not exist!");
    }
    else
      m_aCountry = null;
    m_aSectorKey = aSectorKey;
    m_sPrerequisiteXPath = sPrerequisiteXPath;
  }

  /**
   * @return The JAXB document type to be used. Never <code>null</code>.
   */
  @Nonnull
  public IJAXBDocumentType getJAXBDocumentType ()
  {
    return m_aDocType;
  }

  /**
   * @return An optional namespace prefix-to-url mapping to be used. Maybe
   *         <code>null</code>.
   */
  @Nullable
  public IIterableNamespaceContext getNamespaceContext ()
  {
    return m_aNamespaceContext;
  }

  /**
   * @return <code>true</code> if this validation key is country specific,
   *         <code>false</code> otherwise.
   */
  public boolean isCountrySpecific ()
  {
    return m_aCountry != null;
  }

  /**
   * @return The country locale as specified in the constructor.
   */
  @Nullable
  public Locale getCountryLocale ()
  {
    return m_aCountry;
  }

  /**
   * @return The country code extracted from the contained locale. Never
   *         <code>null</code>.
   */
  @Nullable
  public String getCountryCode ()
  {
    return m_aCountry == null ? null : m_aCountry.getCountry ();
  }

  /**
   * @return <code>true</code> if sector specific is enabled, <code>false</code>
   *         if not.
   */
  public boolean isSectorSpecific ()
  {
    return m_aSectorKey != null;
  }

  /**
   * @return The validation sector key specified in the constructor. May be
   *         <code>null</code> if not sector specific.
   */
  @Nullable
  public ValidationArtefactSectorKey getSectorKey ()
  {
    return m_aSectorKey;
  }

  /**
   * @return <code>true</code> if a prerequisite XPath expression is present,
   *         <code>false</code> if not
   */
  public boolean hasPrerequisiteXPath ()
  {
    return StringHelper.hasText (m_sPrerequisiteXPath);
  }

  /**
   * @return An optional prerequisite XPath expression that must match before
   *         the validation artefact can be applied. May be <code>null</code>.
   */
  @Nullable
  public String getPrerequisiteXPath ()
  {
    return m_sPrerequisiteXPath;
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final ValidationArtefactKey rhs = (ValidationArtefactKey) o;
    return m_aDocType.equals (rhs.m_aDocType) &&
           EqualsHelper.equals (m_aNamespaceContext, rhs.m_aNamespaceContext) &&
           EqualsHelper.equals (m_aCountry, rhs.m_aCountry) &&
           EqualsHelper.equals (m_aSectorKey, rhs.m_aSectorKey) &&
           EqualsHelper.equals (m_sPrerequisiteXPath, rhs.m_sPrerequisiteXPath);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aDocType)
                                       .append (m_aNamespaceContext)
                                       .append (m_aCountry)
                                       .append (m_aSectorKey)
                                       .append (m_sPrerequisiteXPath)
                                       .getHashCode ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("DocType", m_aDocType)
                                       .appendIfNotNull ("NamespaceContext", m_aNamespaceContext)
                                       .appendIfNotNull ("Country", m_aCountry)
                                       .appendIfNotNull ("SectorKey", m_aSectorKey)
                                       .appendIfNotNull ("PrerequisiteXPath", m_sPrerequisiteXPath)
                                       .getToString ();
  }

  /**
   * Builder class for {@link ValidationArtefactKey} objects.
   * {@link #setDocType(IJAXBDocumentType)} must be filled, as this field is
   * mandatory.
   *
   * @author Philip Helger
   */
  @NotThreadSafe
  public static class Builder
  {
    private IJAXBDocumentType m_aDocType;
    private IIterableNamespaceContext m_aNamespaceContext;
    private String m_sCountry;
    private ValidationArtefactSectorKey m_aSectorKey;
    private String m_sPrerequisiteXPath;

    /**
     * Create an empty Builder.
     */
    public Builder ()
    {}

    /**
     * Create a builder with the values of the provided validation artefact key.
     *
     * @param aOther
     *        Object to copy from. May not be <code>null</code>.
     */
    public Builder (@Nonnull final ValidationArtefactKey aOther)
    {
      m_aDocType = aOther.m_aDocType;
      m_aNamespaceContext = aOther.m_aNamespaceContext;
      m_sCountry = aOther.getCountryCode ();
      m_aSectorKey = aOther.m_aSectorKey;
      m_sPrerequisiteXPath = aOther.m_sPrerequisiteXPath;
    }

    /**
     * @param aDocType
     *        The JAXB document type to be used. May be <code>null</code>.
     * @return this for chaining
     */
    @Nonnull
    public Builder setDocType (@Nullable final IJAXBDocumentType aDocType)
    {
      m_aDocType = aDocType;
      return this;
    }

    /**
     * @param aNamespaceContext
     *        The namespace context to be used. May be <code>null</code>.
     * @return this for chaining
     */
    @Nonnull
    public Builder setNamespaceContext (@Nullable final IIterableNamespaceContext aNamespaceContext)
    {
      m_aNamespaceContext = aNamespaceContext;
      return this;
    }

    /**
     * @param sCountry
     *        The country code to be used. May be <code>null</code>.
     * @return this for chaining
     */
    @Nonnull
    public Builder setCountry (@Nullable final String sCountry)
    {
      m_sCountry = sCountry;
      return this;
    }

    /**
     * @param aSectorKey
     *        The sector specific validation key. May be <code>null</code>.
     * @return this for chaining
     */
    @Nonnull
    public Builder setSectorKey (@Nullable final ValidationArtefactSectorKey aSectorKey)
    {
      m_aSectorKey = aSectorKey;
      return this;
    }

    /**
     * @param sPrerequisiteXPath
     *        The optional prerequisite XPath that must be fulfilled to perform
     *        the validation. May be <code>null</code>.
     * @return this for chaining
     */
    @Nonnull
    public Builder setPrerequisiteXPath (@Nullable final String sPrerequisiteXPath)
    {
      m_sPrerequisiteXPath = sPrerequisiteXPath;
      return this;
    }

    /**
     * Build the validation artefact key from the specified fields. At least
     * business specification and transaction MUST not be <code>null</code>!
     * This method can be called many times and will return a new object every
     * time.
     *
     * @return The final validation key. Never <code>null</code>.
     * @throws IllegalStateException
     *         If a mandatory field is not filled.
     */
    @Nonnull
    public ValidationArtefactKey build ()
    {
      if (m_aDocType == null)
        throw new IllegalStateException ("The DocType must be provided");
      return new ValidationArtefactKey (m_aDocType,
                                        m_aNamespaceContext,
                                        m_sCountry,
                                        m_aSectorKey,
                                        m_sPrerequisiteXPath);
    }
  }
}
