#===--- CMakeLists.txt - Build the core standard library -----------------===#
#
# This source file is part of the Swift.org open source project
#
# Copyright (c) 2014 - 2022 Apple Inc. and the Swift project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See https://swift.org/LICENSE.txt for license information
# See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
#
#===----------------------------------------------------------------------===#

function(split_embedded_sources)
  cmake_parse_arguments(SPLIT1 "" "OUT_LIST_EMBEDDED;OUT_LIST_NORMAL" "EMBEDDED;NORMAL" ${ARGN})
  string(REPLACE "EMBEDDED" "NORMAL" ARGN2 "${ARGN}")
  cmake_parse_arguments(SPLIT2 "" "OUT_LIST_EMBEDDED;OUT_LIST_NORMAL" "EMBEDDED;NORMAL" ${ARGN2})
  set(${SPLIT1_OUT_LIST_EMBEDDED} "${SPLIT1_EMBEDDED}" PARENT_SCOPE)
  set(${SPLIT1_OUT_LIST_NORMAL} "${SPLIT2_NORMAL}" PARENT_SCOPE)
endfunction()

# The complete list of sources in the core standard library. Each file is
# annotated with either "EMBEDDED" which means it contributes to both the
# embedded Swift stdlib and the regular stdlib, or "NORMAL" which means it only
# contributes to the regular stdlib. The split_embedded_sources splits this list
# into SWIFTLIB_EMBEDDED_SOURCES and SWIFTLIB_SOURCES accordingly.
split_embedded_sources(
  OUT_LIST_EMBEDDED SWIFTLIB_EMBEDDED_SOURCES
  OUT_LIST_NORMAL SWIFTLIB_SOURCES

  ### "ESSENTIAL" SOURCES
  ### -- PLEASE KEEP THIS LIST IN ALPHABETICAL ORDER ###
  # Some files can't be sorted alphabetically, see notes in the list below.
  EMBEDDED Algorithm.swift
  EMBEDDED ArrayBody.swift
  EMBEDDED ArrayBuffer.swift
  EMBEDDED ArrayBufferProtocol.swift
  EMBEDDED ArrayCast.swift
  EMBEDDED Array.swift
  EMBEDDED ArrayShared.swift
  EMBEDDED ArraySlice.swift
  EMBEDDED ArrayType.swift
  EMBEDDED ASCII.swift
  EMBEDDED Assert.swift
  EMBEDDED AssertCommon.swift
  EMBEDDED BidirectionalCollection.swift
  EMBEDDED Bitset.swift
  EMBEDDED Bool.swift
    NORMAL BridgeObjectiveC.swift
  EMBEDDED BridgeStorage.swift
    NORMAL BridgingBuffer.swift
  EMBEDDED Builtin.swift
  EMBEDDED BuiltinMath.swift
  EMBEDDED Character.swift
    NORMAL CocoaArray.swift
    NORMAL Codable.swift
  EMBEDDED Collection.swift
  EMBEDDED CollectionAlgorithms.swift
  EMBEDDED Comparable.swift
  EMBEDDED CompilerProtocols.swift
  EMBEDDED Sendable.swift
  EMBEDDED ContiguousArray.swift
  EMBEDDED ContiguouslyStored.swift
  EMBEDDED ClosedRange.swift
  EMBEDDED ContiguousArrayBuffer.swift
  EMBEDDED CString.swift
  EMBEDDED CTypes.swift
    NORMAL DebuggerSupport.swift
  EMBEDDED Dictionary.swift
  EMBEDDED DictionaryBridging.swift
  EMBEDDED DictionaryBuilder.swift
  EMBEDDED DictionaryCasting.swift
  EMBEDDED DictionaryStorage.swift
  EMBEDDED DictionaryVariant.swift
  EMBEDDED DiscontiguousSlice.swift
  EMBEDDED DropWhile.swift
    NORMAL Dump.swift
  EMBEDDED EmptyCollection.swift
  EMBEDDED EnumeratedSequence.swift
  EMBEDDED Equatable.swift
  EMBEDDED ErrorType.swift
  EMBEDDED ExistentialCollection.swift
  EMBEDDED Filter.swift
  EMBEDDED FlatMap.swift
  EMBEDDED Flatten.swift
  EMBEDDED FloatingPoint.swift
  EMBEDDED Hashable.swift
  # WORKAROUND: This file name is not sorted alphabetically in the list because
  # if we do so, the compiler crashes.
  EMBEDDED AnyHashable.swift
  # END WORKAROUND
  EMBEDDED Hasher.swift
    NORMAL Hashing.swift
  EMBEDDED HashTable.swift
  EMBEDDED Identifiable.swift
  EMBEDDED Indices.swift
  EMBEDDED InlineArray.swift
  EMBEDDED InputStream.swift
  EMBEDDED IntegerParsing.swift
  EMBEDDED Integers.swift
  EMBEDDED Join.swift
  EMBEDDED KeyPath.swift
  EMBEDDED KeyValuePairs.swift
  EMBEDDED LazyCollection.swift
  EMBEDDED LazySequence.swift
    NORMAL LegacyABI.swift
  EMBEDDED LifetimeManager.swift
    NORMAL Macros.swift
  EMBEDDED ManagedBuffer.swift
  EMBEDDED Map.swift
  EMBEDDED MemoryLayout.swift
  EMBEDDED UnicodeScalar.swift # ORDER DEPENDENCY: Must precede Mirrors.swift
    NORMAL Mirrors.swift
  EMBEDDED Misc.swift
  EMBEDDED MutableCollection.swift
  EMBEDDED NativeDictionary.swift
  EMBEDDED NativeSet.swift
    NORMAL NewtypeWrapper.swift
  EMBEDDED NFC.swift
  EMBEDDED NFD.swift
  EMBEDDED ObjectIdentifier.swift
  EMBEDDED Optional.swift
  EMBEDDED OptionSet.swift
  EMBEDDED OutputStream.swift
  EMBEDDED Pointer.swift
  EMBEDDED Policy.swift
  EMBEDDED PrefixWhile.swift
    NORMAL Prespecialize.swift
    NORMAL Print.swift
  EMBEDDED PtrAuth.swift
  EMBEDDED Random.swift
  EMBEDDED RandomAccessCollection.swift
  EMBEDDED Range.swift
  EMBEDDED RangeReplaceableCollection.swift
  EMBEDDED RangeSet.swift
  EMBEDDED RangeSetRanges.swift
    NORMAL ReflectionMirror.swift
  EMBEDDED Repeat.swift
    NORMAL REPL.swift
  EMBEDDED Result.swift
  EMBEDDED Reverse.swift
  EMBEDDED Runtime.swift
    NORMAL RuntimeFunctionCounters.swift
  EMBEDDED SipHash.swift
  EMBEDDED Sequence.swift
  EMBEDDED SequenceAlgorithms.swift
  EMBEDDED Set.swift
  EMBEDDED SetAlgebra.swift
    NORMAL SetAnyHashableExtensions.swift
    NORMAL SetBridging.swift
  EMBEDDED SetBuilder.swift
  EMBEDDED SetCasting.swift
  EMBEDDED SetStorage.swift
  EMBEDDED SetVariant.swift
  EMBEDDED ShadowProtocols.swift
    NORMAL Shims.swift
  EMBEDDED Slice.swift
  EMBEDDED SmallString.swift
  EMBEDDED Sort.swift
  EMBEDDED Span/MutableRawSpan.swift
  EMBEDDED Span/MutableSpan.swift
  EMBEDDED Span/OutputRawSpan.swift
  EMBEDDED Span/OutputSpan.swift
  EMBEDDED Span/RawSpan.swift
  EMBEDDED Span/Span.swift
  EMBEDDED StaticString.swift
  EMBEDDED StaticPrint.swift
  EMBEDDED Stride.swift
  EMBEDDED StringHashable.swift  # ORDER DEPENDENCY: Must precede String.swift
  EMBEDDED String.swift
  EMBEDDED StringBreadcrumbs.swift
  EMBEDDED StringBridge.swift
  EMBEDDED StringCharacterView.swift
  EMBEDDED StringComparable.swift
  EMBEDDED StringComparison.swift
  EMBEDDED StringCreate.swift
  EMBEDDED StringGuts.swift
  EMBEDDED StringGutsSlice.swift
  EMBEDDED StringGutsRangeReplaceable.swift
  EMBEDDED StringObject.swift
  EMBEDDED StringProtocol.swift
  EMBEDDED StringIndex.swift
  EMBEDDED StringIndexConversions.swift
  EMBEDDED StringIndexValidation.swift
  EMBEDDED StringInterpolation.swift
  EMBEDDED StringLegacy.swift
  EMBEDDED StringNormalization.swift
  EMBEDDED StringRangeReplaceableCollection.swift
  EMBEDDED StringStorage.swift
  EMBEDDED StringStorageBridge.swift
  EMBEDDED StringSwitch.swift
  EMBEDDED StringTesting.swift
  EMBEDDED StringUnicodeScalarView.swift
  EMBEDDED StringUTF16View.swift
  EMBEDDED StringUTF8View.swift
  EMBEDDED StringUTF8Validation.swift
  EMBEDDED StringWordBreaking.swift
  EMBEDDED Substring.swift
  EMBEDDED SwiftNativeNSArray.swift
  EMBEDDED TemporaryAllocation.swift
    NORMAL ThreadLocalStorage.swift
  EMBEDDED UIntBuffer.swift
  EMBEDDED UnavailableStringAPIs.swift
  EMBEDDED UnicodeData.swift
  EMBEDDED UnicodeEncoding.swift
  EMBEDDED UnicodeBreakProperty.swift
  EMBEDDED UnicodeHelpers.swift
  EMBEDDED UnicodeParser.swift
  EMBEDDED UnicodeScalarProperties.swift
  EMBEDDED CharacterProperties.swift # ORDER DEPENDENCY: UnicodeScalarProperties.swift
  EMBEDDED UnicodeSPI.swift
  EMBEDDED Unmanaged.swift
  EMBEDDED UnmanagedOpaqueString.swift
  EMBEDDED UnmanagedString.swift
  EMBEDDED UnsafePointer.swift
  EMBEDDED UnsafeRawPointer.swift
  EMBEDDED UTFEncoding.swift
  EMBEDDED UTF8.swift
  EMBEDDED UTF8EncodingError.swift
  EMBEDDED UTF8Span.swift
  EMBEDDED UTF8SpanBits.swift
  EMBEDDED UTF8SpanComparisons.swift
  EMBEDDED UTF8SpanFundamentals.swift
  EMBEDDED UTF8SpanInternalHelpers.swift
  EMBEDDED UTF8SpanIterators.swift
  EMBEDDED UTF16.swift
  EMBEDDED UTF32.swift
  EMBEDDED Unicode.swift # ORDER DEPENDENCY: must follow new unicode support
  EMBEDDED StringGraphemeBreaking.swift # ORDER DEPENDENCY: Must follow UTF16.swift
  EMBEDDED ValidUTF8Buffer.swift
  EMBEDDED WriteBackMutableSlice.swift
  EMBEDDED MigrationSupport.swift

    ### "NON-ESSENTIAL" SOURCES, LAYERED ON TOP OF THE "ESSENTIAL" ONES
    ### -- PLEASE KEEP THIS LIST IN ALPHABETICAL ORDER ###
  EMBEDDED Availability.swift
  EMBEDDED CollectionDifference.swift
  EMBEDDED CollectionOfOne.swift
  EMBEDDED Diffing.swift
  EMBEDDED Duration.swift
  EMBEDDED DurationProtocol.swift
  EMBEDDED FloatingPointRandom.swift
  EMBEDDED Instant.swift
  EMBEDDED Int128.swift
  EMBEDDED Mirror.swift
    NORMAL PlaygroundDisplay.swift
  EMBEDDED SwiftifyImport.swift
    NORMAL CommandLine.swift
  EMBEDDED SliceBuffer.swift
  EMBEDDED StaticBigInt.swift
  EMBEDDED UInt128.swift
  EMBEDDED UnfoldSequence.swift
  EMBEDDED UnsafeBufferPointerSlice.swift
    NORMAL VarArgs.swift
  EMBEDDED Zip.swift
    NORMAL "${SWIFT_SOURCE_DIR}/stdlib/linker-support/magic-symbols-for-install-name.c"
  )

