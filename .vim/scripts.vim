if did_filetype()
    finish
endif
if getline(1) =~# '^#!.*/bin/env\s\+yaegi\>'
    setfiletype go
endif
