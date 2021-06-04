# Nextflow_Conditional_BuildDB

A Nextflow DSL2 workflow testing conditional database building

A script reproduces a bug with Nextflow 21.04.0 using `storeDir`. 

Expected behaviour.
BUILDDB should skip when all output files are present.

Actual behaviour.
BUILDDB skips when at least one output file is present.
