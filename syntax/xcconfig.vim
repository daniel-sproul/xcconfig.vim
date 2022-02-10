if exists("b:current_syntax")
  finish
endif

" Comments start with // and continue for the rest of the line
syntax match xcconfigComment "\v\/\/.*" contains=@Spell oneline
highlight default link xcconfigComment Comment

" booleans
syntax keyword xcconfigBooleans
      \ YES
      \ NO
highlight default link xcconfigBooleans Boolean

" Numbers
syntax match xcconfigNumber "\v<\d+>"
syntax match xcconfigNumber "\v<\v\d+[[:digit:]\.]+\d+>"
highlight default link xcconfigNumber Number

" Includes start with one of these identifiers, followed by a double quoted path
syntax match xcconfigImports /#include\>/
syntax match xcconfigImports /#include?/
highlight default link xcconfigImports Include

" Variable dereference, this matches either $(FOO) or ${BAR} style variables on a
" single line. They can contain special keywords (like 'inherited')
syntax region xcconfigVariableDeref start=/$(/ end=/)/ contains=xcconfigVariable oneline
syntax region xcconfigVariableDeref start=/${/ end=/}/ contains=xcconfigVariable oneline
highlight default link xcconfigVariableDeref Function

" Strings, anything wrapped in single or double quotes for one line
syntax region xcconfigString start=/"/ end=/"/ oneline
syntax region xcconfigString start=/'/ end=/'/ oneline
highlight default link xcconfigString String

" Conditional variable assignment
" These take the form:
"   FOO[config=Debug] = Bar
syntax region xcconfigConditionalExpr start=/\[/ end=/\]/ contains=xcconfigConditional oneline
syntax keyword xcconfigConditional arch config sdk contained
highlight default link xcconfigConditional Conditional


" --- Built-in variable names ---

highlight default link xcconfigVariable Identifier

" Various special keywords that deserve custom highlighting
syntax match xcconfigVariable /@executable_path\>/
syntax match xcconfigVariable /@loader_path\>/
syntax match xcconfigVariable /@rpath\>/
syntax keyword xcconfigVariable inherited

" Externally-defined project settings
" (you shouldn't be setting these, but will often deref them)
syntax keyword xcconfigVariable
      \ BUILD_DIR
      \ CONFIGURATION
      \ PLATFORM_NAME
      \ PROJECT_TEMP_DIR
      \ TARGET_NAME

" What follows are names of the actual build settings:
" (organized by section as listed in the Xcode Build Settings pane;
" within a given section, sorted alphabetically)

" Architectures
syntax keyword xcconfigVariable
      \ ADDITIONAL_SDKS
      \ ARCHS
      \ EXCLUDED_ARCHS
      \ ONLY_ACTIVE_ARCH
      \ SDKROOT
      \ SUPPORTED_PLATFORMS

" Assets
syntax keyword xcconfigVariable
      \ ASSET_PACK_MANIFEST_URL_PREFIX
      \ EMBED_ASSET_PACKS_IN_PRODUCT_BUNDLE
      \ ENABLE_ON_DEMAND_RESOURCES
      \ ON_DEMAND_RESOURCES_INITIAL_INSTALL_TAGS
      \ ON_DEMAND_RESOURCES_PREFETCH_ORDER

" Build Locations
syntax keyword xcconfigVariable
      \ OBJROOT
      \ SHARED_PRECOMPS_DIR
      \ SYMROOT

" Build Options
syntax keyword xcconfigVariable
		\ ALLOW_TARGET_PLATFORM_SPECIALIZATION
      \ ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES
		\ APPLICATION_EXTENSION_API_ONLY
		\ BUILD_LIBRARY_FOR_DISTRIBUTION
		\ BUILD_VARIANTS
		\ COMPILER_INDEX_STORE_ENABLE
		\ DEBUG_INFORMATION_FORMAT
		\ ENABLE_BITCODE
		\ ENABLE_PREVIEWS
		\ ENABLE_TESTABILITY
		\ ENABLE_TESTING_SEARCH_PATHS
		\ EXCLUDED_SOURCE_FILE_NAMES
		\ GCC_VERSION
		\ GENERATE_PROFILING_CODE
		\ INCLUDED_SOURCE_FILE_NAMES
		\ PRECOMPS_INCLUDE_HEADERS_FROM_BUILT_PRODUCTS_DIR
		\ SCAN_ALL_SOURCE_FILES_FOR_INCLUDES
		\ VALIDATE_PRODUCT
		\ VALIDATE_WORKSPACE
		\ VALIDATE_WORKSPACE_SKIPPED_SDK_FRAMEWORKS

