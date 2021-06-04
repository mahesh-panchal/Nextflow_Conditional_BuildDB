#! /usr/bin/env nextflow

nextflow.enable.dsl=2

params.dbfile = './db/database/database.txt'

def database = file(params.dbfile)

workflow {

	CHECKDB(file('./somefile.txt'),database)
}

workflow CHECKDB {

	take:
		query
		databasedb

	main:
		BUILDDB(databasedb)
		QUERYDB(query,BUILDDB.out.db).view()
}

process BUILDDB {

	storeDir './db/database'

	input:
	path dbfile 

	output:
	path "${prefix}.{txt,tnt,ttt,tzt}", includeInputs:true, emit: db

	script:
	prefix = dbfile.baseName  // cannot use `def` or cannot be seen in output block
	"""
	touch $prefix.{tnt,ttt,tzt}
	"""
}

process QUERYDB {

	input:
	path query
	path database

	output:
	stdout()
	
	script:
	"""
	ls -l
	file *
	"""
}

