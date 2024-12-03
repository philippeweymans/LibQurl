﻿#Requires AutoHotkey v2.0
#Include %a_scriptdir%\..\lib\LibQurl.ahk
#Include %a_scriptdir%\..\lib\Aris\G33kDude\cjson.ahk
SetWorkingDir(A_ScriptDir "\..")
curl := LibQurl()
curl.register(A_WorkingDir "\bin\libcurl-x64.dll")
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

