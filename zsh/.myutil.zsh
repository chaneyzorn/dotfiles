gitls() {
    for i in $(ls); do
        echo "============ $i ============"
        git -C $i status
        echo ""
    done
}
