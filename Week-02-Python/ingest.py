
import pandas as pd
import logging
import json
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent
RAW_DIR = BASE_DIR / "data" / "raw"
CLEAN_DIR = BASE_DIR / "data" / "cleaned"
LOG_DIR = BASE_DIR / "logs"

CLEAN_DIR.mkdir(parents=True, exist_ok=True)
LOG_DIR.mkdir(parents=True, exist_ok=True)

logging.basicConfig(
    filename=LOG_DIR / "ingestion.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    force=True
)


def ingest(input_path, output_path):

    try:
        logging.info("Ingestion started")

        # Read CSV
        df = pd.read_csv(input_path)
        logging.info("CSV file loaded")

        # Clean column names
        df.columns = (
            df.columns.str.strip()
            .str.lower()
            .str.replace(" ", "_")
        )

        # Remove duplicates
        df = df.drop_duplicates()

        # Remove rows without ID
        id_column = "id" if "id" in df.columns else "customer_id"
        df = df.dropna(subset=[id_column])

        # Fill missing values
        if "amount" in df.columns:
            df["amount"] = df["amount"].fillna(
                df["amount"].median()
            )

        # Convert data types
        df[id_column] = df[id_column].astype("int64")

        if "customer_id" in df.columns:
            df["customer_id"] = df["customer_id"].astype("int64")

        if "amount" in df.columns:
            df["amount"] = df["amount"].astype("float64")

            if (df["amount"] < 0).any():
                raise ValueError("Negative amounts found!")

        if "order_date" in df.columns:
            df["order_date"] = pd.to_datetime(
                df["order_date"], errors="raise"
            )

        # Save Parquet
        df.to_parquet(output_path, index=False)

        logging.info("Parquet file saved successfully")
        print("Completed:", output_path)
        print("Final shape:", df.shape)

        return df

    except FileNotFoundError:
        logging.exception("Input file not found")
        raise

    except Exception:
        logging.exception("Ingestion failed")
        raise


# Read configuration
with open(BASE_DIR / "config.json", "r") as file:
    config = json.load(file)

input_path = RAW_DIR / config["input"]
output_path = CLEAN_DIR / config["output"]

# Run ingestion
ingest(input_path, output_path)

# Bonus: Process customers dataset
ingest(
    RAW_DIR / "customers.csv",
    CLEAN_DIR / "customers_clean.parquet"
)

print("All ingestion tasks completed!")
