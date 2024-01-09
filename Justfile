help:
    just --list

install:
    rm -rf modules
    jresolve --output-directory modules @deps

compile:
    javac \
        -g \
        --source-path ./src/ \
        -d target/classes \
        --module-path modules \
        --add-modules ALL-MODULE-PATH \
        src/home/Main.java

run:
    java \
      --class-path target/classes \
      --module-path modules \
      --add-modules ALL-MODULE-PATH \
      home.Main