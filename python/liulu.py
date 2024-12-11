from pathlib import Path

import pandas as pd

this_dir = Path(__file__).resolve().parent

csv_name = 'liulu_data.csv'
csv_path = this_dir / csv_name

df = pd.read_csv(csv_path, header=0)
print(df.head().iloc[:, 2:5])

dataset_shuffled = df.sample(frac=1, random_state=42).reset_index(drop=True)
split_idx = int(len(dataset_shuffled) * 0.8)
train_dataset = dataset_shuffled.iloc[:split_idx]
valid_dataset = dataset_shuffled.iloc[split_idx:]
train_dataset.to_csv(this_dir / 'liulu_train.csv', index=False)
valid_dataset.to_csv(this_dir / 'liulu_valid.csv', index=False)