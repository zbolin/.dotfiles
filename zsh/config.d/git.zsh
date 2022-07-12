alias example='f() { echo Your arg was $1. };f'
alias gen='f() { mvn archetype:generate -DgroupId=com.$1 -DartifactId=$1 -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false  };f'
alias clone='f() { git clone git@github.com:zbolin/$1.git };f'
alias clonebb='f() { git clone git@bitbucket.org:bozilla/$1.git };f'
alias clonebbb='f() { git clone git@bitbucket.org:bozilla/$1.git -b $2 };f'
alias mci="mvn clean install -q"
alias main='f () { mvn exec:java -Dexec.mainClass="com.bozilla.$1" };f'
