/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.json;

import java.util.List;
import java.util.Locale;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.api.executorset.IValidationExecutorSet;
import com.helger.bdve.api.result.ValidationResult;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.error.IError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.level.IErrorLevel;
import com.helger.commons.lang.StackTraceHelper;
import com.helger.commons.mutable.MutableInt;
import com.helger.commons.state.ETriState;
import com.helger.json.IJsonArray;
import com.helger.json.IJsonObject;
import com.helger.json.JsonArray;
import com.helger.json.JsonObject;
import com.helger.schematron.svrl.SVRLResourceError;

/**
 * A utility class to create a common JSON representation of a BDVE result. Use
 * {@link #applyGlobalError(IJsonObject, String, long)} or
 * {@link #applyValidationResultList(IJsonObject, IValidationExecutorSet, List, Locale, long, MutableInt, MutableInt)}
 * to add the result to an arbitrary {@link IJsonObject}.
 *
 * @author Philip Helger
 * @since 5.2.5
 */
@Immutable
public final class BDVEJsonHelper
{
  public static final String JSON_ERRORLEVEL_SUCCESS = "SUCCESS";
  public static final String JSON_ERRORLEVEL_WARN = "WARN";
  public static final String JSON_ERRORLEVEL_ERROR = "ERROR";

  public static final String JSON_TRISTATE_TRUE = "TRUE";
  public static final String JSON_TRISTATE_FALSE = "FALSE";
  public static final String JSON_TRISTATE_UNDEFINED = "UNDEFINED";

  public static final String JSON_CLASS = "class";
  public static final String JSON_MESSAGE = "message";
  public static final String JSON_STACK_TRACE = "stackTrace";

  public static final String JSON_ERROR_LEVEL = "errorLevel";
  public static final String JSON_ERROR_ID = "errorID";
  public static final String JSON_ERROR_FIELD_NAME = "errorFieldName";
  public static final String JSON_ERROR_LOCATION = "errorLocation";
  public static final String JSON_ERROR_TEXT = "errorText";
  public static final String JSON_EXCEPTION = "exception";
  public static final String JSON_TEST = "test";

  public static final String JSON_VESID = "vesid";
  public static final String JSON_NAME = "name";
  public static final String JSON_DEPRECATED = "deprecated";

  private static final String JSON_SUCCESS = "success";
  private static final String JSON_ARTIFACT_TYPE = "artifactType";
  private static final String JSON_ARTIFACT_PATH = "artifactPath";
  private static final String JSON_ITEMS = "items";
  private static final String JSON_INTERRUPTED = "interrupted";
  private static final String JSON_MOST_SEVERE_ERROR_LEVEL = "mostSevereErrorLevel";
  private static final String JSON_RESULTS = "results";
  private static final String JSON_DURATION_MS = "durationMS";
  private static final String JSON_VES = "ves";

  public static final String ARTFACT_TYPE_INPUT_PARAMETER = "input-parameter";
  public static final String ARTIFACT_PATH_NONE = "none";

  private BDVEJsonHelper ()
  {}

  private static boolean _isConsideredError (@Nonnull final IErrorLevel aErrorLevel)
  {
    return aErrorLevel.isGE (EErrorLevel.ERROR);
  }

  private static boolean _isConsideredWarning (@Nonnull final IErrorLevel aErrorLevel)
  {
    return aErrorLevel.isGE (EErrorLevel.WARN);
  }

  /**
   * Get the JSON string of the error level. One of <code>"ERROR"</code>,
   * <code>"WARN"</code> or <code>"SUCCESS"</code>.<br>
   * See {@link #JSON_ERRORLEVEL_SUCCESS}, {@link #JSON_ERRORLEVEL_WARN},
   * {@link #JSON_ERRORLEVEL_ERROR}
   *
   * @param aErrorLevel
   *        The error level to convert. May not be <code>null</code>.
   * @return A non-<code>null</code> JSON value string.
   */
  @Nonnull
  @Nonempty
  public static String getErrorLevel (@Nonnull final IErrorLevel aErrorLevel)
  {
    ValueEnforcer.notNull (aErrorLevel, "ErrorLevel");

    if (_isConsideredError (aErrorLevel))
      return JSON_ERRORLEVEL_ERROR;
    if (_isConsideredWarning (aErrorLevel))
      return JSON_ERRORLEVEL_WARN;
    return JSON_ERRORLEVEL_SUCCESS;
  }

