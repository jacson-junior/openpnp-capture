project "openpnp-capture"
	kind "StaticLib"
	language "C++"
	cppdialect "C++11"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"common/**.h",
		"common/**.cpp"
	}
	
	includedirs
    {
        "include"
    }

	filter "system:macosx"
		pic "On"

		systemversion "latest"

		files
		{
			"mac/**.h",
			"mac/**.mm",
        }
        
        libdirs {
            os.findlib("AVFoundation"),
            os.findlib("Foundation"),
            os.findlib("CoreMedia"),
            os.findlib("CoreVideo"),
            os.findlib("Accelerate"),
            os.findlib("IOKit"),
        }

        links {
            "AVFoundation.framework",
            "Foundation.framework",
            "CoreMedia.framework",
            "CoreVideo.framework",
            "Accelerate.framework",
            "IOKit.framework",
        }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"