" plugin/mumps_rpc.vim

" Define commands to load and save MUMPS routines

nnoremap <leader>vl :call MumpsRpc('load')<CR>
nnoremap <leader>vs :call MumpsRpc('save')<CR>