  @Nullable
  public static IErrorLevel getAsErrorLevel (@Nullable final String sErrorLevel)
  {
    if (JSON_ERRORLEVEL_ERROR.equals (sErrorLevel))
      return EErrorLevel.ERROR;
    if (JSON_ERRORLEVEL_WARN.equals (sErrorLevel))
      return EErrorLevel.WARN;
    if (JSON_ERRORLEVEL_SUCCESS.equals (sErrorLevel))
      return EErrorLevel.SUCCESS;
    return null;
  }

  /**
   * Get the tristate representation of the provided value. Either
   * {@link #JSON_TRISTATE_TRUE} or {@link #JSON_TRISTATE_FALSE}.
   *
   * @param b
   *        boolean value to get converted.
   * @return A non-<code>null</code> JSON value string.
   * @see #getTriState(ETriState)
   */
  @Nonnull
  @Nonempty
  public static String getTriState (final boolean b)
  {
    return b ? JSON_TRISTATE_TRUE : JSON_TRISTATE_FALSE;
  }

  /**
   * Get the tristate representation of the provided value. Either
   * {@link #JSON_TRISTATE_TRUE}, {@link #JSON_TRISTATE_FALSE} or
   * {@link #JSON_TRISTATE_UNDEFINED}.
   *
   * @param eTriState
   *        Tristate value to get converted. May not be <code>null</code>.
   * @return A non-<code>null</code> JSON value string.
   * @see #getTriState(boolean)
   */
  @Nonnull
  public static String getTriState (@Nonnull final ETriState eTriState)
  {
    ValueEnforcer.notNull (eTriState, "TriState");

    if (eTriState.isUndefined ())
      return JSON_TRISTATE_UNDEFINED;
    return getTriState (eTriState.isTrue ());
  }

  @Nullable
  public static ETriState getAsTriState (@Nullable final String sTriState)
  {
    if (JSON_TRISTATE_TRUE.equals (sTriState))
      return ETriState.TRUE;
    if (JSON_TRISTATE_FALSE.equals (sTriState))
      return ETriState.FALSE;
    if (JSON_TRISTATE_UNDEFINED.equals (sTriState))
      return ETriState.UNDEFINED;
    return null;
  }

  /**
   * Get the JSON representation of a stack trace.<br>
   *
   * <pre>
   * {
   *   "class" : string,
   *   "message" : string?,
   *   "stackTrace" : string
   * }
   * </pre>
   *
   * @param t
   *        The exception to convert to a JSON object. May be <code>null</code>.
   * @return <code>null</code> if the parameter is <code>null</code>, the JSON
   *         object otherwise.
   * @see BDVEStackTrace for a representation after reading
   */
  @Nullable
  public static IJsonObject getJsonStackTrace (@Nullable final Throwable t)
  {
    if (t == null)
      return null;
    return new JsonObject ().add (JSON_CLASS, t.getClass ().getName ())
                            .addIfNotNull (JSON_MESSAGE, t.getMessage ())
                            .add (JSON_STACK_TRACE, StackTraceHelper.getStackAsString (t));
  }