" Deployment
syntax keyword xcconfigVariable
		\ ALTERNATE_GROUP
		\ ALTERNATE_MODE
		\ ALTERNATE_OWNER
		\ ALTERNATE_PERMISSIONS_FILES
		\ COMBINE_HIDPI_IMAGES
		\ COPY_PHASE_STRIP
		\ DEPLOYMENT_LOCATION
		\ DEPLOYMENT_POSTPROCESSING
		\ DEVELOPMENT_ASSET_PATHS
		\ DRIVERKIT_DEPLOYMENT_TARGET
		\ DSTROOT
		\ INSTALL_GROUP
		\ INSTALL_MODE_FLAG
		\ INSTALL_OWNER
		\ INSTALL_PATH
		\ IPHONEOS_DEPLOYMENT_TARGET
		\ MACOSX_DEPLOYMENT_TARGET
		\ PRODUCT_DEFINITION_PLIST
		\ RESOURCES_TARGETED_DEVICE_FAMILY
		\ SKIP_INSTALL
		\ STRIPFLAGS
		\ STRIP_INSTALLED_PRODUCT
		\ STRIP_STYLE
		\ STRIP_SWIFT_SYMBOLS
		\ TARGETED_DEVICE_FAMILY
		\ TVOS_DEPLOYMENT_TARGET
		\ WATCHOS_DEPLOYMENT_TARGET

" Headers
syntax keyword xcconfigVariable
		\ COPY_HEADERS_RUN_UNIFDEF
		\ COPY_HEADERS_UNIFDEF_FLAGS

" Info.plist Values
syntax keyword xcconfigVariable
		\ INFOPLIST_KEY_CFBundleDisplayName
		\ INFOPLIST_KEY_CLKComplicationPrincipalClass
		\ INFOPLIST_KEY_LSApplicationCategoryType
		\ INFOPLIST_KEY_LSSupportsOpeningDocumentsInPlace
		\ INFOPLIST_KEY_NSHumanReadableCopyright
		\ INFOPLIST_KEY_NSMainNibFile
		\ INFOPLIST_KEY_NSMainStoryboardFile
		\ INFOPLIST_KEY_NSPrincipalClass
		\ INFOPLIST_KEY_UIApplicationSceneManifest_Generation
		\ INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents
		\ INFOPLIST_KEY_UILaunchScreen_Generation
		\ INFOPLIST_KEY_UILaunchStoryboardName
		\ INFOPLIST_KEY_UIMainStoryboardFile
		\ INFOPLIST_KEY_UIRequiredDeviceCapabilities
		\ INFOPLIST_KEY_UIRequiresFullScreen
		\ INFOPLIST_KEY_UIStatusBarHidden
		\ INFOPLIST_KEY_UISupportedInterfaceOrientations
		\ INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad
		\ INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone
		\ INFOPLIST_KEY_UISupportsDocumentBrowser
		\ INFOPLIST_KEY_UIUserInterfaceStyle
		\ INFOPLIST_KEY_WKCompanionAppBundleIdentifier
		\ INFOPLIST_KEY_WKExtensionDelegateClassName
		\ INFOPLIST_KEY_WKRunsIndependentlyOfCompanionApp
		\ INFOPLIST_KEY_WKWatchOnly

" Kernel Module
syntax keyword xcconfigVariable
		\ MODULE_NAME
		\ MODULE_START
		\ MODULE_STOP
		\ MODULE_VERSION

