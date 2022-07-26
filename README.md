# Create CPGs from C/C++ source file

## Setup
```bash
./build.sh
```

## Create CPGs
Structure of input directory:
```
<input director>
|-- 1.c
|-- 2.cpp
|-- 3.c
|-- ..
`-- n.c
```
Each c/cpp file must only contain exactly one function.
Create CPGs for each input file:
```bash
./run.sh <input directory> <output directory (empty)>
```
Structure of output directory (once the CPGs have been created):
```
<output director>
|-- 1.dot
|-- 2.dot
|-- 3.dot
|-- ..
`-- n.dot
```
