
import logging
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent
LOG_DIR = BASE_DIR / "logs"
LOG_DIR.mkdir(exist_ok=True)

logging.basicConfig(
    filename=LOG_DIR / "ingestion.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

try:
    logging.info("Data ingestion started")

    with open(BASE_DIR / "config.json", "r") as file:
        print(file.read())

    logging.info("Configuration file read successfully")

except FileNotFoundError:
    logging.error("Configuration file not found")

except Exception:
    logging.exception("Unexpected error occurred")

finally:
    logging.info("Data ingestion process finished")
    print("Logging practical completed!")
