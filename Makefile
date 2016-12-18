all : WebM-iOS.zip

clean :
	rm -f WebM-iOS.zip
	rm -rf WebM-iOS
	rm -rf libwebm/framework

WebM-iOS.zip : WebM-iOS/WebM.framework/WebM
	rm -f WebM-iOS.zip
	zip -r WebM-iOS.zip \
	  WebM-iOS/LICENSE.TXT \
		WebM-iOS/PATENTS.TXT \
	  WebM-iOS/WebM.framework

WebM-iOS/WebM.framework/WebM :
	rm -rf WebM-iOS
	mkdir WebM-iOS
	cp -pf libwebm/LICENSE.TXT WebM-iOS/LICENSE.TXT
	cp -pf libwebm/PATENTS.TXT WebM-iOS/PATENTS.TXT
	rm -rf libwebm/framework
	(cd libwebm && ../libwebm/iosbuild.sh --enable-shared --disable-bitcode --show-build-output --verbose)
	cp -prf libwebm/framework/WebM.framework WebM-iOS
