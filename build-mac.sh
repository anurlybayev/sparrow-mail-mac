#!/bin/sh

xcodepath=/Applications/Xcode45-DP2.app
resuldir=app/Sparrow.app/Contents/Frameworks/SparrowBackend.framework

$xcodepath/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++ -arch x86_64 \
 libSparrowBackend.a \
 -dynamiclib -isysroot $xcodepath/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk \
 -Llib \
 -Fapp/Sparrow.app/Contents/Frameworks \
 -F$xcodepath/Contents/Developer/Library/Frameworks \
 -install_name "@executable_path/../Frameworks/SparrowBackend.framework/Versions/A/SparrowBackend" \
 -mmacosx-version-min=10.7 -lCrashReporter-MacOSX-Static -lCloud -lsnappy -ltokyocabinet -ltokyodystopia -lctemplate \
 -lcrypto -lz -lssl -liconv -lstdc++.6 -all_load -lresolv -lbz2 -licucore -fobjc-link-runtime -framework EtPanKit \
 -framework GData -framework Growl -framework AddressBook -framework Cocoa -framework Security -framework IOKit \
 -framework SystemConfiguration -framework WebKit -single_module -compatibility_version 1 -current_version 1 \
 -o $resuldir/Versions/A/SparrowBackend
