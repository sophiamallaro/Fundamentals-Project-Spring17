#!/bin/bash

#echo $1 >> ../downloads/FFmerged.vcf
#echo $2 >> ../downloads/FFmerged.vcf
#echo $3 >> ../downloads/FFmerged.vcf
#echo $4 >> ../downloads/FFmerged.vcf

# FAMILY=FamilyA
# COUSIN_FEM_A=TA-A
# BROTHER_A=RP-A
# SISTER_U=PF-A
# SCRIPTPATH=~/pipeline

COMMONSETTING=$1

#next three variables are arrays
CUSTOMSETTING=(${2//^/ })

MEMBERS=(${3//^/ })

FILENAMES=(${4//^/ })

MERGESTRING="../uploads/"
MERGESTRING+=${4//^/.gz ../uploads/}
MERGESTRING+=".gz" 

for i in "${FILENAMES[@]}"
do
	bgzip ../uploads/$i
	tabix -p vcf ../uploads/$i.gz
done

echo $MERGESTRING

vcf-merge $MERGESTRING > ../uploads/merged.vcf

#get sample names

SAMPLENAMES=$(grep -i 'CHROM' ../uploads/merged.vcf | sed -n -e 's/^.*FORMAT//p')
SAMPLEARRAY=(${SAMPLENAMES//	/ })

for x in 0 1 2
do
        if [ "${MEMBERS[$x]}" == "mother" ]; then
                MOTHER=${SAMPLEARRAY[$x]}
        elif [ "${MEMBERS[$x]}" == "father" ]; then
                FATHER=${SAMPLEARRAY[$x]}
        elif [ "${MEMBERS[$x]}"  == "child" ]; then
                CHILD=${SAMPLEARRAY[$x]}
        fi
done

for x in 0 1 2
do 
	echo "${MEMBERS[$x]}"
	echo "${SAMPLEARRAY[$x]}"
done

#set this logic

PERLSTRING="--matches"

if [ "$COMMONSETTING" == "Mother-Father-Child" ]; then
	PERLSTRING+=" --filter \"WTaffected=$CHILD,-1,0\" --filter \"Supported_M=$CHILD,1;$MOTHER,1,2;$FATHER,-1,0\" --filter \"HomHyp=$CHILD,2;$MOTHER,-1,1;$FATHER,-1,1;*1,1\" --filter \"Supported_P=$CHILD,1;$FATHER,1,2;$MOTHER,-1,0\" --filter \"Recessive_HomHyp=$CHILD,2;$MOTHER,-1,1,2;$FATHER,-1,1,2;*1,1\" --filter \"Recessive_HomHyp=$CHILD,2;$MOTHER,-1,1,2;$FATHER,-1,1,2;*2,2\""
	
elif [ "$COMMONSETTING" == "Father-Child" ]; then
	PERLSTRING+=" --filter \"WTaffected=$CHILD,-1,0\" --filter \"HomHyp=$CHILD,2;$FATHER,1\" --filter \"Supported_P=$CHILD,1;$FATHER,1,2\" --filter \"Recessive_HomHyp=$CHILD,2;$FATHER,2\""

elif [ "$COMMONSETTING" == "Mother-Child" ]; then
	PERLSTRING+=" --filter \"WTaffected=$CHILD,-1,0\" --filter \"HomHyp=$CHILD,2;$MOTHER,1\" --filter \"Supported_M=$CHILD,1;$MOTHER,1,2\" --filter \"Recessive_HomHyp=$CHILD,2;$MOTHER,2\""

else
	echo Nothing Done	
fi

echo $PERLSTRING

EXECUTESTRING="cat ../uploads/merged.vcf | perl /usr/local/bin/vcf-family-filter-4 $PERLSTRING > ../uploads/taggedFFmerged.vcf"

eval $EXECUTESTRING

#remove untagged entries

FILTERSTRING='#|CHROM|HomHyp|Supported_P|Supported_M|Recessive_HomHyp'

egrep -w $FILTERSTRING ../uploads/taggedFFmerged.vcf > ../downloads/FFmerged.vcf

#cat  merged.vcf | perl ~/vcftools/vcftools-vcftools-4491144/src/perl/vcf-family-filter-4 --matches \
# --filter "WTaffected=$COUSIN_FEM_A,-1,0" \
# --filter "WTaffected=$BROTHER_A,-1,0" \
# --filter "WTaffected=$SISTER_U,-1,0" \
# > v3.$FAMILY.FamilyFiltered.vcf

# cp v3.$FAMILY.FamilyFiltered.vcf /Shared/CLCG/jtessmann/FamilyFilteringResults/$FAMILY/revision3
# cp V3.family_filtering.job /Shared/CLCG/jtessmann/FamilyFilteringResults/$FAMILY/revision3


# cat  indel.PF_TA_RP_merged.vcf | perl ~/vcftools/vcftools-vcftools-4491144/src/perl/vcf-family-filter-4 --matches \
# --filter "WTaffected=$COUSIN_FEM_A,-1,0" \
# --filter "WTaffected=$BROTHER_A,-1,0" \
# --filter "WTaffected=$SISTER_U,-1,0" \
# > v3.indel.$FAMILY.FamilyFiltered.vcf

# cp v3.indel.$FAMILY.FamilyFiltered.vcf /Shared/CLCG/jtessmann/FamilyFilteringResults/$FAMILY/revision3

# ##family filtering steps. if a family of siblings, then ignore egrep and just copy

# ##egrep -w '#|CHROM|HomHyp|Supported_P|Supported_M|Recessive_HomHyp' /Shared/CLCG/jtessmann/FamilyFilteringResults/$FAMILY/revision3/v3.$FAMILY.FamilyFiltered.vcf > $SCRIPTPATH/v3.FF.$FAMILY.vcf

# ##egrep -w '#|CHROM|HomHyp|Supported_P|Supported_M|Recessive_HomHyp' /Shared/CLCG/jtessmann/FamilyFilteringResults/$FAMILY/revision3/v3.indel.$FAMILY.FamilyFiltered.vcf > $SCRIPTPATH/v3.indel.FF.$FAMILY.vcf

