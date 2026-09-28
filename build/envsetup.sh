echo "apply strix patch... $1"

STRIX_DIR=$1/vendor/strix

. $STRIX_DIR/scripts/functions.sh

for patch in "$STRIX_DIR"/patchs/*.patch; do
    [ -f "$patch" ] || continue
    strix_apply_patch "$1" "$patch"
done


cd $1

echo "apply strix patch end"