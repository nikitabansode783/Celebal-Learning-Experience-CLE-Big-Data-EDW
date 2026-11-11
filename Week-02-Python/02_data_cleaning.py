import pandas as pd
from pathlib import Path

# Locate project folders
BASE_DIR = Path(__file__).resolve().parent
RAW_DIR = BASE_DIR / "data" / "raw"
CLEAN_DIR = BASE_DIR / "data" / "cleaned"

CLEAN_DIR.mkdir(parents=True, exist_ok=True)

# 1. Read raw dataset
df = pd.read_csv(RAW_DIR / "orders.csv")

print("Original shape:", df.shape)

# 2. Clean column names
df.columns = (
    df.columns
    .str.strip()
    .str.lower()
    .str.replace(" ", "_")
)

# 3. Remove duplicate rows
df = df.drop_duplicates()

print("After removing duplicates:", df.shape)

# 4. Handle missing values
# Remove rows where order ID is missing
df = df.dropna(subset=["id"])

# Fill missing amounts with the median
df["amount"] = df["amount"].fillna(df["amount"].median())

print("\nMissing values after cleaning:")
print(df.isnull().sum())

# 5. Convert data types
df["id"] = df["id"].astype("int64")
df["customer_id"] = df["customer_id"].astype("int64")
df["amount"] = df["amount"].astype("float64")
df["order_date"] = pd.to_datetime(df["order_date"])

# 6. Validate order amounts
if (df["amount"] < 0).any():
    raise ValueError("Negative order amounts found!")

print("\nData validation successful!")

# 7. Save cleaned data as Parquet
output_path = CLEAN_DIR / "orders_clean.parquet"
df.to_parquet(output_path, index=False)

print("\nFinal shape:", df.shape)
print("Final data types:")
print(df.dtypes)

print("\nCleaned dataset saved at:", output_path)
