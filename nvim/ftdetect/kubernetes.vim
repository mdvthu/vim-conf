autocmd BufRead *.yaml,*.yml
                        \ if search('apiVersion: ', 'nw') |
                        \ setlocal ft=yaml.kube |
                        \ endif
