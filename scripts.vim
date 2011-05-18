if did_filetype()
  finish
endif
if getline(1) =~ '^#!.*\<node\>'
  setf javascript
endif
