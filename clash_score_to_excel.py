import os
import pandas as pd

# Directory containing .out files
input_dir = "C:/Users/darkh/Downloads/Compressed/test"

# Create empty lists to store clash score data and filenames
clash_scores = []
filenames = []

# Loop through .out files in the directory
for filename in os.listdir(input_dir):
    if filename.endswith(".out"):
        file_path = os.path.join(input_dir, filename)
        with open(file_path, "r") as file:
            lines = file.readlines()
            for line in lines:
                if "clashscore =" in line:
                    filenames.append(filename)
                    clash_scores.append(line.strip())
                elif "clashscore (B factor cutoff = 40) =" in line:
                    filenames.append(filename)
                    clash_scores.append(line.strip())

# Create a dictionary with filenames and clash scores
data = {"Filename": filenames, "Clash Score": clash_scores}

# Create a DataFrame from the dictionary
df = pd.DataFrame(data)

# Split the DataFrame based on the condition
df_clash_score = df[df["Clash Score"].str.startswith("clashscore =")]
df_clash_score_b_cutoff = df[df["Clash Score"].str.startswith("clashscore (B factor cutoff = 40)")]

# Create an Excel writer
output_excel = "C:/Users/darkh/Downloads/Compressed/test/file.xlsx"
with pd.ExcelWriter(output_excel) as writer:
    df_clash_score.to_excel(writer, sheet_name="Clash Score", index=False)
    df_clash_score_b_cutoff.to_excel(writer, sheet_name="Clash Score (B factor cutoff = 40)", index=False)

print(f"Data saved to {output_excel}")