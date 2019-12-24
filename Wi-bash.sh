# !/bin/bash

# Setup

adaptor='WIFI ADAPTOR'
path='~/PATH TO SCRIPT'

# Starting the wifi sniffer
clear
bold=$(tput bold)
normal=$(tput sgr0)

echo '
   ____ __              __   _           
  / __// /_ ___ _ ____ / /_ (_)___  ___ _
 _\ \ / __// _ `// __// __// // _ \/ _ `/
/___/ \__/ \_,_//_/   \__//_//_//_/\_, / 
              _  ___ ___          /___/  
  ___  ___   (_)/ _// _/___  ____        
 (_-< / _ \ / // _// _// -_)/ __/        
/___//_//_//_//_/ /_/  \__//_/                                             

'

sleep 1s
echo ${bold}Starting wifi card in monitor mode ${normal}
sleep 1s
sudo airmon-ng start $adaptor
wait
# Nameing the output file
echo ${bold}Name for the output file ${normal}
read output

tmux new-session -d
wait
# Sending command to the script
# Remove the "-l" to run in quiet mode
tmux send-keys -t 0 "sudo python "$path" -i "$adaptor"mon -o " $output".csv  -l" C-m
clear

echo '
  _____             __           _ _______          
 / ___/__  ___  ___/ / ___ ___  (_) _/ _(_)__  ___ _
/ (_ / _ \/ _ \/ _  / (_-</ _ \/ / _/ _/ / _ \/ _ `/
\___/\___/\___/\_,_/ /___/_//_/_/_//_//_/_//_/\_, / 
                 \ \                         /___/  
     //\/         \ \  ___      _/|                 
                   \ \/-_-\    > _<                 
            /\//    \_\___/  __|/__   /\//  /\//    
           //\/       / /___/ _/  /  //\/  //\/     
     /\//            / /___/ / / /\//\//            
    //\/   /\//\//  / /   / /_/ //\//\/             
          //\//\/  /_/_  /__/__/|                   
                 _/_/\ \     > _<                   
               _/_/   \ \    |/                     
              /_/      \_\                          

'
echo ${bold}Your file is stored at $path/data/$output${normal}
sleep 5s
tmux attach
wait