﻿#Requires AutoHotkey v2.0

current := "18 - using the mime interface"

clean := ["txt","html","json","zst"]
for k,v in clean
	FileDelete(A_ScriptDir "\*." v)
	
run(A_ScriptDir "\" current ".ahk")



