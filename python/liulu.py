from pathlib import Path

import pandas as pd

this_dir = Path(__file__).resolve().parent

csv_name = 'liulu_data.csv'
csv_path = this_dir / csv_name

df = pd.read_csv(csv_path, header=None, encoding='utf-8', skiprows=1)
df = df.apply(pd.to_numeric, errors='coerce')
df_dropped = df.drop(df.columns[1], axis=1)
df_dropped = df_dropped.dropna()
print(df_dropped.head())

# print(df_dropped.iloc[0, 0] + 1)

dataset_shuffled = df_dropped.sample(frac=1, random_state=42).reset_index(drop=True)
split_idx = int(len(dataset_shuffled) * 0.8)
train_dataset = dataset_shuffled.iloc[:split_idx]
valid_dataset = dataset_shuffled.iloc[split_idx:]
train_dataset.to_csv(this_dir / 'liulu_train.csv', index=False, encoding='utf-8')
valid_dataset.to_csv(this_dir / 'liulu_valid.csv', index=False, encoding='utf-8')