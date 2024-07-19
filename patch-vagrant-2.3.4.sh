#!/bin/bash

# Run from ~/Projects/vagrant and checkout https://github.com/wbclark/vagrant/tree/vagrant-2.3.4-patched

for file in $(git diff --name-only vagrant-2.3.4 vagrant-2.3.4-patched); do
    sudo cp "$file" "/usr/share/vagrant/gems/gems/vagrant-2.3.4/$file";
done