  /**
   * Get the JSON representation of an error.<br>
   *
   * <pre>
   * {
   *   "errorLevel" : string,
   *   "errorID" : string?,
   *   "errorFieldName" : string?,
   *   "errorLocation" : string?,
   *   "errorText" : string,
   *   "exception : object?
   * }
   * </pre>
   *
   * @param aErrorLevel
   *        The error level to use. May not be <code>null</code>.
   * @param sErrorID
   *        The ID of the error. May be <code>null</code>.
   * @param sErrorFieldName
   *        The field name of the error. May be <code>null</code>.
   * @param sErrorLocation
   *        The location of the error. May be <code>null</code>.
   * @param sErrorText
   *        The main error text. May not be <code>null</code>.
   * @param t
   *        The optional stack trace of the error. May be <code>null</code>.
   * @return The JSON object with the error. Never <code>null</code>.
   * @see #getErrorLevel(IErrorLevel)
   * @see #getJsonStackTrace(Throwable)
   * @see #getJsonError(IError, Locale)
   */
  @Nonnull
  public static IJsonObject getJsonError (@Nonnull final IErrorLevel aErrorLevel,
                                          @Nullable final String sErrorID,
                                          @Nullable final String sErrorFieldName,
                                          @Nullable final String sErrorLocation,
                                          @Nonnull final String sErrorText,
                                          @Nullable final Throwable t)
  {
    ValueEnforcer.notNull (aErrorLevel, "ErrorLevel");
    ValueEnforcer.notNull (sErrorText, "ErrorText");

    return new JsonObject ().add (JSON_ERROR_LEVEL, getErrorLevel (aErrorLevel))
                            .addIfNotNull (JSON_ERROR_ID, sErrorID)
                            .addIfNotNull (JSON_ERROR_FIELD_NAME, sErrorFieldName)
                            .addIfNotNull (JSON_ERROR_LOCATION, sErrorLocation)
                            .add (JSON_ERROR_TEXT, sErrorText)
                            .addIfNotNull (JSON_EXCEPTION, getJsonStackTrace (t));
  }

  /**
   * Get the JSON representation of an error.<br>
   *
   * <pre>
   * {
   *   "errorLevel" : string,
   *   "errorID" : string?,
   *   "errorFieldName" : string?,
   *   "errorLocation" : string?,
   *   "errorText" : string,
   *   "exception : object?
   * }
   * </pre>
   *
   * @param aError
   *        The structured error. May not be <code>null</code>.
   * @param aDisplayLocale
   *        The display locale to resolve the error text. May not be
   *        <code>null</code>.
   * @return The JSON object with the error. Never <code>null</code>.
   * @see #getErrorLevel(IErrorLevel)
   * @see #getJsonStackTrace(Throwable)
   * @see #getJsonError(IErrorLevel, String, String, String, String, Throwable)
   */
  @Nonnull
  public static IJsonObject getJsonError (@Nonnull final IError aError, @Nonnull final Locale aDisplayLocale)
  {
    ValueEnforcer.notNull (aError, "Error");
    ValueEnforcer.notNull (aDisplayLocale, "DisplayLocale");

    return getJsonError (aError.getErrorLevel (),
                         aError.getErrorID (),
                         aError.getErrorFieldName (),
                         aError.getErrorLocation ().getAsString (),
                         aError.getErrorText (aDisplayLocale),
                         aError.getLinkedException ());
  }

  /**
   * Get the JSON representation of a Schematron error.<br>
   *
   * <pre>
   * {
   *   "errorLevel" : string,
   *   "errorID" : string?,
   *   "errorFieldName" : string?,
   *   "errorLocation" : string?,
   *   "errorText" : string,
   *   "exception : object?,
   *   "test" : string?
   * }
   * </pre>
   *
   * @param aErrorLevel
   *        The error level to use. May not be <code>null</code>.
   * @param sErrorID
   *        The ID of the error. May be <code>null</code>.
   * @param sErrorFieldName
   *        The field name of the error. May be <code>null</code>.
   * @param sErrorLocation
   *        The location of the error. May be <code>null</code>.
   * @param sErrorText
   *        The main error text. May not be <code>null</code>.
   * @param sTest
   *        The Schematron test that was performed. May be <code>null</code>.
   * @param t
   *        The optional stack trace of the error. May be <code>null</code>.
   * @return The JSON object with the error. Never <code>null</code>.
   * @see #getErrorLevel(IErrorLevel)
   * @see #getJsonStackTrace(Throwable)
   * @see #getJsonError(IErrorLevel, String, String, String, String, Throwable)
   */
  @Nonnull
  public static IJsonObject getJsonSchematronError (@Nonnull final IErrorLevel aErrorLevel,
                                                    @Nullable final String sErrorID,
                                                    @Nullable final String sErrorFieldName,
                                                    @Nullable final String sErrorLocation,
                                                    @Nonnull final String sErrorText,
                                                    @Nullable final String sTest,
                                                    @Nullable final Throwable t)
  {
    return getJsonError (aErrorLevel, sErrorID, sErrorFieldName, sErrorLocation, sErrorText, t).addIfNotNull (JSON_TEST, sTest);
  }

