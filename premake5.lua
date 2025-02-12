outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "imgui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "On"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-temp/" .. outputdir .. "/%{prj.name}")

    files {
        "imgui.h",
        "imgui.cpp",

        "imgui_internal.h",
        "imconfig.h",
        "imconfig.h",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",

        "imgui_draw.cpp",
        "imgui_demo.cpp",
        "imgui_widgets.cpp",
        "imgui_tables.cpp",
    }

    filter "system:windows"
        systemversion "latest"

        defines { "_CRT_SECURE_NO_WARNINGS" }

    filter { "configurations:Debug" }
        runtime "Debug"
        symbols "On"

    filter { "configurations:Release" }
        runtime "Release"
        optimize "On"
