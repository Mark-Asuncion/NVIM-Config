#! /bin/bash
set -e
d=$(mktemp -d)
cd $d

echo "Downloading treesitter..."
wget "https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.9/tree-sitter-linux-x64.gz"
echo "Unzipping treesitter..."
gunzip tree-sitter-linux-x64.gz
chmod u+x tree-sitter-linux-x64
echo "Moving to ~/.local/bin..."
mv tree-sitter-linux-x64 ~/.local/bin
ln -s "${HOME}/.local/bin/tree-sitter-linux-x64" "${HOME}/.local/bin/tree-sitter"