" Linking
syntax keyword xcconfigVariable
		\ BUNDLE_LOADER
		\ DEAD_CODE_STRIPPING
		\ DYLIB_COMPATIBILITY_VERSION
		\ DYLIB_CURRENT_VERSION
		\ DYLIB_INSTALL_NAME_BASE
		\ EXPORTED_SYMBOLS_FILE
		\ GENERATE_MASTER_OBJECT_FILE
		\ INIT_ROUTINE
		\ KEEP_PRIVATE_EXTERNS
		\ LD_DYLIB_ALLOWABLE_CLIENTS
		\ LD_DYLIB_INSTALL_NAME
		\ LD_GENERATE_MAP_FILE
		\ LD_MAP_FILE_PATH
		\ LD_NO_PIE
		\ LD_QUOTE_LINKER_ARGUMENTS_FOR_COMPILER_DRIVER
		\ LD_RUNPATH_SEARCH_PATHS
		\ LINKER_DISPLAYS_MANGLED_NAMES
		\ LINK_WITH_STANDARD_LIBRARIES
		\ MACH_O_TYPE
		\ ORDER_FILE
		\ OTHER_LDFLAGS
		\ OTHER_LIBTOOLFLAGS
		\ PRELINK_FLAGS
		\ PRELINK_LIBS
		\ PRESERVE_DEAD_CODE_INITS_AND_TERMS
		\ REEXPORTED_FRAMEWORK_NAMES
		\ REEXPORTED_LIBRARY_NAMES
		\ REEXPORTED_LIBRARY_PATHS
		\ SECTORDER_FLAGS
		\ SEPARATE_SYMBOL_EDIT
		\ UNEXPORTED_SYMBOLS_FILE
		\ WARNING_LDFLAGS

" Localization
syntax keyword xcconfigVariable
		\ LOCALIZATION_EXPORT_SUPPORTED
		\ LOCALIZED_STRING_MACRO_NAMES
		\ LOCALIZED_STRING_SWIFTUI_SUPPORT
		\ SWIFT_EMIT_LOC_STRINGS

" Packaging
syntax keyword xcconfigVariable
		\ APPLY_RULES_IN_COPY_FILES
		\ APPLY_RULES_IN_COPY_HEADERS
		\ COPYING_PRESERVES_HFS_DATA
		\ CREATE_INFOPLIST_SECTION_IN_BINARY
		\ DEFINES_MODULE
		\ DONT_GENERATE_INFOPLIST_FILE
		\ EXECUTABLE_EXTENSION
		\ EXECUTABLE_PREFIX
		\ FRAMEWORK_VERSION
		\ GENERATE_INFOPLIST_FILE
		\ GENERATE_PKGINFO_FILE
		\ INFOPLIST_EXPAND_BUILD_SETTINGS
		\ INFOPLIST_FILE
		\ INFOPLIST_OTHER_PREPROCESSOR_FLAGS
		\ INFOPLIST_OUTPUT_FORMAT
		\ INFOPLIST_PREFIX_HEADER
		\ INFOPLIST_PREPROCESS
		\ INFOPLIST_PREPROCESSOR_DEFINITIONS
		\ MODULEMAP_FILE
		\ MODULEMAP_PRIVATE_FILE
		\ PLIST_FILE_OUTPUT_FORMAT
		\ PRIVATE_HEADERS_FOLDER_PATH
		\ PRODUCT_BUNDLE_IDENTIFIER
		\ PRODUCT_MODULE_NAME
		\ PRODUCT_NAME
		\ PUBLIC_HEADERS_FOLDER_PATH
		\ STRINGS_FILE_INFOPLIST_RENAME
		\ STRINGS_FILE_OUTPUT_ENCODING
		\ WRAPPER_EXTENSION

