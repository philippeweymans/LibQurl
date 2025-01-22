#Requires AutoHotkey v2.0
#Include C:\Users\phili\Documents\GitHub\2.Production\AutoHotkey Master\LibQurl\lib\LibQurl.ahk
#Include C:\Users\phili\Documents\GitHub\2.Production\AutoHotkey Master\Aris\lib\Aris\packages.ahk
SetWorkingDir(A_ScriptDir "\..")
curl := LibQurl("C:\Users\phili\Documents\GitHub\2.Production\AutoHotkey Master\curl-8.11.1_3\bin\libcurl-x64.dll")

curl.SetOpt("URL","https://httpbin.org/headers")
curl.SetHeaders(Map("tidbit","is a header"
                    ,"Custom","header2"
                    ,"Custom-Header","3"))

curl.HeaderToFile(A_ScriptDir "\06.headers.txt")
curl.WriteToFile(A_ScriptDir "\06.body.json")

curl.Sync()