#!/bin/bash

USAGE=$(cat << 'EOF'
Usage: ./PerfectFLTBarRunner.sh <bugDataPath> <bugID> <defects4jHome>

Positional arguments:
  <bugDataPath>       The path to the directory containing the bug data. (e.g. "D4J/projects/")
  <bugID>             The ID of the bug to be analyzed. (e.g. "Lang_10")
  <defects4jHome>     The path to the Defects4J installation. (e.g. "~/defects4j/")
EOF
)

if [ "$#" -ne 3 ]; then
    printf "%s\n" "$USAGE"
    exit 1
fi

bugDataPath="$(realpath "$1")/"
bugID=$2
defects4jHome="$(realpath "$3")/"
failedTestCasesDir="$(realpath "./FailedTestCases")/"
knownBugPositionsFilePath="$(realpath "./BugPositions.txt")"

java -Xmx1g -cp "target/dependency/*" edu.lu.uni.serval.tbar.main.MainPerfectFL "${bugDataPath}" "${bugID}" "${defects4jHome}" "${failedTestCasesDir}" "${knownBugPositionsFilePath}"
