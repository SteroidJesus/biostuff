# biostuff
short scripts for sequence manipulations


adapter-cutter.sh
- basic bash/python script that batch-cuts adapters from illumina reads
- uses https://cutadapt.readthedocs.io/ https://doi.org/10.14806/ej.17.1.200

get.py
- downloads complete taxonomy of organism from given GI
- uses entrez from biopython https://biopython.org/docs/1.75/api/Bio.Entrez.html?highlight=entrez#module-Bio.Entrez

remove_duplicates.py
- removes duplicate lines from lists (for long excel taxa tables...)
