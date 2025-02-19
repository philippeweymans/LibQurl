﻿#Requires AutoHotkey v2.0
MsgBox(a_scriptdir)
ExitApp
#Include C:\Users\phili\Documents\GitHub\2.Production\AutoHotkey Master\LibQurl\lib\LibQurl.ahk
#Include C:\Users\phili\Documents\GitHub\2.Production\AutoHotkey Master\Aris\lib\Aris\packages.ahk
SetWorkingDir(A_ScriptDir "\..")
curl := LibQurl(A_WorkingDir "\bin\libcurl.dll")
outMap := Map()
outMap["Opts"] := curl.opt
outMap["OptById"] := curl.optById
outMap["VersionInfo"] := curl.VersionInfo
outMap["easyHandleMap"] := curl.easyHandleMap
for k,v in outMap["easyHandleMap"] {    ;callbacks map doesn't enumerate
    if (k = 0)
        continue
    outMap["easyHandleMap"][k].Delete("callbacks")
}
FileOpen(A_ScriptDir "\01.json","w").Write(json.dump(outMap)) 

