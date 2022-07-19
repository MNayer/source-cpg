# Create CPGs from C/C++ source file

## Setup
```bash
./build.sh
```

## Create CPGs
Structure of input directory:
```
<input director>
|-- file_a.c
|-- file_b.cpp
`-- subdir
| |-- file_c.cpp
| `-- file_d.c
|-- file_f.cpp
|-- ..
`-- file_xxx.c
```
```bash
./run.sh <input directory> <output directory (empty)> <output_filename>
```
Structure of output directory (once the CPGs have been created):
```
<output director>
`-- <output_filename (as jsonl-Format)>
```
The output file contains one json-encoded function per line. Each function
contains the attributes:
- filename - file path
- start - line number of function's first line
- end - line number of function's last line
- cpg - dot of function's cpg
