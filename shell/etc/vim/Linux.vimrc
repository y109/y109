"-----------------------------------------------------------------
" SFTP
" :nmap <silent><Leader>wu :w<CR>:!/Users/yaojungang/work/develop/shell/sftpatohostpath.sh gavinyao@10.6.207.220:/data/web/dzqun_dev/ %:h %<CR><CR>
" :nmap <silent><Leader>ww :w<CR>:!/Users/yaojungang/work/develop/shell/sftpatohostpath.sh gavinyao@10.6.207.220:/data/home/gavinyao/develop/dzqun/ %:h %<CR><CR>

" :nmap <silent><Leader>uu :call AutoUpload1()<CR>:echomsg "Upload success"<CR>redraw!<CR>

" if !exists('*AutoUpload2Local')
  " function! AutoUpload2Local()
      " silent execute "!cp -r % /data/video/%:h & > /dev/null &"
      " redraw
  " endfunction
" endif

" if !exists('*AutoUpload')
  " function! AutoUpload()
      " :cd /Users/yaojungang/work/develop/php/cloud/dzqun-branches
      " execute "!scp -P 36000 % gavinyao@10.6.207.220:/data/web/dzqun_dev/%:h"
  " endfunction
" endif

" " 后台显示命令
" if !exists('*AutoUpload1')
  " function! AutoUpload1()
      " " :cd /Users/yaojungang/work/develop/php/cloud/dzqun-branches
      " silent execute "!scp -P 36000 % gavinyao@10.6.207.220:/data/web/dzqun_dev/%:h & > /dev/null &" | redraw!
  " endfunction
" endif

" if !exists('*AutoUpload0')
  " function! AutoUpload0()
      " silent execute "!/Users/yaojungang/work/develop/shell/sftpatohostpath.sh gavinyao@10.6.207.220:/data/web/dzqun_dev/ %:h % " | redraw!
  " endfunction
" endif

" 保存文件时自动上传
" autocmd BufWritePost,FileWritePost *.php call AutoUpload()
" autocmd FileWritePost *.php call AutoUpload()
"
"-----------------------------------------------------------------
" 代码折叠
setlocal foldmethod=manual
Bundle 'phpfolding.vim'
" 关闭自动折叠功能
let g:DisableAutoPHPFolding = 1
let php_folding=1
:nmap <Leader>ff :call FoldToggle()<CR><CR>

:let g:foldStatus = 1
if !exists("*FoldToggle")
function! FoldToggle()
    echo "FoldToggle"
    if g:foldStatus == 1
        echo "DisableFold"
        let g:foldStatus = 0
        :DisablePHPFolds
    else
        echo "EnableFold"
        let g:foldStatus = 1
        :EnableFastPHPFolds
    endif
endfunction
endif

"-----------------------------------------------------------------
