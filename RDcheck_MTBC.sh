#!/bin/bash
# Script to check RD presence - based IDs from Warren et al., 2006
# Author: Zimpel et al., 2020 - Global Distribution and Evolution of Mycobacterium bovis Lineages

# Requirements
# bam files mapped against Mycobacterium tuberculosis H37Rv NC_000962.3
# samtools
# parallel

# usage
# bash RDcheck_MTBC.sh

# output = text files containing the mapping coverage from each RD and vcf files for the EU2 variant calling.

# Query and Subject files
# path to bam files
QUERY_FILE="*bam"
echo $QUERY_FILE

# RD calling
\ls $QUERY_FILE | parallel -N1 -j5 "samtools depth {} | awk '\$2 >= 4354800 && \$2 <= 4358300{a+=\$3;n++}END{print \"{.}\t\",a/n}'" > rd1.txt;
\ls   $QUERY_FILE | parallel -N1 -j5 "samtools depth {} | awk '\$2 >= 2330880 && \$2 <= 2332100{a+=\$3;n++}END{print \"{.}\t\",a/n}'" > rd9.txt;
\ls  $QUERY_FILE  | parallel -N1 -j5 "samtools depth {} | awk '\$2 >= 3485951 && \$2 <= 3486881{a+=\$3;n++}END{print \"{.}\t\",a/n}'" > rd12.txt;
\ls  $QUERY_FILE  | parallel -N1 -j5 "samtools depth {} | awk '\$2 >= 1696017 && \$2 <= 1708748{a+=\$3;n++}END{print \"{.}\t\",a/n}'" > rd4.txt;
\ls  $QUERY_FILE  | parallel -N1 -j5 "samtools depth {} | awk '\$2 >= 665042 && \$2 <= 668394{a+=\$3;n++}END{print \"{.}\t\",a/n}'" > Rdaf1.txt;
\ls  $QUERY_FILE  | parallel -N1 -j5 "samtools depth {} | awk '\$2 >= 680337 && \$2 <= 694429{a+=\$3;n++}END{print \"{.}\t\",a/n}'" > Rdaf2.txt;
\ls  $QUERY_FILE  | parallel -N1 -j5 "samtools depth {} | awk '\$2 >= 1768100 && \$2 <= 1768878{a+=\$3;n++}END{print \"{.}\t\",a/n}'" > RdEu1.txt;
for f in $QUERY_FILE ; do samtools mpileup  "$f" | grep "3813236" > eu2.vcf; done
