SCRIPT=$0
SCRIPTPATH=$(dirname "$SCRIPT") #Absolute path of script
cd  $SCRIPTPATH
cd ..
xbuild Ext/Zing/Zing.sln /p:Configuration=Release /p:Platform=x86 /t:clean
xbuild Ext/Zing/Zing.sln /p:Configuration=Debug /p:Platform=x86 /t:clean
xbuild Ext/Zing/Zing.sln /p:Configuration=Release /p:Platform=x64 /t:clean
xbuild Ext/Zing/Zing.sln /p:Configuration=Debug /p:Platform=x64 /t:clean

xbuild P.sln /p:Configuration=Debug /p:Platform=x86 /t:clean
xbuild P.sln /p:Configuration=Release /p:Platform=x86 /t:clean
xbuild P.sln /p:Configuration=Debug /p:Platform=x64 /t:clean
xbuild P.sln /p:Configuration=Release /p:Platform=x64 /t:clean
