#!/bin/bash

bugID=$2
defects4jHome="$(realpath "$3")/"
failedTestCasesDir="$(realpath "./FailedTestCases")/"
knownBugPositionsFilePath="$(realpath "./BugPositions.txt")"

java -Xmx1g -cp "target/dependency/*" edu.lu.uni.serval.tbar.main.MainPerfectFL $bugDataPath $bugID $defects4jHome $failedTestCasesDir $knownBugPositionsFilePath
