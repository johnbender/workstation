function install {
  apt-get install -y "$@"
}

add-apt-repository ppa:ubuntu-elisp/ppa
apt-get update

install build-essential emacs25-nox m4 ocaml-nox opam tmux git python-pip htop
