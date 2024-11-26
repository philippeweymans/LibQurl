﻿#Requires AutoHotkey v2.0
#Include %a_scriptdir%\..\lib\LibQurl.ahk
#Include %a_scriptdir%\..\lib\Aris\G33kDude\cjson.ahk
SetWorkingDir(A_ScriptDir "\..")
curl := LibQurl()
curl.register(A_WorkingDir "\bin\libcurl-x64.dll")

postUrl := "https://httpbin.org/post" ;site we're POSTing to
curl.SetOpt("URL",postUrl)

postSource := 1234567890
curl.SetPost(postSource)
curl.WriteToFile(A_ScriptDir "\07.integer.json")
curl.Perform()

postSource := "abcdefghij"
curl.SetPost(postSource)
curl.WriteToFile(A_ScriptDir "\07.string.json")
curl.Perform()

postSource := {ObjectToDump:"dummyValue1"} 
curl.SetPost(postSource)
curl.WriteToFile(A_ScriptDir "\07.object.json")
curl.Perform()

postSource := ["ArrayToDump","dummyValue2"]
curl.SetPost(postSource)
curl.WriteToFile(A_ScriptDir "\07.array.json")
curl.Perform()

postSource := Map("MapToDump","dummyValue3")
curl.SetPost(postSource)
curl.WriteToFile(A_ScriptDir "\07.map.json")
curl.Perform()

postSource := FileOpen(A_ScriptDir "\07.binary.upload.zip","r")
curl.SetPost(postSource)
curl.WriteToFile(A_ScriptDir "\07.binary.json")
curl.Perform()