#!/usr/bin/env bash

# Create the target directory if it doesn't exist
mkdir -p data/model_loss

# Define the models and their corresponding loss values
# We use a string to represent the list of losses for each model
declare -A models
models["MLP"]="0.0035 0.0033 0.0032 0.0032 0.0031"
models["CNN"]="0.0042 0.0039 0.0036 0.0034 0.0033"
models["BiLSTM"]="0.0057 0.0046 0.0041 0.0036 0.0033"
models["SelfAttention"]="0.0100 0.0071 0.0059 0.0052 0.0048"
models["FusionNet"]="0.0134 0.0066 0.0048 0.0040 0.0035"

# Iterate through each model
for model in "${!models[@]}"; do
    file_path="data/model_loss/${model}.dat"
    
    # Clear the file if it exists
    > "$file_path"
    
    # Split the loss string into an array and write to file with 1-based indexing
    epoch=1
    for loss in ${models[$model]}; do
        echo "$epoch $loss" >> "$file_path"
        ((epoch++))
    done
    
    echo "Created $file_path"
done
