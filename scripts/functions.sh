strix_apply_patch_if_needed() {
    local patch_file=$1

    if patch -p1 -R --dry-run < "$patch_file" >/dev/null 2>&1; then
        echo "Patch already applied: $patch_file"
    else
        echo "Applying patch: $patch_file"
        patch -p1 < "$patch_file"
    fi
}


strix_apply_patch() {
    local patch_file="$1"

    # 文件名
    local name=$(basename "$patch_file")

    # 去掉 .diff
    name=${name%.diff}

    # _ 转 /
    local target=$(echo "$name" | tr '_' '/')

    local target_dir="$ANDROID_BUILD_TOP/$target"

    if [ ! -d "$target_dir" ]; then
        echo "Target dir not exist: $target_dir"
        return
    fi

    echo "Processing patch: $patch_file"
    echo "Target: $target_dir"

    cd "$target_dir" || return

    # 判断是否已经打过补丁
    if patch -p1 -R --dry-run < "$patch_file" >/dev/null 2>&1; then
        echo "Patch already applied"
    else
        echo "Applying patch..."
        patch -p1 < "$patch_file"
    fi

    echo
}
