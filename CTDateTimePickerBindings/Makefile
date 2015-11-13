#
# CTDateTimePicker monotouch bindings
#

MDTOOL='/Applications/Xamarin Studio.app/Contents/MacOS/mdtool'
SHARPIE=sharpie
SLN_NAME=CTDateTimePickerBindings.sln
BIND_DIR=./
LIB_DIR=../CTDateTimePicker/
LIB_NAME=libCTDateTimePicker-universal.a
LIB_PATH=$(LIB_DIR)/$(LIB_NAME)

all: bindings

bindings: getlib definitions
	$(MDTOOL) -v build --target:Build --configuration:"Release|iPhone" $(SLN_NAME)

definitions:
	$(SHARPIE) xcode -sdks
	$(SHARPIE) \
		-tlm-do-not-submit -tlm-do-not-identify \
		bind --sdk=iphoneos9.1 --namespace=CTDateTimePicker.Bindings \
		-scope $(LIB_DIR) $(LIB_DIR)/CTDateTimePicker.h

getlib: $(LIB_PATH)
	cp $(LIB_PATH) $(BIND_DIR)

clean:
	-@rm -rf $(BIND_DIR)/obj
	-@rm -rf $(BIND_DIR)/bin
	-@rm -rf $(LIB_NAME)

.PHONY: all clean bindings getlib

.SILENT: clean