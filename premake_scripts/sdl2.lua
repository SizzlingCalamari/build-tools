
local base_dir, output_dir = ...

project "_SDL2"
    targetname "SDL2"
    kind "SharedLib"
    files (base_dir.."/dummy.cpp")

    prebuildcommands ("{TOUCH} "..base_dir.."/dummy.cpp")
    filter "system:not windows"
        prebuildcommands
        {
            "{CHDIR} "..base_dir.."; [ -f Makefile ] || ./configure; make -j16"
        }
        postbuildcommands
        {
            "{COPY} "..base_dir.."/build/.libs/libSDL2*%{cfg.buildtarget.extension}* "..output_dir
        }
    filter { "system:windows", "platforms:x32" }
        local msbuild = '"'..os.getenv("VS120COMNTOOLS")..'../../../MSBuild/12.0/Bin/MSBuild" "'
        local build_command = path.translate(msbuild..base_dir..'/VisualC/SDL/SDL_VS2013.vcxproj"')
        prebuildcommands
        {
            build_command.." /p:Configuration=Release /p:Platform=Win32"
        }
        postbuildcommands
        {
            "{COPY} "..base_dir.."/VisualC/SDL/Win32/Release/SDL2.* "..output_dir
        }
    filter { "system:windows", "platforms:x64" }
        prebuildcommands
        {
            build_command.." /p:Configuration=Release /p:Platform=x64"
        }
        postbuildcommands
        {
            "{COPY} "..base_dir.."/VisualC/SDL/x64/Release/SDL2.* "..output_dir
        }
    filter {}
project "*"
