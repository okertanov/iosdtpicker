#
# CTDateTimePicker Universal Library
#

BUILD_CFG='Release'
SIM_ARCHS='i386 x86_64'
ARM_ARCHS='armv7 armv7s arm64'
DEPLOYMENT_TARGET='8.2'
SIM_SDK='iphonesimulator9.2'
DEV_SDK='iphoneos9.2'
PROJ_NAME='CTDateTimePicker.xcodeproj'
LIB_NAME=libCTDateTimePicker

all: $(LIB_NAME)-universal

$(LIB_NAME)-universal: $(LIB_NAME)-x86 $(LIB_NAME)-arm
	lipo -create \
			./build/Release-iphoneos/$(LIB_NAME).a \
			./build/Release-iphonesimulator/$(LIB_NAME).a \
			-output $(LIB_NAME)-universal.a
	lipo -info $(LIB_NAME)-universal.a

$(LIB_NAME)-x86:
	xcodebuild -project $(PROJ_NAME) -configuration $(BUILD_CFG) -sdk $(SIM_SDK) clean build \
		ARCHS=$(SIM_ARCHS) IPHONEOS_DEPLOYMENT_TARGET=$(DEPLOYMENT_TARGET) \
		TARGET_BUILD_DIR='./build/Release-iphonesimulator' BUILT_PRODUCTS_DIR='./build/Release-iphonesimulator'

$(LIB_NAME)-arm:
	xcodebuild -project $(PROJ_NAME) -configuration $(BUILD_CFG) -sdk $(DEV_SDK) clean build \
		ARCHS=$(ARM_ARCHS) IPHONEOS_DEPLOYMENT_TARGET=$(DEPLOYMENT_TARGET) \
		TARGET_BUILD_DIR='./build/Release-iphoneos' BUILT_PRODUCTS_DIR='./build/Release-iphoneos'

clean:
	-@rm -rf ./[Bb]uild
	-@rm -f $(LIB_NAME)-universal.a

.PHONY: all clean $(LIB_NAME)-universal $(LIB_NAME)-x86 $(LIB_NAME)-arm

.SILENT: clean
