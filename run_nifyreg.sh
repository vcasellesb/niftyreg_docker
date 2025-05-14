#!/bin/bash

set -o nounset

ref=$1
flo=$2

docker container run --rm \
    -v $(dirname $ref):/ref \
    -v $(dirname $flo):/flo vcasellesb/niftyreg \
    bash -c "reg_aladin -ref /ref/$(basename $ref) -flo /flo/$(basename $flo) -aff /flo/aff_trans.txt && \
    reg_resample -ref /ref/$(basename $ref) -flo /flo/$(basename $flo) -trans /flo/aff_trans.txt -res /flo/res.nii.gz"