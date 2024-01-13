help:
    just --list

clean:
    rm -rf target
    jbang cache clear

compile:
    jbang export portable -O target/jars/main.jar src/home/Main.java

run:
    jbang src/home/Main.java

exe: 
    jbang export native -O home src/home/Main.java
    
run_exe:
    ./home