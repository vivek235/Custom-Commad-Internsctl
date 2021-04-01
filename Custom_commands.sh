#custom commands script#custom commands script
#Command Name Internsctl
# Command Version v0.1.0

internsctl(){
     if  [[ "$1" = "--help" ]]; then
          echo "Help of the Command Internsctl";
     elif [[ "$1" = "--version" ]]; then
          echo "Version v0.1.0";
     elif [[ "$2" = "getinfo" ]]; then
          if [[ "$1" = "cpu" ]]; then
             lscpu;
          elif [[ "$1" = "memory" ]]; then
             free;
          elif [[ "$1" = "file" ]]; then
             if [[ "$3" = "--size" ]]; then
                stat --printf="%B\n" "$4";
             elif [[ "$3" = "--permissions" ]]; then
                stat --printf="%A\n" "$4";
             elif [[ "$3" = "--owner" ]]; then
                stat --printf="%U\n" "$4";
             elif [[ "$3" = "--last-modified" ]]; then
                stat --printf="%y\n" "$4";
             else
               echo "File : $3";
               stat --printf="Access : %A\nSize(B) : %B\nOwner :%U\nModify : %y\n" "$4";
             fi;
          fi;
     elif [[ "$1" = "user" ]]; then
          if [[ "$2" = "list" ]]; then
             if [[ "$3" = "--sudo-only" ]]; then
                getent group sudo;
             else
                getent passwd;
             fi;
          elif [[ "$2" = "create" ]]; then
               sudo useradd "$3";
          fi;
     fi;
}
 

