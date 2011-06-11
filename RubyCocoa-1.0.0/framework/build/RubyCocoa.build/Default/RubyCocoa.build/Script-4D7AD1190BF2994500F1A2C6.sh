#!/bin/sh
if [ -d bridge-support ]; then
  rm -rf $BUILT_PRODUCTS_DIR/RubyCocoa.framework/Resources/BridgeSupport
  mkdir -p $BUILT_PRODUCTS_DIR/RubyCocoa.framework/Resources/BridgeSupport
  cp bridge-support/*.bridgesupport bridge-support/*.dylib $BUILT_PRODUCTS_DIR/RubyCocoa.framework/Resources/BridgeSupport
fi
