startTmux() {
    local start_dir=$PWD
    dirfile=/tmp/dirfile
    ranger --choosedir=$dirfile --show-only-dirs
    cd $(cat $dirfile)
    tmux
}
