echo "apply strix patch..."

STRIX_DIR=${ANDROID_BUILD_TOP}/vendor/strix

. $STRIX_DIR/scripts/functions.sh

for patch in "$STRIX_DIR"/patchs/*.patch; do
    [ -f "$patch" ] || continue
    strix_apply_patch "$patch"
done


cd ${ANDROID_BUILD_TOP}

echo "apply strix patch end"