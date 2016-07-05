setlocal
set SCRIPTDIR=%~dp0
cd %SCRIPTDIR%
REM cd ..\Bld
REM call build.bat debug x86
REM cd %SCRIPTDIR%

set Configuration=Debug

REM "C:\Users\t-suchav\P\Src\FSExpGen\bin\Debug\FSExpGen.exe"

echo msbuild  %SCRIPTDIR%\Tools\RunPTool\RunPTool.csproj /t:Rebuild /p:Configuration=%Configuration% /p:Platform=x86 /nologo
msbuild  %SCRIPTDIR%\Tools\RunPTool\RunPTool.csproj /t:Rebuild /p:Configuration=%Configuration% /p:Platform=x86  /nologo
if %ERRORLEVEL% neq 0 (
  echo Could not compile test utility.
  exit /B 1
)

echo %SCRIPTDIR%..\Bld\Drops\%Configuration%\x86\Binaries\RunPTool.exe "C:\Users\t-suchav\Desktop\Dirs.txt"
"%SCRIPTDIR%..\Bld\Drops\%Configuration%\x86\Binaries\RunPTool.exe" "C:\Users\t-suchav\Desktop\Dirs.txt"

mshta "javascript:var sh=new ActiveXObject( 'WScript.Shell' ); sh.Popup( 'Done with Tests!', 10, 'Check Back!', 64 );close()"


if %ERRORLEVEL% neq 0 (
  echo Tests failed.
  exit /B 1
) else ( exit /B 0 )