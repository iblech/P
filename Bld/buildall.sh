SCRIPT=$0
echo $SCRIPT
SCRIPTPATH=$(dirname "$SCRIPT") #Absolute path of script
echo $SCRIPTPATH
pushd $SCRIPTPATH
echo yo
for c in Debug Release
do
	for p in x86 x64 
	do 
	    echo ======================================================================
	    echo "calling build.sh" $c $p
	    echo ======================================================================
	    ./build.sh $c $p 
	    if [ $? -eq 1 ]
	    	then
	    	break
	    fi
	done
done

popd