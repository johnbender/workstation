pip install powerline-status

if ! [ -d ~/.emacs.d ]; then
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
  cd ~/.emacs.d
  git fetch
  git checkout v0.200.13
  cd -
fi

export OPAMROOT=~/.opam # installation directory
opam init -n --comp=4.02.3
opam repo add coq-released http://coq.inria.fr/opam/released
opam install coq.8.6.1 && opam pin add coq 8.6.1

cp /vagrant/files/.tmux.conf ~/
cp /vagrant/files/.bash_profile ~/

