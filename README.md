# nvim

## Prerquisites

- Latest version of [Neovim](https://neovim.io/)
- Terminal that supports the colorscheme (Tokyo Night)
- Terminal font that supports glyphs of nvim-tree
- C and C++ compiler (treesitter requires it)
- Go, Node, Docker for their corresponding LSP
- LaTeX compiler in order for VimTeX to work
- PDF viewer that updates on changes (for a nice LaTeX workflow)

If you are on macOS I recommend [iTerm2](https://iterm2.com/) as it supports the colorscheme and doesn't differ much from the default macOS terminal. If you use Linux the default terminal should work. As font I recommend [MesloLGS NF](https://github.com/romkatv/dotfiles-public/tree/master/.local/share/fonts/NerdFonts). Make sure to install all four **.ttf** files. For PDF viewing while working on a LaTeX project I use [Skim](https://skim-app.sourceforge.io/), since it updates the PDF after every change on the LaTeX project.

## Getting started

Simply clone this repository into your **.config** folder. After that navigate into [nvim/lua/kalle/](https://github.com/kfc-manager/nvim/tree/main/lua/kalle) and open [plugins-setup.lua](https://github.com/kfc-manager/nvim/blob/main/lua/kalle/plugins-setup.lua) with Neovim. Then execute the command **:w** and Packer should install all plugins. After that you're ready to go.
