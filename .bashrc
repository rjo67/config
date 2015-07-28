set -o vi

# $1  how many times we should go up in the directory hierarchy. Defaults to 3 if not specified.
up()
{
   cnt=$1
   if [ "x$1" == "x" ]; then
     cnt=3
   fi
   # want to only perform one 'cd', so that 'cd -' works
   str="."
   for (( c=1; c<=$cnt; c++ ))
   do
      str=$str"/.."
   done
   cd $str
}

################################
# aliases
#
################################
alias gs="git status"
alias up2="up 2"
alias up3="up 3"


export M2_HOME=/c/Users/rich/maven/apache-maven-3.2.5
export JAVA_HOME=/c/Program\ Files/Java/jdk1.8.0_11

export PATH=$M2_HOME/bin:$JAVA_HOME/bin:$PATH

export PATH=/c/Program\ Files\ \(x86\)/Vim/vim74:$PATH

[ -e ~/mycd.sh ] && . ~/mycd.sh

cd ~/git
