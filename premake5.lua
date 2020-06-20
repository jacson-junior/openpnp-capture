project "openpnp-capture"
	kind "StaticLib"
	language "C++"
	cppdialect "C++11"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/openpnp-capture.h",
		"src/common/**.h",
		"src/common/**.cpp"
	}

	filter "system:macosx"
		pic "On"

		systemversion "latest"
		staticruntime "On"

		files
		{
			"mac/platformcontext.h",
			"mac/platformcontext.mm",
			"mac/platformdeviceinfo.h",
			"mac/platformstream.h",
			"mac/platformstream.mm",
			"mac/uvcctrl.h",
			"mac/uvcctrl.mm",
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