package com.helger.phive.engine.vom;

import java.util.Map;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;
import javax.xml.validation.Schema;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsHashMap;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.lang.ICloneable;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;

/**
 * A simple implementation of {@link IVOMXmlSchemaResolver} based on an
 * in-memory map.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public class MapBasedVOMXmlSchemaResolver implements IVOMXmlSchemaResolver, ICloneable <MapBasedVOMXmlSchemaResolver>
{
  private final ICommonsMap <String, Schema> m_aMap = new CommonsHashMap <> ();

  /**
   * Default constructor without any mapping.
   */
  public MapBasedVOMXmlSchemaResolver ()
  {}

  /**
   * Constructor using existing mappings from the provided map.
   *
   * @param aMap
   *        The map to be used as the basis. May be <code>null</code>.
   */
  public MapBasedVOMXmlSchemaResolver (@Nullable final Map <String, ? extends Schema> aMap)
  {
    if (aMap != null)
      m_aMap.putAll (aMap);
  }

  @Nullable
  public Schema getXmlSchemaOfID (@Nullable final String sID)
  {
    if (StringHelper.hasNoText (sID))
      return null;
    return m_aMap.get (sID);
  }

  private void _addMapping (@Nonnull @Nonempty final String sID, @Nonnull final Schema aRes, final boolean bAllowOverride)
  {
    ValueEnforcer.notEmpty (sID, "ID");
    ValueEnforcer.notNull (aRes, "Schema");
    if (bAllowOverride)
      m_aMap.put (sID, aRes);
    else
    {
      if (m_aMap.containsKey (sID))
        throw new IllegalStateException ("Another mapping for ID '" + sID + "' is already present");
      m_aMap.put (sID, aRes);
    }
  }

  @Nonnull
  public final MapBasedVOMXmlSchemaResolver addMapping (@Nonnull @Nonempty final String sID, @Nonnull final Schema aRes)
  {
    _addMapping (sID, aRes, false);
    return this;
  }

  @Nonnull
  public final MapBasedVOMXmlSchemaResolver setMapping (@Nonnull @Nonempty final String sID, @Nonnull final Schema aRes)
  {
    _addMapping (sID, aRes, true);
    return this;
  }

  /**
   * @return A copy of the contained map with all mappings. Never
   *         <code>null</code> but maybe empty.
   */
  @Nonnull
  @ReturnsMutableCopy
  public final ICommonsMap <String, Schema> getAllMappings ()
  {
    return m_aMap.getClone ();
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final MapBasedVOMXmlSchemaResolver rhs = (MapBasedVOMXmlSchemaResolver) o;
    return m_aMap.equals (rhs.m_aMap);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aMap).getHashCode ();
  }

  @Nonnull
  @ReturnsMutableCopy
  public MapBasedVOMXmlSchemaResolver getClone ()
  {
    return new MapBasedVOMXmlSchemaResolver (m_aMap);
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("Map", m_aMap).getToString ();
  }
}
