
" autoload/mumps_rpc.vim

function! MumpsRpcConnect(action)
    " Check if the current filetype is MUMPS for save action
    if a:action == 'save' && &filetype != 'mumps'
        echo "Error: Can only save files with filetype 'mumps'."
        return
    endif

    " Set the path to VimRpcConnect.exe
    let l:vimexe = $HOME . '\.vim\plugged\vim-mumps-rpc\VimRpcConnect.exe r='

    " Handle loading a routine
    if a:action == 'load'
        " Prompt for the routine name
        let l:routine = input('Enter routine name (with extension): ')

        " If no routine was entered, exit the function
        if l:routine == ''
            echo "Error: No routine name provided."
            return
        endif

        " Check if the routine has a valid extension
        if l:routine !~ '\.\w\+$'
            echo "Error: Routine must include a valid file extension."
            return
        endif

        " Get the current working directory and form the full routine path
        let l:routine_path = getcwd() . '\' . l:routine
        let l:routine_path = fnameescape(l:routine_path) " Escape file path for safe usage

        " Create the command to load the routine
        let l:cmd = l:vimexe . l:routine_path . ' s=load'
        "echo l:cmd
        call system(l:cmd)

        " Check if the file was successfully loaded
        if filereadable(l:routine_path)
            execute 'edit ' . l:routine_path
        else
            echo "Error: Unable to load routine " . l:routine
        endif

    " Handle saving the current MUMPS file
    elseif a:action == 'save'
        " Get the full path of the current file
        let l:filename = expand('%:p')

        " Form the save command
        let l:cmd = l:vimexe . fnameescape(l:filename) . ' s=save'
        call system(l:cmd)

        " Confirm save
        echo "Routine " . expand('%:t') . " has been saved successfully."
    else
        echo "Error: Invalid action. Use 'load' or 'save'."
    endif
endfunction