" Search Paths
syntax keyword xcconfigVariable
		\ ALWAYS_SEARCH_USER_PATHS
		\ EXCLUDED_RECURSIVE_SEARCH_PATH_SUBDIRECTORIES
		\ FRAMEWORK_SEARCH_PATHS
		\ HEADER_SEARCH_PATHS
		\ INCLUDED_RECURSIVE_SEARCH_PATH_SUBDIRECTORIES
		\ LIBRARY_SEARCH_PATHS
		\ REZ_SEARCH_PATHS
		\ SYSTEM_FRAMEWORK_SEARCH_PATHS
		\ SYSTEM_HEADER_SEARCH_PATHS
		\ USER_HEADER_SEARCH_PATHS
		\ USE_HEADERMAP

" Signing
syntax keyword xcconfigVariable
		\ CODE_SIGN_ENTITLEMENTS
		\ CODE_SIGN_IDENTITY
		\ CODE_SIGN_INJECT_BASE_ENTITLEMENTS
		\ CODE_SIGN_STYLE
		\ DEVELOPMENT_TEAM
		\ ENABLE_APP_SANDBOX
		\ ENABLE_HARDENED_RUNTIME
		\ ENABLE_USER_SELECTED_FILES
		\ OTHER_CODE_SIGN_FLAGS
		\ PROVISIONING_PROFILE_SPECIFIER

" Testing
syntax keyword xcconfigVariable
		\ TEST_HOST
		\ TREAT_MISSING_BASELINES_AS_TEST_FAILURES

" Text-Based API
syntax keyword xcconfigVariable
		\ GENERATE_TEXT_BASED_STUBS
		\ INLINE_PRIVATE_FRAMEWORKS
		\ OTHER_TAPI_FLAGS
		\ SUPPORTS_TEXT_BASED_API
		\ TAPI_VERIFY_MODE

" Versioning
syntax keyword xcconfigVariable
		\ CURRENT_PROJECT_VERSION
		\ MARKETING_VERSION
		\ VERSIONING_SYSTEM
		\ VERSION_INFO_BUILDER
		\ VERSION_INFO_EXPORT_DECL
		\ VERSION_INFO_FILE
		\ VERSION_INFO_PREFIX
		\ VERSION_INFO_SUFFIX

" Apple Clang - Address Sanitizer
syntax keyword xcconfigVariable
		\ CLANG_ADDRESS_SANITIZER_CONTAINER_OVERFLOW

" Apple Clang - Code Generation
syntax keyword xcconfigVariable
		\ CLANG_DEBUG_INFORMATION_LEVEL
		\ CLANG_ENABLE_CODE_COVERAGE
		\ CLANG_OPTIMIZATION_PROFILE_FILE
		\ CLANG_USE_OPTIMIZATION_PROFILE
		\ CLANG_X86_VECTOR_INSTRUCTIONS
		\ GCC_DYNAMIC_NO_PIC
		\ GCC_ENABLE_KERNEL_DEVELOPMENT
		\ GCC_FAST_MATH
		\ GCC_GENERATE_DEBUGGING_SYMBOLS
		\ GCC_GENERATE_TEST_COVERAGE_FILES
		\ GCC_INLINES_ARE_PRIVATE_EXTERN
		\ GCC_INSTRUMENT_PROGRAM_FLOW_ARCS
		\ GCC_NO_COMMON_BLOCKS
		\ GCC_OPTIMIZATION_LEVEL
		\ GCC_REUSE_STRINGS
		\ GCC_STRICT_ALIASING
		\ GCC_SYMBOLS_PRIVATE_EXTERN
		\ GCC_THREADSAFE_STATICS
		\ GCC_UNROLL_LOOPS
		\ LLVM_LTO

" Apple Clang - Custom Compiler Flags
syntax keyword xcconfigVariable
		\ OTHER_CFLAGS
		\ OTHER_CPLUSPLUSFLAGS
		\ WARNING_CFLAGS