split_embedded_sources(
  OUT_LIST_EMBEDDED SWIFTLIB_EMBEDDED_GYB_SOURCES
  OUT_LIST_NORMAL SWIFTLIB_GYB_SOURCES

    NORMAL AtomicInt.swift.gyb
  EMBEDDED FloatingPointParsing.swift.gyb
  EMBEDDED FloatingPointTypes.swift.gyb
  EMBEDDED IntegerTypes.swift.gyb
  EMBEDDED LegacyInt128.swift.gyb
  EMBEDDED UnsafeBufferPointer.swift.gyb
  EMBEDDED UnsafeRawBufferPointer.swift.gyb
  EMBEDDED Tuple.swift.gyb
  )

if(SWIFT_STDLIB_ENABLE_VECTOR_TYPES)
  split_embedded_sources(
    OUT_LIST_EMBEDDED SWIFTLIB_EMBEDDED_VECTOR_GYB_SOURCES
    OUT_LIST_NORMAL SWIFTLIB_VECTOR_GYB_SOURCES
    
    EMBEDDED SIMDIntegerConcreteOperations.swift.gyb
    EMBEDDED SIMDFloatConcreteOperations.swift.gyb
    EMBEDDED SIMDMaskConcreteOperations.swift.gyb
    EMBEDDED SIMDVectorTypes.swift.gyb
  )

  list(APPEND SWIFTLIB_SOURCES SIMDVector.swift)
  list(APPEND SWIFTLIB_GYB_SOURCES ${SWIFTLIB_VECTOR_GYB_SOURCES})

  list(APPEND SWIFTLIB_EMBEDDED_SOURCES SIMDVector.swift)
  list(APPEND SWIFTLIB_EMBEDDED_GYB_SOURCES ${SWIFTLIB_EMBEDDED_VECTOR_GYB_SOURCES})
