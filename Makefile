.PHONY: all clean

all: clean update-dependency

compile:
	mvn package

update-dependency: compile
	mv target/TBar-0.0.1-SNAPSHOT.jar target/dependency/

clean:
	rm -fr target/classes/ target/maven-archiver/ target/maven-status/
