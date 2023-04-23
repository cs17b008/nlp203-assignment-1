#!/bin/bash
# Adapted from https://github.com/facebookresearch/MIXER/blob/master/prepareData.sh

echo 'Cloning Moses github repository (for tokenization scripts)...'
git clone https://github.com/moses-smt/mosesdecoder.git

echo 'Cloning Subword NMT repository (for BPE pre-processing)...'
git clone https://github.com/rsennrich/subword-nmt.git

SCRIPTS=mosesdecoder/scripts
TOKENIZER=$SCRIPTS/tokenizer/tokenizer.perl
CLEAN=$SCRIPTS/training/clean-corpus-n.perl
NORM_PUNC=$SCRIPTS/tokenizer/normalize-punctuation.perl
REM_NON_PRINT_CHAR=$SCRIPTS/tokenizer/remove-non-printing-char.perl
BPEROOT=subword-nmt/subword_nmt
BPE_TOKENS=40000


if [ ! -d "$SCRIPTS" ]; then
    echo "Please set SCRIPTS variable correctly to point to Moses scripts."
    exit
fi

src=fr
tgt=en
lang=fr-en
prep=data_fr_en
tmp=$prep/tmp
orig=orig

mkdir -p $orig $tmp $prep

cd $orig

# Define the URL and filename of the CSV file
URL="https://drive.google.com/file/d/1A0vYOz6edrVF0Gtlq62q61iUAhQQfhHH/view?usp=sharing/train.csv"
FILENAME="train.csv"

# Download the CSV file
if [ -f "$FILENAME" ]; then
  echo "$FILENAME already exists, skipping download"
else
  curl -O "$URL"
  if [ -f "$FILENAME" ]; then
    echo "$URL successfully downloaded."
  else
    echo "$URL not successfully downloaded."
    exit -1
  fi
fi

# Extract the contents of the CSV file
if [ ${FILENAME: -4} == ".csv" ]; then
  # Import the pandas library to read the CSV file
  import pandas as pd
  
  # Load the CSV file into a DataFrame
  df = pd.read_csv(FILENAME)
  
  # Print the first 10 rows of the DataFrame
  print(df.head(10))
else
  echo "File is not a CSV file"
fi
