-- Updated 2/16/2021
function downloadPkg()
  if exists("CFGUI", "script") > 0 then
    return
  else
    downloadFile(getMudletHomeDir() .. "/CFGUI.zip", "https://github.com/Rahsael/CFGUI/releases/latest/download/CFGUI.zip")  
  end
end
registerAnonymousEventHandler("sysLoadEvent", "downloadPkg")

function installReady(event, file)
  if file ~= getMudletHomeDir().."/CFGUI.zip" then
    return
  else
    installPackage(getMudletHomeDir().."/CFGUI.zip")
  end
end
registerAnonymousEventHandler("sysDownloadDone", "installReady")

function installComplete(_, package)
  if package == "CFGUI" then
    cecho("<OrangeRed>Installation complete!\n\n")
    cecho("<gold>After logging in, you may need to use the <white>setprompt<gold> command. See <white>guihelp<gold> for more information.\n\n")
  end
end
registerAnonymousEventHandler("sysInstall", "installComplete")
