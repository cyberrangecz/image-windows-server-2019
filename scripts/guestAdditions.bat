
cmd /c for %%i in (E:\cert\vbox*.cer) do E:\cert\VBoxCertUtil add-trusted-publisher %%i --root %%i
cmd /c E:\VBoxWindowsAdditions.exe /S

