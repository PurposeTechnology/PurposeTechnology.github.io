



function check(){

	local argument1=$1;
	local argument2=$2;
	if [ "$argument1" == "file" ]; then 
		if [ -f "$argument1" ]; then
		  return 0;
		else
		  return 1;
		fi
	fi
	if [ "$argument1" == "directory" ]; then 
		if [ -d "$argument1" ]; then
		  return 0;
		else
		  return 1;
		fi
	fi

}
alias lsd='ls';
alias ll="ls -lhaG";


ll;
exit
exists $1 $2;
echo $? 


exit

function create(){

	local argument1=$1;
	local argument2=$2;

	if [ "$argument1" == "file" ]; then
		if 
	   errorOutput=$(command touch "$argument2" 2>&1 1>/dev/null);
	  
	fi

	if [ "$argument1" == "folder" ]; then
	  errrorOutput=$(command mkdir "$argument2" 2>&1 1>/dev/null);
	  echo asdf $errrorOutput asdf
	fi

}

create $1 $2;



exit 