" Apple Clang - Language
syntax keyword xcconfigVariable
		\ GCC_CHAR_IS_UNSIGNED_CHAR
		\ GCC_CW_ASM_SYNTAX
		\ GCC_C_LANGUAGE_STANDARD
		\ GCC_ENABLE_ASM_KEYWORD
		\ GCC_ENABLE_BUILTIN_FUNCTIONS
		\ GCC_ENABLE_FLOATING_POINT_LIBRARY_CALLS
		\ GCC_ENABLE_PASCAL_STRINGS
		\ GCC_ENABLE_TRIGRAPHS
		\ GCC_INCREASE_PRECOMPILED_HEADER_SHARING
		\ GCC_INPUT_FILETYPE
		\ GCC_LINK_WITH_DYNAMIC_LIBRARIES
		\ GCC_PRECOMPILE_PREFIX_HEADER
		\ GCC_PREFIX_HEADER
		\ GCC_SHORT_ENUMS
		\ GCC_USE_STANDARD_INCLUDE_SEARCHING

" Apple Clang - Language - C++
syntax keyword xcconfigVariable
		\ CLANG_CXX_LANGUAGE_STANDARD
		\ CLANG_CXX_LIBRARY
		\ CLANG_ENABLE_CPP_STATIC_DESTRUCTORS
		\ GCC_ENABLE_CPP_EXCEPTIONS
		\ GCC_ENABLE_CPP_RTTI

" Apple Clang - Language - Modules
syntax keyword xcconfigVariable
		\ CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES
		\ CLANG_ENABLE_MODULES
		\ CLANG_ENABLE_MODULE_DEBUGGING
		\ CLANG_MODULES_AUTOLINK
		\ CLANG_MODULES_DISABLE_PRIVATE_WARNING

" Apple Clang - Language - Objective-C
syntax keyword xcconfigVariable
		\ CLANG_ENABLE_OBJC_ARC
		\ CLANG_ENABLE_OBJC_WEAK
		\ CLANG_LINK_OBJC_RUNTIME
		\ GCC_ENABLE_OBJC_EXCEPTIONS

" Apple Clang - Preprocessing
syntax keyword xcconfigVariable
		\ ENABLE_NS_ASSERTIONS
		\ ENABLE_STRICT_OBJC_MSGSEND
		\ GCC_PREPROCESSOR_DEFINITIONS
		\ GCC_PREPROCESSOR_DEFINITIONS_NOT_USED_IN_PRECOMPS

" Apple Clang - Undefined Behavior Sanitizer
syntax keyword xcconfigVariable
		\ CLANG_UNDEFINED_BEHAVIOR_SANITIZER_INTEGER
		\ CLANG_UNDEFINED_BEHAVIOR_SANITIZER_NULLABILITY

" Apple Clang - Warning Policies
syntax keyword xcconfigVariable
		\ GCC_TREAT_WARNINGS_AS_ERRORS
		\ GCC_WARN_INHIBIT_ALL_WARNINGS
		\ GCC_WARN_PEDANTIC

