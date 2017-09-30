export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/texlive/2012/bin/x86_64-darwin:/opt/local/libexec/perl5.12/sitebin/:$PATH
export EDITOR=vim
export LC_ALL=ru_RU.UTF-8


alias gdb='sudo /opt/local/bin/ggdb'
#alias ssh="perl $HOME/ssh.pl"
ssh-add ~/.ssh/id_rsa
#ssh-add ~/.ssh_github/id_rsa

if [ -n `which git` ]; then
#	git config --global diff.tool vimdiff
#	git config --global difftool.prompt false
#	git config --global alias.svndiff difftool
#	git config --global core.editor "vim"
	alias gitdiff="git svndiff --cached"
fi

defaults write com.apple.Terminal CopyAttributesProfile com.apple.Terminal.no-attributes

#source ~/.bash_aliases
alias screen='if [ $MYVIMRC ] ; then echo '1' > ~/is_there_vim; else echo '0' > ~/is_there_vim; fi && pwd > ~/screen_pwd && /usr/bin/screen -RDS'

function svngrep() {
	clear && echo && grep -E "$@" -r * | grep -v svn | grep -v debian | sed 's/:.*//g' | uniq
}
wdiff () {
	exec wdiff -n  -w $'\033[30;31m' -x $'\033[0m' -y $'\033[30;32m' -z $'\033[0m' $@ |less -R
}
alias vimstore='echo $(</dev/stdin) > ~/.vimstore'
alias reopen="perl /Users/olegts/work/open-tab-server/reopen-tabs.pl"
alias airport-bssid='/Users/olegts/work/airport-bssid/Build/Release/airport-bssid'
alias airport-scan='open /Applications/iStumbler.app'
alias n=sudo\ nice\ -n\ -20
alias decode_cpbitmap=~/decode_cpbitmap
alias ad-block=perl\ ~/ad-block.pl
alias open2=perl\ ~/open2.pl
alias check-grammar=perl\ ~/check-grammar.pl
alias jira=perl\ ~/jira-open.pl
alias graphite=perl\ ~/graphite-open.pl
alias non_formula_brackets=perl\ ~/non_formula_brackets.pl
alias vk=PERL5LIB=~/\ perl\ ~/vk-get.pl
alias rr=ranger
alias trashclean=sudo\ rm\ -rf\ /private/var/log/asl/*
#alias cd=.\ ~/cd.sh
#cd _RESTORE_
cd
#/Users/olegts/Documents/my-svn-space/users
alias mysql_start=cd\ /opt/local\;sudo\ /opt/local/lib/mysql5/bin/mysqld_safe\ start\;sudo\ /opt/local/lib/mysql5/bin/mysqld_safe\ \&
alias rotate=perl\ ~/rotate.pl
alias mysql=mysql5\ -uroot
alias random_spacing=perl\ ~/random_spacing.pl
alias rar=/usr/bin/rar/rar
alias sage=/Applications/SageMath/sage
alias g++w=g++\ -Wall\ -Wextra\ -Werror\ -pedantic\ -W\ -Weffc++\ -Wconversion
alias gccw=gcc\ -Wall\ -Wextra\ -Werror\ -pedantic\ -W\ -Weffc++\ -Wconversion
alias totex=perl\ ~/totex.pl
#alias umount=perl\ ~/umount.pl
alias pwf=perl\ ~/pwf.pl
alias cssh=/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX
alias switch-ssh=/usr/bin/perl\ ~/switch-ssh.pl
alias iphone=perl\ ~/iphone.pl
#config at /etc/cluster
alias test-server=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=root\ test-server
alias load-interface=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=root\ load-interface
alias production=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=root\ --y=1\ production
alias prodalerts=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=olegts\ --y=1\ prodalerts
alias nimbula=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=af\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=root\ nimbula
alias elvis=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=olegts\ elvis
alias openstack=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=af\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=root\ openstack
alias custom_stand=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=af\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=root\ custom_stand
alias black-hosts=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=olegts\ black-hosts
alias black-hosts-masters=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=olegts\ black-hosts-masters
alias bscollmx=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=olegts\ bscollmx
alias varutyun=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=olegts\ varutyun
alias olegts=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=olegts\ olegts
alias olegit=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=olegts\ olegit
alias precise_stand=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=olegts\ precise_stand
alias hdfs-yarn-test=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=olegts\ hdfs-yarn-test
alias load_stand=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=olegts\ load_stand
alias prestable_stand=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=olegts\ prestable_stand
alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport
#alias s=pmset\ displaysleepnow
alias exit_system=osascript\ -e\ \'tell\ app\ \"System\ Events\"\ to\ shut\ down\'
alias exit="
osascript -e ' \
	tell app \"Messages\" to quit' \
	&& echo 'Messages quited' \
	&& osascript -e 'tell app \"Mail\" to quit' \
	&& echo 'Mail quited' \
	&& osascript -e 'tell app \"Yandex\" to quit' \
	&& echo 'Yandex quited' \
	&& osascript -e 'tell app \"Tunnelblick\" to quit' \
	&& echo 'Tunnelblick quited' \
	&& networksetup -setairportpower en0 off \
	&& echo 'Wifi disabled' \
	&& osascript -e 'tell app \"System Events\" to shut down' \
	&& echo 'System Events quited' \
	&& kill -9 $(ps -p $PPID -o ppid=)
"

alias restart=kill\ -9\ \$\(ps\ -p\ \$PPID\ -o\ ppid\=\)\ \&\&\ open\ /Applications/Utilities/Terminal.app

#alias won='networksetup -setairportpower en0 on && if [ \$\@ ]; then osascript -e \'tell app "Tunnelblick" to connect "yandex"\'; f'
function won() {
	networksetup -setairportpower en0 on
	if [ $@ ]; then osascript -e 'tell app "Tunnelblick" to connect "yandex"'; fi
}

alias woff="osascript -e 'tell app \"Tunnelblick\" to disconnect \"yandex\"' && networksetup -setairportpower en0 off"

alias b2b_pre=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=af\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=root\ b2b_pre

alias b2b_test=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=af\&\&/usr/bin/perl\ /Users/olegts/Downloads/csshX-0.74/csshX\ --login=root\ b2b_test
alias clean=/usr/bin/perl\ ~/switch-ssh.pl\ --enable=my
alias exit_tunnel=osascript\ -e\ \'tell\ app\ \"Tunnelblick\"\ to\ quit\'
#sudo\ kill\ -9\ \$\(ps\ aux\ \|\ grep\ tunnel\ \|\ awk\ \'\{print\ \$2\;\}\'\)
alias pdflatex=perl\ ~/pdflatex.pl
export SVN_EDITOR=vim
##
# Your previous /Users/olegts/.profile file was backed up as /Users/olegts/.profile.macports-saved_2013-03-01_at_20:22:33
##

# MacPorts Installer addition on 2013-03-01_at_20:22:33: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


#ranger() {
#	    command ranger $@ &&
#		        cd "$(grep \^\' ~/.config/ranger/bookmarks | cut -b3-)"
#}

##
# Your previous /Users/olegts/.profile file was backed up as /Users/olegts/.profile.macports-saved_2014-10-26_at_21:27:52
##

# MacPorts Installer addition on 2014-10-26_at_21:27:52: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


#PS1='\h:\W \u \t$ '

stty start undef
alias svndiff="svn --diff-cmd=/Users/olegts/svnvimdiff diff"

if [ $STY ] ; then
	cd `cat ~/screen_pwd`
        stripped_ps=`echo $PS1 | cut -d'$' -f 1`
	additional_message="$STY"
	if [ `cat ~/is_there_vim` -eq "1" ]; then
		additional_message="$STY :: VIM"
	fi
        PS1="$stripped_ps [ $additional_message ] $ "
fi

complete -C "perl -e '@w=split(/ /,\$ENV{COMP_LINE},-1);\$w=pop(@w);for(qx(screen -ls)){print qq/\$1\n/ if (/^\s*\d+\.\$w/&&/\d+\.([\w\-\.]+)/)}'" screen

##
# Your previous /Users/olegts/.profile file was backed up as /Users/olegts/.profile.macports-saved_2016-04-30_at_21:43:33
##

# MacPorts Installer addition on 2016-04-30_at_21:43:33: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

function copy() {
	if [ $@ ]; then
		ssh $1 "rm -rf screenlog";
		echo "Start copying... (press enter)";
		read -e;
		ssh $1 "cat screenlog" | pbcopy;
		echo "Done copying";
	fi
}