  /**
   * Create the VES details as a JSON Object.<br>
   *
   * <pre>
   * {
   *   "vesid" : string,
   *   "name" : string,
   *   "deprecated" : boolean
   * }
   * </pre>
   *
   * @param aVES
   *        The VES to use. May not be <code>null</code>.
   * @return The created JSON object.
   */
  @Nonnull
  public static IJsonObject getJsonVES (@Nonnull final IValidationExecutorSet <?> aVES)
  {
    return new JsonObject ().add (JSON_VESID, aVES.getID ().getAsSingleID ())
                            .add (JSON_NAME, aVES.getDisplayName ())
                            .add (JSON_DEPRECATED, aVES.isDeprecated ());
  }

  /**
   * Add one global error to the response. Afterwards no validation results
   * should be added. The layout of the response object is very similar to the
   * one created by
   * {@link #applyValidationResultList(IJsonObject, IValidationExecutorSet, List, Locale, long, MutableInt, MutableInt)}.
   * <br>
   *
   * <pre>
   * {
   *   "success" : boolean,
   *   "interrupted" : boolean,
   *   "mostSevereErrorLevel" : string,
   *   "results" : array {
   *     "success" : string,  // as defined by {@link #getTriState(ETriState)}
   *     "artifactType" : string,
   *     "artifactPath" : string,
   *     "items" : array {
   *       error structure as in {@link #getJsonError(IErrorLevel, String, String, String, String, Throwable)}
   *     }
   *   },
   *   "durationMS" : number
   * }
   * </pre>
   *
   * @param aResponse
   *        The response JSON object to add to. May not be <code>null</code>.
   * @param sErrorMsg
   *        The error message to use. May not be <code>null</code>.
   * @param nDurationMilliseconds
   *        The duration of the validation in milliseconds. Must be &ge; 0.
   */
  public static void applyGlobalError (@Nonnull final IJsonObject aResponse,
                                       @Nonnull final String sErrorMsg,
                                       @Nonnegative final long nDurationMilliseconds)
  {
    ValueEnforcer.notNull (aResponse, "Response");
    ValueEnforcer.notNull (sErrorMsg, "ErrorMsg");
    ValueEnforcer.isGE0 (nDurationMilliseconds, "DurationMilliseconds");

    final IJsonArray aResultArray = new JsonArray ();
    {
      final IJsonObject aError = getJsonError (EErrorLevel.ERROR, (String) null, (String) null, (String) null, sErrorMsg, (Throwable) null);
      aResultArray.add (new JsonObject ().add (JSON_SUCCESS, getTriState (false))
                                         .add (JSON_ARTIFACT_TYPE, ARTFACT_TYPE_INPUT_PARAMETER)
                                         .add (JSON_ARTIFACT_PATH, ARTIFACT_PATH_NONE)
                                         .addJson (JSON_ITEMS, new JsonArray (aError)));
    }

    aResponse.add (JSON_SUCCESS, false);
    aResponse.add (JSON_INTERRUPTED, false);
    aResponse.add (JSON_MOST_SEVERE_ERROR_LEVEL, getErrorLevel (EErrorLevel.ERROR));
    aResponse.addJson (JSON_RESULTS, aResultArray);
    aResponse.add (JSON_DURATION_MS, nDurationMilliseconds);
  }