" Apple Clang - Warnings - All languages
syntax keyword xcconfigVariable
		\ CLANG_WARN_ASSIGN_ENUM
		\ CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING
		\ CLANG_WARN_BOOL_CONVERSION
		\ CLANG_WARN_COMMA
		\ CLANG_WARN_COMPLETION_HANDLER_MISUSE
		\ CLANG_WARN_CONSTANT_CONVERSION
		\ CLANG_WARN_DOCUMENTATION_COMMENTS
		\ CLANG_WARN_EMPTY_BODY
		\ CLANG_WARN_ENUM_CONVERSION
		\ CLANG_WARN_FLOAT_CONVERSION
		\ CLANG_WARN_FRAMEWORK_INCLUDE_PRIVATE_FROM_PUBLIC
		\ CLANG_WARN_IMPLICIT_SIGN_CONVERSION
		\ CLANG_WARN_INFINITE_RECURSION
		\ CLANG_WARN_INT_CONVERSION
		\ CLANG_WARN_NON_LITERAL_NULL_CONVERSION
		\ CLANG_WARN_PRAGMA_PACK
		\ CLANG_WARN_PRIVATE_MODULE
		\ CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER
		\ CLANG_WARN_SEMICOLON_BEFORE_METHOD_BODY
		\ CLANG_WARN_STRICT_PROTOTYPES
		\ CLANG_WARN_SUSPICIOUS_IMPLICIT_CONVERSION
		\ CLANG_WARN_UNGUARDED_AVAILABILITY
		\ CLANG_WARN_UNREACHABLE_CODE
		\ GCC_TREAT_IMPLICIT_FUNCTION_DECLARATIONS_AS_ERRORS
		\ GCC_TREAT_INCOMPATIBLE_POINTER_TYPE_WARNINGS_AS_ERRORS
		\ GCC_WARN_64_TO_32_BIT_CONVERSION
		\ GCC_WARN_ABOUT_DEPRECATED_FUNCTIONS
		\ GCC_WARN_ABOUT_MISSING_FIELD_INITIALIZERS
		\ GCC_WARN_ABOUT_MISSING_NEWLINE
		\ GCC_WARN_ABOUT_MISSING_PROTOTYPES
		\ GCC_WARN_ABOUT_POINTER_SIGNEDNESS
		\ GCC_WARN_ABOUT_RETURN_TYPE
		\ GCC_WARN_CHECK_SWITCH_STATEMENTS
		\ GCC_WARN_FOUR_CHARACTER_CONSTANTS
		\ GCC_WARN_INITIALIZER_NOT_FULLY_BRACKETED
		\ GCC_WARN_MISSING_PARENTHESES
		\ GCC_WARN_SHADOW
		\ GCC_WARN_SIGN_COMPARE
		\ GCC_WARN_TYPECHECK_CALLS_TO_PRINTF
		\ GCC_WARN_UNINITIALIZED_AUTOS
		\ GCC_WARN_UNKNOWN_PRAGMAS
		\ GCC_WARN_UNUSED_FUNCTION
		\ GCC_WARN_UNUSED_LABEL
		\ GCC_WARN_UNUSED_PARAMETER
		\ GCC_WARN_UNUSED_VALUE
		\ GCC_WARN_UNUSED_VARIABLE

" Apple Clang - Warnings - C++
syntax keyword xcconfigVariable
		\ CLANG_WARN_ATOMIC_IMPLICIT_SEQ_CST
		\ CLANG_WARN_CXX0X_EXTENSIONS
		\ CLANG_WARN_DELETE_NON_VIRTUAL_DTOR
		\ CLANG_WARN_RANGE_LOOP_ANALYSIS
		\ CLANG_WARN_SUSPICIOUS_MOVE
		\ CLANG_WARN_VEXING_PARSE
		\ CLANG_WARN__EXIT_TIME_DESTRUCTORS
		\ GCC_WARN_ABOUT_INVALID_OFFSETOF_MACRO
		\ GCC_WARN_HIDDEN_VIRTUAL_FUNCTIONS
		\ GCC_WARN_NON_VIRTUAL_DESTRUCTOR

" Apple Clang - Warnings - Objective-C
syntax keyword xcconfigVariable
		\ CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS
		\ CLANG_WARN_DIRECT_OBJC_ISA_USAGE
		\ CLANG_WARN_MISSING_NOESCAPE
		\ CLANG_WARN_OBJC_IMPLICIT_ATOMIC_PROPERTIES
		\ CLANG_WARN_OBJC_INTERFACE_IVARS
		\ CLANG_WARN_OBJC_LITERAL_CONVERSION
		\ CLANG_WARN_OBJC_MISSING_PROPERTY_SYNTHESIS
		\ CLANG_WARN_OBJC_ROOT_CLASS
		\ CLANG_WARN__DUPLICATE_METHOD_MATCH
		\ GCC_WARN_ALLOW_INCOMPLETE_PROTOCOL
		\ GCC_WARN_STRICT_SELECTOR_MATCH
		\ GCC_WARN_UNDECLARED_SELECTOR

" Apple Clang - Warnings - Objective-C and ARC
syntax keyword xcconfigVariable
		\ CLANG_WARN_OBJC_EXPLICIT_OWNERSHIP_TYPE
		\ CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF
		\ CLANG_WARN_OBJC_REPEATED_USE_OF_WEAK
		\ CLANG_WARN__ARC_BRIDGE_CAST_NONARC

