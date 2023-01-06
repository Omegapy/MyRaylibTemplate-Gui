
-- Modified from Jeffery Myers original version 

baseName = path.getbasename(os.getcwd());

project (workspaceName)
  	kind "ConsoleApp"
    location "../build"
    targetdir "../bin/%{cfg.buildcfg}"
    targetdir "../bin/%{cfg.buildcfg}"
	
    filter "configurations:Release"
		kind "WindowedApp"
		entrypoint "mainCRTStartup"

	filter "action:vs*"
        debugdir "$(SolutionDir)"
		
	filter {"action:vs*", "configurations:Release"}
			kind "WindowedApp"
			entrypoint "mainCRTStartup"
	filter {}
	
	vpaths 
	{
	  ["Header Files/*"] = {"**.h", "**.hpp"},
	  ["Source Files/*"] = {"**.c", "**.cpp"},
	}
	files {"**.c", "**.cpp", "**.h", "**.hpp"}

	
	link_raylib();
	