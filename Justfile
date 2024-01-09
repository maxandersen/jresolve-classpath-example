help:
    just --list

install:
    rm -rf modules
    jresolve --output-directory modules @deps

clean:
    rm -rf target

compile:
    rm -rf target/classes
    javac \
        -g \
        --source-path ./src/ \
        -d target/classes \
        --module-path modules \
        --add-modules ALL-MODULE-PATH \
        src/home/Main.java

    rm -rf target/jars

    jar \
      --create \
      --file target/jars/main.jar \
      --main-class home.Main \
      -C target/classes .

run:
    java \
      --class-path target/classes \
      --module-path modules \
      --add-modules ALL-MODULE-PATH \
      home.Main

exe:
    rm -rf home
    native-image \
        --class-path target/classes \
        --module-path modules \
        --add-modules ALL-MODULE-PATH \
        -H:+UnlockExperimentalVMOptions \
        -H:+ReportUnsupportedElementsAtRuntime \
        -jar target/jars/main.jar \
        home

exe2:
    rm -rf home
    native-image \
        --class-path target/classes \
        --module-path modules/jackson-core-2.16.1.jar \
        --add-modules ALL-MODULE-PATH \
        -H:+UnlockExperimentalVMOptions \
        -H:+ReportUnsupportedElementsAtRuntime \
        -jar target/jars/main.jar \
        home

run_exe:
    ./home