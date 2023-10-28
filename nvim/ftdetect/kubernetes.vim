" https://vi.stackexchange.com/questions/43343/additional-filetypes-for-different-types-of-yaml-files
autocmd BufRead *.yaml,*.yml
                        \ if search('apiVersion: ', 'nw') |
                        \ setlocal ft=yaml.kube |
                        \ endif
