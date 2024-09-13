" plugin/mumps_rpc.vim

" Define commands to load and save MUMPS routines

nnoremap <leader>vl :call MumpsRpcConnect('load')<CR>
nnoremap <leader>vs :call MumpsRpcConnect('save')<CR>