" Asset Catalog Compiler - Options
syntax keyword xcconfigVariable
		\ ASSETCATALOG_COMPILER_ALTERNATE_APPICON_NAMES
		\ ASSETCATALOG_COMPILER_APPICON_NAME
		\ ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME
		\ ASSETCATALOG_COMPILER_INCLUDE_ALL_APPICON_ASSETS
		\ ASSETCATALOG_COMPILER_INCLUDE_INFOPLIST_LOCALIZATIONS
		\ ASSETCATALOG_COMPILER_INCLUDE_STICKER_CONTENT
		\ ASSETCATALOG_COMPILER_LAUNCHIMAGE_NAME
		\ ASSETCATALOG_COMPILER_OPTIMIZATION
		\ ASSETCATALOG_COMPILER_SKIP_APP_STORE_DEPLOYMENT
		\ ASSETCATALOG_COMPILER_STANDALONE_ICON_BEHAVIOR
		\ ASSETCATALOG_COMPILER_STICKER_PACK_IDENTIFIER_PREFIX
		\ ASSETCATALOG_COMPILER_TARGET_STICKERS_ICON_ROLE
		\ ASSETCATALOG_COMPILER_WIDGET_BACKGROUND_COLOR_NAME
		\ ASSETCATALOG_NOTICES
		\ ASSETCATALOG_OTHER_FLAGS
		\ ASSETCATALOG_WARNINGS
		\ ENABLE_INCREMENTAL_DISTILL
		\ ENABLE_ONLY_ACTIVE_RESOURCES

" Mac Catalyst - Deployment
syntax keyword xcconfigVariable
		\ DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER
		\ SUPPORTS_MACCATALYST
		\ SUPPORTS_MAC_DESIGNED_FOR_IPHONE_IPAD

" OSACompile - Build Options
syntax keyword xcconfigVariable
		\ OSACOMPILE_EXECUTE_ONLY
		\ OTHER_OSACOMPILEFLAGS

" Static Analysis - Analysis Policy
syntax keyword xcconfigVariable
		\ CLANG_STATIC_ANALYZER_MODE
		\ CLANG_STATIC_ANALYZER_MODE_ON_ANALYZE_ACTION
		\ RUN_CLANG_STATIC_ANALYZER

" Static Analysis - Generic Issues
syntax keyword xcconfigVariable
		\ CLANG_ANALYZER_DIVIDE_BY_ZERO
		\ CLANG_ANALYZER_MEMORY_MANAGEMENT
		\ CLANG_ANALYZER_NONNULL
		\ CLANG_ANALYZER_NULL_DEREFERENCE
		\ CLANG_TIDY_BUGPRONE_ASSERT_SIDE_EFFECT
		\ CLANG_TIDY_BUGPRONE_INFINITE_LOOP

" Static Analysis - Issues - Apple APIs
syntax keyword xcconfigVariable
		\ CLANG_ANALYZER_GCD
		\ CLANG_ANALYZER_GCD_PERFORMANCE
		\ CLANG_ANALYZER_LIBKERN_RETAIN_COUNT
		\ CLANG_ANALYZER_LOCALIZABILITY_EMPTY_CONTEXT
		\ CLANG_ANALYZER_LOCALIZABILITY_NONLOCALIZED
		\ CLANG_ANALYZER_MIG_CONVENTIONS
		\ CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION
		\ CLANG_ANALYZER_OBJC_COLLECTIONS
		\ CLANG_ANALYZER_OBJC_NSCFERROR
		\ CLANG_ANALYZER_OSOBJECT_C_STYLE_CAST

" Static Analysis - Issues - C++
syntax keyword xcconfigVariable
		\ CLANG_ANALYZER_USE_AFTER_MOVE
		\ CLANG_TIDY_BUGPRONE_MOVE_FORWARDING_REFERENCE

