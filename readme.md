# Vim MUMPS RPC Plugin

This Vim plugin allows users to load and save MUMPS routines using `VimRpcConnect.exe`. It provides an easy interface for interacting with MUMPS routines directly from Vim, leveraging key mappings and commands.

## Features

- **Load MUMPS routines**: Load routines into the current buffer from the RPC system.
- **Save MUMPS routines**: Save the current buffer back to the RPC system.
- **Custom Keybindings**: Use `<leader>vl` to load and `<leader>vs` to save routines easily.

## Installation

### Using [Vim Plug](https://github.com/junegunn/vim-plug)

1. Add the following to your `.vimrc` or `init.vim`:

   ```vim
   call plug#begin('~/.vim/plugged')
   
   " Load the vim-mumps-rpc plugin
   Plug 'username/vim-mumps-rpc'
   
   call plug#end()
