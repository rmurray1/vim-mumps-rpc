
" autoload/mumps_rpc.vim

function! mumps_rpc#connect(action)
    " Check if the filetype is MUMPS
    if &filetype == "mumps"
        " Get the current buffer file name
        let l:filename = expand('%:p')

        " If action is 'load', ask for routine name
        if a:action == 'load'
            let l:routine = input('Enter routine name: ')
            " Create the command to run VimRpcConnect.exe with the routine name
            let l:cmd = $HOME . '\.vim\plugged\vim-mumps-rpc\VimRpcConnect.exe r=' . l:routine . ' s=load'
            " Load the routine
            let l:output = system(l:cmd)
            " Open the returned MUMPS file in a new buffer if successful
            if filereadable(l:output)
                execute 'edit ' . l:output
            else
                echo "Error: Unable to load routine."
            endif
        elseif a:action == 'save'
            " Create the command to run VimRpcConnect.exe for saving
            let l:cmd = $HOME . '\.vim\plugged\vim-mumps-rpc\VimRpcConnect.exe r=' . l:filename . ' s=save'
            " Execute the save command
            call system(l:cmd)
        endif
    endif
endfunction
