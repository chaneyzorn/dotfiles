gitls() {
    for i in $(ls); do
        echo -e "\033[1;32m================================ $i =================================\033[0m"
        git -C $i status
        echo ""
    done
}
