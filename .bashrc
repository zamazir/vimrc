# Configure module environment
case "$0" in
          -sh|sh|*/sh)	modules_shell=sh ;;
       -ksh|ksh|*/ksh)	modules_shell=ksh ;;
       -zsh|zsh|*/zsh)	modules_shell=zsh ;;
    -bash|bash|*/bash)	modules_shell=bash ;;
esac
#module() { eval `/usr/Modules/$MODULE_VERSION/bin/modulecmd $modules_shell $*`; }
module() { eval `/usr/bin/modulecmd $modules_shell $*`; }

#spell-checker for paths
shopt -s cdspell
shopt -s nocaseglob #case-insensitive file and path searching

#setting bash history to length 10000
HISTSIZE=10000
HISTFILESIZE=10000

#make virtualenvwrapper work properly
export WORKON_HOME=$HOME/venv-python
source /usr/local/bin/virtualenvwrapper.sh

# Add custom library locations to python path
# dd - Read ASDEX shotfiles conveniently
export PYTHONPATH=$PYTHONPATH:/afs/ipp/u/zamaz/Documents/Masters/Python/lib/pyddww

#command aliases
# open rc files quickly and source them right after
alias bashrc='vim ~/.bashrc && source ~/.bashrc'
alias vimrc='vim ~/.vimrc && source ~/.bashrc'

alias open='gnome-open'
alias rmf='rm -r'
alias del='rmtrash'
alias deldir='rmdirtrash'

###### MOUNT MOVEII FTP FOLDER ########
alias mntmove='sshfs amazigh.zerzour@warr.de:/ ~/MoveII-FTP; cd /home/amazigh/MoveII-FTP/15_Satellitentechnik/09\ Team\ Workspace/THM\ -\ Thermal\ Analysis\ and\ Design'
alias umntmove='fusermount -u ~/MoveII-FTP'

# list installed packages
alias apt-ls='dpkg --get-selections | grep -v deinstall'

# cd to virtual python environments
alias pyenvs='cd ~/Documents/pythonvenvs/'
# Activate masters python environment
alias pyenv_masters='source ~/Documents/pythonvenvs/masters/bin/activate'
# Copy temperature log file from beagle bone
alias scptemplog='scp root@192.168.7.2:/usr/local/lib/PyBBIO/examples/templog.txt'
# Connect to IPP server
alias ippconnect='ssh -Xtt zamaz@gate.rzg.mpg.de "ssh toks03.bc"'
# Connect to AUG server
alias augconnect='ssh -Xtt zamaz@gate1.aug.ipp.mpg.de "kinit && ssh sxaug35"'
# Connect to BeagleBone
alias bbc='sudo bash ~/Documents/scripts/connectBeaglebone.sh'
# Update system and programs
alias update='sudo bash ~/Documents/scripts/update.sh'
# Display files and folders in a detailed list by standard
alias ls='ls -l --color'
# cd to MoveII OneDrive directory
alias cdmoveii='cd ~/OneDrive/Uni/Move'
# cd to master's AFS directory
alias cdmasters='cd /afs/ipp/u/zamaz/Documents/Masters/'
# Start working environment for master's thesis
alias masters='get_token && mate-terminal --working-directory "/afs/ipp/u/zamaz/Documents/Masters/" && mate-terminal -x bash -c "ssh -Xtt zamaz@gate1.aug.ipp.mpg.de \"kinit && ssh sxaug35\";bash" && mate-terminal -x /usr/share/tagspaces/tagspaces && ganttproject && thunderbird'
# Get kerberos token
alias get_token="kinit zamaz && aklog -noprdb"
# Start Evernote
alias evernote="wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Evernote/Evernote/Evernote.exe </dev/null &>/dev/null &"

#copy file from IPP server to local directory
function ippscp(){
    if (( $# != 2 ))
    then
	echo "Usage: ippscp 'path_to_file_on_remote_server' path_to_local_dir"
	echo "Note: Quotation marks only necessary if ~/ or similar shorcuts are used in path_to_file_on_remote_server"
    else
        ssh -X zamaz@gate.rzg.mpg.de "ssh toks03.bc \"cat $1\"" > $2
    fi
}

# Change cd to check if entering a mount directory. If so, mount remote folder automatically
#function cd(){ builtin cd "$@" && chpwd; }
#function chpwd(){
#	# If entered, mount
#	if [[ $PWD == '/home/amazigh/MoveII-FTP' ]]
#	then
#		if [[ -z ${MOVEII_MOUNTED+x} || $MOVEII_MOUNTED != 1 ]]
#		then
#			echo 'Entered SFTP directory. Remote directory not mounted yet.'
#			source /home/amazigh/Documents/scripts/mountMoveIIsftp.sh
#			# Refresh view (otherwise ls won't show anything)
#			cd .
#		fi
#	fi
#}

# Unmount MoveII remote directory
#function umsftp(){
#	if (( $# != 1 ))
#	then
#		echo "Usage: umstfp [Name of SFTP project]"
#	fi
#
#	SFTP_PATH=""
#	if [[ $1 == "MoveII" ]]
#	then
#		SFTP_PATH="/home/amazigh/MoveII-FTP"
#		MARKER="MOVEII_MOUNTED"
#	fi
#	
#	if ! [[ $SFTP_PATH == "" ]]
#	then
#		fusermount -u $SFTP_PATH
#		MOVEII_MOUNTED=0
#		#declare $MARKER=0
#		export MOVEII_MOUNTED
#	else
#		echo "The given argument is not associated with a path to be unmounted."
#	fi
#}

# Change ls colors
# LS_COLORS=$LS_COLORS:'di=1;32:' ; export LS_COLORS
