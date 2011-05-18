au BufNewFile,BufRead {Gemfile,Rakefile,*.rake,Capfile,config.ru} setf ruby
au BufNewFile,BufRead {*.rjs,*.rxml} setf ruby
au BufNewFile,BufRead *.erb	         setf eruby
au BufNewFile,BufRead *.sass	       setf sass
au BufNewFile,BufRead COMMIT_EDITMSG setf diff
