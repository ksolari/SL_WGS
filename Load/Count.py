import os

def count_matches_in_file(filepath):
    count = 0
    with open(filepath, 'r') as file:
        for line in file:
            columns = line.strip().split('\t')
            if len(columns) >= 10:
                col8 = columns[7]
                col10 = columns[9]
                if "|HIGH|" in col8 and col10.startswith(("0|0", "0/0", "1|1", "1/1")):
                    count += 1
    return count

def count_in_all_txt_files(folder_path):
    total = 0
    print(f"\nScanning folder: {folder_path}\n")
    for filename in os.listdir(folder_path):
        if filename.endswith('.txt'):
            filepath = os.path.join(folder_path, filename)
            match_count = count_matches_in_file(filepath)
            print(f"{filename}: {match_count} matching lines")
            total += match_count
    print(f"\nTotal matching lines across all files: {total}")

#   Set your folder path here:
folder_path = "Derived_vcf_perInd_OriginalANN_allSpecies"  # ← Replace this with the actual path
count_in_all_txt_files(folder_path)