endif()

# Freestanding and Linux/Android builds both have failures to resolve.
if(NOT BOOTSTRAPPING_MODE STREQUAL "OFF" AND NOT SWIFT_FREESTANDING_FLAVOR AND NOT SWIFT_HOST_VARIANT_SDK STREQUAL "LINUX" AND NOT SWIFT_HOST_VARIANT_SDK STREQUAL "ANDROID")
  list(APPEND SWIFTLIB_SOURCES ObjectIdentifier+DebugDescription.swift)
endif()

list(APPEND SWIFTLIB_EMBEDDED_SOURCES
  EmbeddedRuntime.swift
  EmbeddedStubs.swift
  EmbeddedPrint.swift
  )

set(GROUP_INFO_JSON_FILE ${CMAKE_CURRENT_SOURCE_DIR}/GroupInfo.json)
set(swift_core_link_flags "${SWIFT_RUNTIME_SWIFT_LINK_FLAGS}")
set(swift_core_framework_depends)
set(swift_core_private_link_libraries)
set(swift_stdlib_compile_flags "${SWIFT_RUNTIME_SWIFT_COMPILE_FLAGS}")

if(SWIFT_PRIMARY_VARIANT_SDK STREQUAL "CYGWIN")
  # TODO(compnerd) cache this variable to permit re-configuration
  execute_process(COMMAND "cygpath" "-u" "$ENV{SYSTEMROOT}" OUTPUT_VARIABLE ENV_SYSTEMROOT)
  list(APPEND swift_core_private_link_libraries "${ENV_SYSTEMROOT}/system32/psapi.dll")
