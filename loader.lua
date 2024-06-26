-- Updated 4/3/2024
-- Disable/remove obsolete loader script
if exists("CF_Loader", "script") > 0 then
  disableScript("CF_loader")
  uninstallPackage("CF_loader")
end
if exists("CF-Loader", "script") > 0 then
  disableScript("CF-loader")
  uninstallPackage("CF-loader")
end

-- Downloads CFGUI if it is not installed.
function downloadPkg()
  if exists("CFGUI", "script") > 0 then
    return
  else
    installPackage([[https://github.com/carrionfields/CFGUI/releases/latest/download/CFGUI.zip]])  
  end
  return
end
registerAnonymousEventHandler("sysLoadEvent", "downloadPkg")

-- Checks the version number when version.txt is updated.
function versionCheck(a, filename)
  --  local filename = getMudletHomeDir().."/version.txt"
  --  local url = "https://github.com/carrionfields/CFGUI/releases/latest/download/version.txt"
  if not filename:find("version.txt", 1, true) then
    return
  end
  local f, s, versiontxt = io.open(filename)
  if f then
    gui_versiontxt = f:read("*l");
    obsolete_loader_version = f:read("*l");
    patchnotes = f:read("*a");
    io.close(f)
  end
  --Check GUI version
  if gui_versiontxt == GUI_version then
    return
  else
    uninstallPackage("CFGUI")
    cecho("<OrangeRed>A new version of the Carrion Fields client is available. Please restart Mudlet to install before playing.\n\n")
    echo("Current version: ".. GUI_version .. " | Latest version: " .. gui_versiontxt)
    installPackage([[https://github.com/carrionfields/CFGUI/releases/latest/download/CFGUI.zip]])
  end
end
registerAnonymousEventHandler("sysDownloadDone", "versionCheck")

-- Install new version after removing
function updatePkg(a, package)
  if package == "CFGUI" then
    installPackage([[https://github.com/carrionfields/CFGUI/releases/latest/download/CFGUI.zip]])
  end
end
registerAnonymousEventHandler("sysUninstall", "updatePkg")

-- Installation complete notice
function installComplete(_, package)
  if package == "CFGUI" then
    updateWindow(gui_versiontxt, patchnotes, true)
    cecho("<OrangeRed>Installation complete!\n\n")
    cecho("<gold>After logging in, you may need to use the <white>score<gold> and <white>setprompt<gold> command.\nSee <white>guihelp<gold> for more information.\n\n")
  end
end
registerAnonymousEventHandler("sysInstall", "installComplete")
