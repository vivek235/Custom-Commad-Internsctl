#custom commands script#custom commands script
#Command Name Internsctl
# Command Version v0.1.0

internsctl(){
     if  [[ "$1" = "--help" ]]; then
          echo "Help Command of Internsctl";
     elif [[ "$1" = "--version" ]]; then
          echo "Version v0.1.0";
          #To get CPU information
     elif [[ "$2" = "getinfo" ]]; then
          if [[ "$1" = "cpu" ]]; then
             lscpu;
             #To get memory info
          elif [[ "$1" = "memory" ]]; then
             free;
             #To get File Info
          elif [[ "$1" = "file" ]]; then
             #To get file size
             if [[ "$3" = "--size" ]]; then
                stat --printf="%B\n" "$4";
                #to get file permissions
             elif [[ "$3" = "--permissions" ]]; then
                stat --printf="%A\n" "$4";
                #To get file owner
             elif [[ "$3" = "--owner" ]]; then
                stat --printf="%U\n" "$4";
                #To get info regarding last date modified
             elif [[ "$3" = "--last-modified" ]]; then
                stat --printf="%y\n" "$4";
                #File Info with Name, Size, Owner, Modified date
             else
               echo "File : $3";
               stat --printf="Access : %A\nSize(B) : %B\nOwner :%U\nModify : %y\n" "$4";
             fi;
          fi;
          #To Get user list
     elif [[ "$1" = "user" ]]; then
          if [[ "$2" = "list" ]]; then
             #To get sudo user list 
             if [[ "$3" = "--sudo-only" ]]; then
                getent group sudo;
                #To get all users list
             else
                getent passwd;
             fi;
             #To create a user
          elif [[ "$2" = "create" ]]; then
               sudo useradd "$3";
          fi;
     fi;
}
 

