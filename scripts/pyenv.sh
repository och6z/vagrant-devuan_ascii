#!/bin/bash

installPyenv () {
    apt install -y -qq --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libterm-readline-gnu-perl libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python-openssl git > /dev/null 2>&1
    apt install -y -qq --no-install-recommends libedit-dev > /dev/null 2>&1
    apt install -y -qq --no-install-recommends libssl-dev > /dev/null 2>&1
    apt install -y -qq --no-install-recommends libssl1.0-dev > /dev/null 2>&1
    curl --silent https://pyenv.run bash | bash > /dev/null 2>&1
    echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
}

funcs=(installPyenv)

for func in "${funcs[@]}"
do
    $func || fail $func
done
