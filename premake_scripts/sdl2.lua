
local base_dir = ...

local build_command = ""
if (os.get() == "windows") then
    local msbuild = '"'..os.getenv("VS120COMNTOOLS")..'../../../MSBuild/12.0/Bin/MSBuild" "'
    build_command = path.translate(msbuild..base_dir..'/VisualC/SDL/SDL_VS2013.vcxproj"')
end

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
    filter { "system:windows", "platforms:x32" }
        prebuildcommands
        {
            build_command.." /p:Configuration=Release /p:Platform=Win32"
        }
    filter { "system:windows", "platforms:x64" }
        prebuildcommands
        {
            build_command.." /p:Configuration=Release /p:Platform=x64"
        }
    filter {}
project "*"