elseif(SWIFT_PRIMARY_VARIANT_SDK STREQUAL "FREEBSD")
  find_library(EXECINFO_LIBRARY execinfo)
  list(APPEND swift_core_private_link_libraries ${EXECINFO_LIBRARY})
elseif(SWIFT_PRIMARY_VARIANT_SDK STREQUAL "LINUX")
  if(SWIFT_BUILD_STATIC_STDLIB)
    list(APPEND swift_core_private_link_libraries)
  endif()
elseif(SWIFT_PRIMARY_VARIANT_SDK STREQUAL "WINDOWS")
  list(APPEND swift_core_private_link_libraries shell32;DbgHelp;Synchronization)
endif()

if(NOT "${CMAKE_BUILD_TYPE}" STREQUAL "MinSizeRel")
  list(APPEND swift_stdlib_compile_flags "-Xllvm" "-sil-inline-generics")
  list(APPEND swift_stdlib_compile_flags "-Xllvm" "-sil-partial-specialization")
endif()
if(SWIFT_STDLIB_ENABLE_STDLIBCORE_EXCLUSIVITY_CHECKING)
  list(APPEND swift_stdlib_compile_flags "-enforce-exclusivity=checked")
endif()
if(SWIFT_STDLIB_ENABLE_DEBUG_PRECONDITIONS_IN_RELEASE)
  list(APPEND swift_stdlib_compile_flags "-DSWIFT_STDLIB_ENABLE_DEBUG_PRECONDITIONS_IN_RELEASE")