" Static Analysis - Issues - Objective-C
syntax keyword xcconfigVariable
		\ CLANG_ANALYZER_OBJC_ATSYNC
		\ CLANG_ANALYZER_OBJC_DEALLOC
		\ CLANG_ANALYZER_OBJC_GENERICS
		\ CLANG_ANALYZER_OBJC_INCOMP_METHOD_TYPES
		\ CLANG_ANALYZER_OBJC_RETAIN_COUNT
		\ CLANG_ANALYZER_OBJC_SELF_INIT
		\ CLANG_ANALYZER_OBJC_UNUSED_IVARS

" Static Analysis - Issues - Security
syntax keyword xcconfigVariable
		\ CLANG_ANALYZER_SECURITY_FLOATLOOPCOUNTER
		\ CLANG_ANALYZER_SECURITY_INSECUREAPI_GETPW_GETS
		\ CLANG_ANALYZER_SECURITY_INSECUREAPI_MKSTEMP
		\ CLANG_ANALYZER_SECURITY_INSECUREAPI_RAND
		\ CLANG_ANALYZER_SECURITY_INSECUREAPI_STRCPY
		\ CLANG_ANALYZER_SECURITY_INSECUREAPI_UNCHECKEDRETURN
		\ CLANG_ANALYZER_SECURITY_INSECUREAPI_VFORK
		\ CLANG_ANALYZER_SECURITY_KEYCHAIN_API

" Static Analysis - Issues - Unused Code
syntax keyword xcconfigVariable
		\ CLANG_ANALYZER_DEADCODE_DEADSTORES
		\ CLANG_TIDY_BUGPRONE_REDUNDANT_BRANCH_CONDITION
		\ CLANG_TIDY_MISC_REDUNDANT_EXPRESSION


" --- Allowed setting values ---
" What follows are allowed values for certain build settings
" (organized listed in the Xcode Build Settings pane)
highlight default link xcconfigEnumConstant Constant

" Build Options: GCC_VERSION
syntax match xcconfigEnumConstant /\<com.apple.compilers.llvm.clang.1_0\>/

" Build Options: DEBUG_INFORMATION_FORMAT
syntax match xcconfigEnumConstant /\<dwarf\>/
syntax match xcconfigEnumConstant /\<dwarf-with-dsym\>/ " must come after dwarf for both to match

" Signing: CODE_SIGN_IDENTITY
syntax match xcconfigEnumConstant /\<Mac Developer\>/
syntax match xcconfigEnumConstant /\<Mac Distribution\>/
syntax match xcconfigEnumConstant /\<iPhone Developer\>/
syntax match xcconfigEnumConstant /\<iPhone Distribution\>/

" Apple Clang - Code Generation: GCC_OPTIMIZATION_LEVEL
syntax keyword xcconfigEnumConstant
      \ s
      \ fast
      \ z

" Apple Clang - Language: GCC_C_LANGUAGE_STANDARD
syntax keyword xcconfigEnumConstant
      \ ansi
      \ c89
      \ gnu89
      \ c99
      \ gnu99
      \ c11
      \ gnu11

" Apple Clang - Language - C++: CLANG_CXX_LANGUAGE_STANDARD
syntax match xcconfigEnumConstant /\<c++98\>/
syntax match xcconfigEnumConstant /\<gnu++98\>/
syntax match xcconfigEnumConstant /\<c++0x\>/
syntax match xcconfigEnumConstant /\<gnu++0x\>/
syntax match xcconfigEnumConstant /\<c++17\>/
syntax match xcconfigEnumConstant /\<gnu++17\>/
syntax match xcconfigEnumConstant /\<c++20\>/
syntax match xcconfigEnumConstant /\<gnu++20\>/

" Apple Clang - Language - C++: CLANG_CXX_LIBRARY
syntax match xcconfigEnumConstant /\<libstdc++/
syntax match xcconfigEnumConstant /\<libc++/

" Apple Clang - Warnings (various settings)
syntax keyword xcconfigEnumConstant
      \ YES_ERROR

" Static Analysis - Analysis Policy (various settings)
syntax keyword xcconfigEnumConstant
      \ Shallow
      \ Deep

" Static Analysis - Issues (various settings)
syntax keyword xcconfigEnumConstant
      \ YES_AGGRESSIVE

let b:current_syntax = "xcconfig"
