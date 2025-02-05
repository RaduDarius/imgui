outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "imgui"
    kind "StaticLib"
    language "C++"

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
        cppdialect "C++17"
        staticruntime "On"

    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"