  /**
   * Apply the results of a full validation onto a JSON object.The layout of the
   * response object is very similar to the one created by
   * {@link #applyGlobalError(IJsonObject, String, long)}.<br>
   *
   * <pre>
    * {
    *   "ves" : object as defined by {@link #getJsonVES(IValidationExecutorSet)}
    *   "success" : boolean,
    *   "interrupted" : boolean,
    *   "mostSevereErrorLevel" : string,
    *   "results" : array {
    *     "success" : string,  // as defined by {@link #getTriState(ETriState)}
    *     "artifactType" : string,
    *     "artifactPath" : string,
    *     "items" : array {
    *       error structure as in {@link #getJsonSchematronError(IErrorLevel, String, String, String, String, String, Throwable)}
    *     }
    *   },
    *   "durationMS" : number
    * }
   * </pre>
   *
   * @param aResponse
   *        The response JSON object to add to. May not be <code>null</code>.
   * @param aVES
   *        The Validation executor set that was used to perform validation. May
   *        not be <code>null</code>.
   * @param aValidationResultList
   *        The validation result list containing the validation results per
   *        layer. May not be <code>null</code>.
   * @param aDisplayLocale
   *        The display locale to be used. May not be <code>null</code>.
   * @param nDurationMilliseconds
   *        The duration of the validation in milliseconds. Must be &ge; 0.
   * @param aWarningCount
   *        Optional callback value to store the overall warnings. If not
   *        <code>null</code> if will contain a &ge; 0 value afterwards.
   * @param aErrorCount
   *        Optional callback value to store the overall errors. If not
   *        <code>null</code> if will contain a &ge; 0 value afterwards.
   */
  public static void applyValidationResultList (@Nonnull final IJsonObject aResponse,
                                                @Nonnull final IValidationExecutorSet <?> aVES,
                                                @Nonnull final List <? extends ValidationResult> aValidationResultList,
                                                @Nonnull final Locale aDisplayLocale,
                                                @Nonnegative final long nDurationMilliseconds,
                                                @Nullable final MutableInt aWarningCount,
                                                @Nullable final MutableInt aErrorCount)
  {
    ValueEnforcer.notNull (aResponse, "Response");
    ValueEnforcer.notNull (aVES, "VES");
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");
    ValueEnforcer.notNull (aDisplayLocale, "DisplayLocale");
    ValueEnforcer.isGE0 (nDurationMilliseconds, "DurationMilliseconds");

    aResponse.addJson (JSON_VES, getJsonVES (aVES));

    int nWarnings = 0;
    int nErrors = 0;
    boolean bValidationInterrupted = false;
    IErrorLevel aMostSevere = EErrorLevel.LOWEST;
    final IJsonArray aResultArray = new JsonArray ();
    for (final ValidationResult aVR : aValidationResultList)
    {
      final IJsonObject aVRT = new JsonObject ();
      if (aVR.isIgnored ())
      {
        bValidationInterrupted = true;
        aVRT.add (JSON_SUCCESS, getTriState (ETriState.UNDEFINED));
      }
      else
      {
        aVRT.add (JSON_SUCCESS, getTriState (aVR.isSuccess ()));
      }
      aVRT.add (JSON_ARTIFACT_TYPE, aVR.getValidationArtefact ().getValidationArtefactType ().getID ());
      aVRT.add (JSON_ARTIFACT_PATH, aVR.getValidationArtefact ().getRuleResource ().getPath ());

      final IJsonArray aItemArray = new JsonArray ();
      for (final IError aError : aVR.getErrorList ())
      {
        if (aError.getErrorLevel ().isGT (aMostSevere))
          aMostSevere = aError.getErrorLevel ();

        if (_isConsideredError (aError.getErrorLevel ()))
          nErrors++;
        else
          if (_isConsideredWarning (aError.getErrorLevel ()))
            nWarnings++;

        aItemArray.add (getJsonSchematronError (aError.getErrorLevel (),
                                                aError.getErrorID (),
                                                aError.getErrorFieldName (),
                                                aError.hasErrorLocation () ? aError.getErrorLocation ().getAsString () : null,
                                                aError.getErrorText (aDisplayLocale),
                                                aError instanceof SVRLResourceError ? ((SVRLResourceError) aError).getTest () : null,
                                                aError.getLinkedException ()));
      }
      aVRT.addJson (JSON_ITEMS, aItemArray);
      aResultArray.add (aVRT);
    }
    // Success if the worst that happened is a warning
    aResponse.add (JSON_SUCCESS, aMostSevere.isLE (EErrorLevel.WARN));
    aResponse.add (JSON_INTERRUPTED, bValidationInterrupted);
    aResponse.add (JSON_MOST_SEVERE_ERROR_LEVEL, getErrorLevel (aMostSevere));
    aResponse.addJson (JSON_RESULTS, aResultArray);
    aResponse.add (JSON_DURATION_MS, nDurationMilliseconds);

    // Set consumer values
    if (aWarningCount != null)
      aWarningCount.set (nWarnings);
    if (aErrorCount != null)
      aErrorCount.set (nErrors);
  }
}