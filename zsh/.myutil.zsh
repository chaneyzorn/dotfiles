gitls() {
    for i in $(ls); do
        echo -e "\033[1;32m================================ $i =================================\033[0m"
        git -C $i status --short
        echo ""
    done
}

gitup() {
    for i in $(ls); do
        echo -e "\033[1;32m================================ $i =================================\033[0m"
        git -C $i pull
        echo ""
    done
}

envproxy() {
    echo "export https_proxy=http://$1:7890;export http_proxy=http://$1:7890;export all_proxy=socks5://$1:7890"
}
