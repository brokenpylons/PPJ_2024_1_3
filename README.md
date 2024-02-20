# AutoGrade

## Constraints

For each language there is a project folder ```./language``` and one workflow file ```language.yml```.
The workflow file is constrained to itself and the project folder:
```
paths:
    - ".github/workflows/language.yml"
    - "language/**"
```
The working directory for each language is ```./language```:
```
defaults:
  run:
    working-directory: ./language
```

The project folder must contain a script ```./language/run.sh```.
The scripts accepts the input file as the only argument and returns the result on the standard output.
There is a script ```./test.sh``` which executes the ```./language/run.sh input``` and reports the results.
The exit status ```0``` indicates all tests have passed, and the exit status ```n``` indicates ```n``` of the tests have failed.
