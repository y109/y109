:echomsg 'I am gavinyao-NB.vimrc'

:nmap <silent><Leader>uu :call AutoUpload()<CR>

if !exists('*AutoUpload')
  function! AutoUpload()
      let g:msg = ""
      let g:cmd = ""
      if g:filename == $MYVIMRC
         let g:cmd = '!cp -r % ' . $HOME . '/work/code/git/y109/ & > /dev/null &'
      endif

      if g:pwd == $HOME . '/work/shell'
          let g:cmd = "!cp -r % " . $HOME . "/work/code/git/y109/shell/%:h & > /dev/null &"
      endif

      if g:pwd == $HOME . '/work/develop/php/cloud/'
          let g:cmd = "!cp -r % /data/video/%:h & > /dev/null &"
      endif


      if g:cmd != ""
          silent execute g:cmd
          let g:msg="Upload SUCCESS ! CMD = " . g:cmd
      endif

      redraw!

      if g:msg != ""
          echomsg g:msg
      endif

  endfunction
endif


