
local base_dir, output_dir = ...

project "_SDL2"
    kind "SharedLib"
    files (base_dir.."/dummy.cpp")

    filter "system:not windows"
        prebuildcommands
        {
            "{TOUCH} "..base_dir.."/dummy.cpp",
            "{CHDIR} "..base_dir.."; [ -f Makefile ] || ./configure; make -j16"
        }
        postbuildcommands
        {
            "{COPY} "..base_dir.."/build/.libs/libSDL2*%{cfg.buildtarget.extension}* "..output_dir
        }
    filter {}
project "*"