endif()
set(compile_flags_for_final_build)
if(SWIFT_ENABLE_ARRAY_COW_CHECKS)
  list(APPEND compile_flags_for_final_build "-DCOW_CHECKS_ENABLED")
endif()

# STAGING: Temporarily avoids having to write #fileID in Swift.swiftinterface.
list(APPEND swift_stdlib_compile_flags "-Xfrontend" "-enable-experimental-concise-pound-file")

list(APPEND swift_stdlib_compile_flags "-enable-experimental-feature" "Macros")
list(APPEND swift_stdlib_compile_flags "-enable-experimental-feature" "FreestandingMacros")
list(APPEND swift_stdlib_compile_flags "-enable-experimental-feature" "Extern")
list(APPEND swift_stdlib_compile_flags "-enable-experimental-feature" "BitwiseCopyable")
list(APPEND swift_stdlib_compile_flags "-enable-experimental-feature" "ValueGenerics")
list(APPEND swift_stdlib_compile_flags "-enable-experimental-feature" "AddressableParameters")
list(APPEND swift_stdlib_compile_flags "-enable-experimental-feature" "AddressableTypes")
list(APPEND swift_stdlib_compile_flags "-enable-experimental-feature" "AllowUnsafeAttribute")
list(APPEND swift_stdlib_compile_flags "-strict-memory-safety")

if("${SWIFT_NATIVE_SWIFT_TOOLS_PATH}" STREQUAL "")
  set(swift_bin_dir "${CMAKE_BINARY_DIR}/bin")
  set(swift_lib_dir "${CMAKE_BINARY_DIR}/lib")
else()
  set(swift_bin_dir "${SWIFT_NATIVE_SWIFT_TOOLS_PATH}")
  set(swift_lib_dir "${SWIFT_NATIVE_SWIFT_TOOLS_PATH}/../lib")
endif()

# For `@DebugDescription`.
list(APPEND swift_stdlib_compile_flags "-plugin-path" "${swift_lib_dir}/swift/host/plugins")

set(swift_core_incorporate_object_libraries)
list(APPEND swift_core_incorporate_object_libraries swiftRuntimeCore)
list(APPEND swift_core_incorporate_object_libraries swiftLLVMSupport)
list(APPEND swift_core_incorporate_object_libraries swiftDemangling)
list(APPEND swift_core_incorporate_object_libraries swiftStdlibStubs)
list(APPEND swift_core_incorporate_object_libraries swiftThreading)
if(SWIFT_STDLIB_HAS_COMMANDLINE)
  list(APPEND swift_core_incorporate_object_libraries swiftCommandLineSupport)
endif()

# Backward deployment of Span on Apple platforms is implemented via the
# libswiftCompatibilitySpan.dylib shim.
#
# This flag ensures we emit the correct $ld$previous$ symbols in the standard
# library. When building a binary for an older deployment target, we
# pretend certain symbols are actually in libswiftCompatibilitySpan.dylib.
#
# Further discussion of libswiftCompatibilitySpan.dylib appears below.
#
if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
  list(APPEND swift_stdlib_compile_flags "-Xfrontend" "-previous-module-installname-map-file" "-Xfrontend" "${CMAKE_CURRENT_SOURCE_DIR}/PreviousModuleInstallName.json")
endif()

