" Set font according to system
if MySys() == "mac"
  set gfn=Menlo\ 12
  set antialias
  set shell=/bin/bash
elseif MySys() == "windows"
  set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif MySys() == "linux"
  set gfn=Monospace\ 10
  set shell=/bin/bash
endif



