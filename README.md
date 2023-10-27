pyk's personal nvim setup based on [NVChad](https://nvchad.com).

Install neovim using the following command:

```sh
brew install neovim
```

Setup configuration using the following command:

```sh
git clone git@github.com:pyk/nvim.git ~/.config/nvim
```

Install required dependencies using the following command:

```sh
brew install ripgrep
```

Overview:

- `mason` is used to install external dependencies such as LSP, linter and formatter binary
- `mason-lspconfig` is a package manager dedicated for LSP
- `nvim-lspconfig` is used to run installed LSP server (e.g. tsserver)
- `nvim-lint` is used to run linter (e.g. eslint)

Actions:

- Add/remove LSP in [./lua/custom/configs/lspconfig.lua](./lua/custom/configs/lspconfig.lua)
- Add new linter in [./lua/custom/plugins.lua](./lua/custom/plugins.lua) (masin `ensure_installed`)
- Use the linter via [./lua/custom/configs/lint.lua](./lua/custom/configs/lint.lua)
- Add new formatter in [./lua/custom/plugins.lua](./lua/custom/plugins.lua) (masin `ensure_installed`)
- Use the formatter via [./lua/custom/configs/lint.lua](./lua/custom/configs/lint.lua)

Info:

- Don't forget to restart and run `:MasonInstallAll` after adding new lsp, linter or formatter.
- `eslint_d` linter requires eslint config to work

Keyboard shortcuts:

- `CTRL+n` open file explorer
- `CTRL+w w` to switch window (e.g. tree view explorer with editor)
- `Tab` to switch between open files