set(swiftCore_common_options
                  IS_STDLIB IS_STDLIB_CORE
                    ${SWIFTLIB_SOURCES}
                  GYB_SOURCES
                    ${SWIFTLIB_GYB_SOURCES}
                  LINK_FLAGS
                    ${swift_core_link_flags}
                  PRIVATE_LINK_LIBRARIES
                    ${swift_core_private_link_libraries}
                  INCORPORATE_OBJECT_LIBRARIES
                    ${swift_core_incorporate_object_libraries}
                  FRAMEWORK_DEPENDS
                    ${swift_core_framework_depends}
                  SWIFT_COMPILE_FLAGS
                    ${swift_stdlib_compile_flags} -Xcc -DswiftCore_EXPORTS ${SWIFT_STANDARD_LIBRARY_SWIFT_FLAGS})

# The copy_shim_headers target dependency is required to let the
# build system know that there's a rule to produce the shims
# directory, but is not sufficient to cause the object file to be rebuilt
# when the shim header changes.  Therefore, we pass both the target
# and the generated directory as dependencies.
set(swiftCore_common_dependencies
    copy_shim_headers "${SWIFTLIB_DIR}/shims" ${GROUP_INFO_JSON_FILE})

if(BOOTSTRAPPING_MODE STREQUAL "BOOTSTRAPPING")

  set(b0_deps symlink-headers-bootstrapping0)
  set(b1_deps symlink-headers-bootstrapping1)

  list(FIND SWIFT_STDLIB_LIBRARY_BUILD_TYPES "SHARED" index_of_shared)
  if(index_of_shared EQUAL -1)
    message(FATAL_ERROR "bootstrapping requires SHARED stdlib build type")
  endif()

  set(swiftCore_common_bootstrapping_options
                    SHARED
                    ${swiftCore_common_options}
                    SDK ${SWIFT_HOST_VARIANT_SDK}
                    ARCHITECTURE ${SWIFT_HOST_VARIANT_ARCH}
                    INSTALL_IN_COMPONENT
                      "never_install")

  # Bootstrapping - stage 0

  add_swift_target_library_single(swiftCore-bootstrapping0 swiftCore
                    ${swiftCore_common_bootstrapping_options}
                    FILE_DEPENDS
                      ${b0_deps} ${swiftCore_common_dependencies}
                    BOOTSTRAPPING 0)

  # Bootstrapping - stage 1

  add_swift_target_library_single(swiftCore-bootstrapping1 swiftCore
                    ${swiftCore_common_bootstrapping_options}
                    FILE_DEPENDS
                      ${b1_deps} ${swiftCore_common_dependencies}
                    BOOTSTRAPPING 1)
endif()

set(tooling_stdlib_deps)
if(TARGET libSwiftScan)
  list(APPEND tooling_stdlib_deps libSwiftScan)
endif()

add_swift_target_library(swiftCore
                  ${SWIFT_STDLIB_LIBRARY_BUILD_TYPES}
                  ${swiftCore_common_options}
                  ${compile_flags_for_final_build}
                  FILE_DEPENDS
                    ${swiftCore_common_dependencies}
                  DEPENDS ${tooling_stdlib_deps}
                  INSTALL_IN_COMPONENT
                    stdlib
                  MACCATALYST_BUILD_FLAVOR
                    zippered
                 )

# When a binary built with an older deployment target is run with a new
# standard library, the symbols that were previously in the backward
# compatibility shim are now in the standard library. To ensure the
# dynamic linker continues to find these symbols, the compatibility
# shim must be replaced by a symlink to the standard library.
#
# Since we're building the "new" standard library here, we create this
# symlink in the same directory, from libswiftCompatibilitySpan.dylib to
# libswiftCore.dylib.
#
# The sources for the real libswiftCompatibilitySpan.dylib are found in
# stdlib/toolchain/CompatibilitySpan. When running a binary with an old
# standard library, this dynamic library must be present at run time.
#
if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
  foreach(sdk ${SWIFT_SDKS})
    set(lib_dir "${SWIFT_SDK_${sdk}_LIB_SUBDIR}")
    set(lib_path "${SWIFTLIB_DIR}/${lib_dir}")
    set(compat_lib_name "${lib_path}/libswiftCompatibilitySpan.dylib")

    # This doesn't depend on libswiftCore.dylib because we don't actually need
    # for it to exist to create the symlink, nor is there any need to recreate
    # the symlink if the dylib changes.
    add_custom_command_target(unused_var
                              CUSTOM_TARGET_NAME "swiftCompatibilitySpan-symlink-${lib_dir}"
                              OUTPUT "${compat_lib_name}"
                              COMMAND ${CMAKE_COMMAND} "-E" "create_symlink" "${lib_path}/libswiftCore.dylib" "${compat_lib_name}")
    foreach(ARCH ${SWIFT_SDK_${sdk}_ARCHITECTURES})
      add_dependencies("swiftCore-${lib_dir}-${ARCH}" "swiftCompatibilitySpan-symlink-${lib_dir}")
    endforeach()

    swift_install_symlink_component(stdlib
      LINK_NAME libswiftCompatibilitySpan.dylib
      TARGET libswiftCore.dylib
      DESTINATION "lib/swift/${lib_dir}")
  endforeach()
