#! /bin/bash
echo "compiling java files"
rm -rf bin
mkdir bin
mkdir bin/java
shopt -s globstar
javac -verbose -d bin/java -s bin/java src/java/**/*.java
java -classpath ./deps/scala-compiler-2.10.0.jar:./deps/scala-libary-2.10.0.jar -Xbootclasspath/a:./deps/scala-library-2.10.0.jar:./deps/scala-compiler-2.10.0.jar:./deps/scala-reflect-2.10.0.jar scala.tools.nsc.Main -d bin/java -classpath ./lib/scala-compiler-2.10.0.jar:./lib/scala-swing-2.10.0.jar:./lib/scala-library-2.10.0.jar src/java/**/*.scala

echo "creating jars"
rm -rf lib
mkdir lib
jar cvfm ./lib/scalaws.jar src/MANIFEST.MF -C bin/java .

echo "copying dependencies"
cp deps/*.jar lib/

echo "signing jars"
jarsigner -keystore javakeys.jks -storepass tester ./lib/scalaws.jar localhost
jarsigner -keystore javakeys.jks -storepass tester ./lib/scala-compiler-2.10.0.jar localhost
jarsigner -keystore javakeys.jks -storepass tester ./lib/scala-library-2.10.0.jar localhost
jarsigner -keystore javakeys.jks -storepass tester ./lib/scala-swing-2.10.0.jar localhost

echo "testing jnlp post jar signing"
javaws scalaWebstart.jnlp