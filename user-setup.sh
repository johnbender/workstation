scrip_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pip install powerline-status

if ! [ -d ~/.emacs.d ]; then
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
  cd ~/.emacs.d
  git fetch
  git checkout v0.200.13
  cd -
fi

if ! [ -d ~/.emacs.d/private/coq ]; then
  git clone https://github.com/olivierverdier/spacemacs-coq ~/.emacs.d/private/coq
fi

if ! [ -d ~/.emacs.d/private/local/proof-general ]; then
  git clone https://github.com/ProofGeneral/PG ~/.emacs.d/private/local/proof-general
fi

cd ~/.emacs.d/private/local/proof-general
patch -p1 < "$script_dir/files/pg-underline.patch"
cd -

# NOTE this will require 4 gigs of ram :(
export OPAMROOT=~/.opam # installation directory
opam init -n --comp=4.02.3
opam repo add coq-released http://coq.inria.fr/opam/released
opam install coq.8.6.1 && opam pin add coq 8.6.1

for file in .tmux.conf .bash_profile .spacemacs .dir_colors; do
  cp "$script_dir/files/$file" ~/
done

cp "$script_dir/files/ssh-config" ~/.ssh/config

mkdir -p ~/.bin
cp "$script_dir/files/tmux-workspace" ~/.bin/
chmod +x ~/.bin/*

git config --global user.email "johnbender@protonmail.com"
git config --global user.name "John Bender"
