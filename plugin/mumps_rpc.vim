" plugin/mumps_rpc.vim

" Define commands to load and save MUMPS routines
command! MumpsRpcLoad call mumps_rpc#connect('load')
command! MumpsRpcSave call mumps_rpc#connect('save')

" Map commands to key combinations
nnoremap <leader>vl :MumpsRpcLoad<CR>
nnoremap <leader>vs :MumpsRpcSave<CR>