endif()

# Embedded standard library - embedded libraries are built as .swiftmodule only,
# i.e. there is no .o or .a file produced (no binary code is actually produced)
# and only users of a library are going to actually compile any needed code.
if(SWIFT_SHOULD_BUILD_EMBEDDED_STDLIB)
  add_custom_target(embedded-stdlib)
  add_dependencies(embedded-libraries embedded-stdlib)

  set(SWIFT_ENABLE_REFLECTION OFF)
  set(SWIFT_STDLIB_SUPPORT_BACK_DEPLOYMENT OFF)
  set(SWIFT_STDLIB_STABLE_ABI OFF)
  set(SWIFT_STDLIB_ENABLE_OBJC_INTEROP OFF)
  set(SWIFT_STDLIB_ENABLE_VECTOR_TYPES OFF)

  # Under Embedded Swift, all stdlib APIs should be available always. Replace
  # all availability macros with very very old OS versions.
  set(SWIFT_STDLIB_AVAILABILITY_DEFINITIONS_EMBEDDED)
  foreach(def ${SWIFT_STDLIB_AVAILABILITY_DEFINITIONS})
    string(REGEX REPLACE ":.*" ":macOS 10.9, iOS 7.0, watchOS 2.0, tvOS 9.0, visionOS 1.0" replaced "${def}")
    list(APPEND SWIFT_STDLIB_AVAILABILITY_DEFINITIONS_EMBEDDED "${replaced}")
  endforeach()
  set(SWIFT_STDLIB_AVAILABILITY_DEFINITIONS "${SWIFT_STDLIB_AVAILABILITY_DEFINITIONS_EMBEDDED}")

  foreach(entry ${EMBEDDED_STDLIB_TARGET_TRIPLES})
    string(REGEX REPLACE "[ \t]+" ";" list "${entry}")
    list(GET list 0 arch)
    list(GET list 1 mod)
    list(GET list 2 triple)
    
    set(SWIFT_SDK_embedded_ARCH_${arch}_MODULE "${mod}")
    set(SWIFT_SDK_embedded_LIB_SUBDIR "embedded")
    set(SWIFT_SDK_embedded_ARCH_${arch}_TRIPLE "${triple}")
    add_swift_target_library_single(
      embedded-stdlib-${mod}
      swiftCore
      ONLY_SWIFTMODULE
      IS_STDLIB IS_STDLIB_CORE IS_FRAGILE
      ${SWIFTLIB_EMBEDDED_SOURCES}
      GYB_SOURCES ${SWIFTLIB_EMBEDDED_GYB_SOURCES}
      SWIFT_COMPILE_FLAGS
        ${swift_stdlib_compile_flags} -Xcc -ffreestanding -enable-experimental-feature Embedded
        -Xfrontend -enable-ossa-modules
      MODULE_DIR "${CMAKE_BINARY_DIR}/lib/swift/embedded"
      SDK "embedded"
      ARCHITECTURE "${arch}"
      FILE_DEPENDS ${swiftCore_common_dependencies}
      DEPENDS ${tooling_stdlib_deps}
      INSTALL_IN_COMPONENT stdlib
      )
    add_dependencies(embedded-stdlib embedded-stdlib-${mod})
  endforeach()
endif()
