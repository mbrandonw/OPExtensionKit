default:

clean:
	-rm -rf build/*

test:
	GHUNIT_CLI=1 xcodebuild -project ../OPExtensionKit.xcodeproj -target OPExtensionKitTests -configuration Debug -sdk iphonesimulator build
