import os
from requests import post

CH_HOST = os.getenv("CH_HOST", "0.0.0.0:8123")
if not "http" in CH_HOST:
    CH_HOST = "http://" + CH_HOST


def run_migrations(ch_host: str):
    for folder in ["migrations", "migrations_demo"]:
        print(f"Run {folder}:")
        for f in os.listdir(f"./{folder}"):
            print(f"-> Running {f}...")
            with open(f"./{folder}/" + f, "r") as file:
                query = file.read().strip()
            res = post(url=ch_host, data=query.encode())
            assert (
                res.status_code == 200
            ), f"Migration {folder}/{f} failed. Status: {res.status_code}, error message: {res.text}"
            print("-> Ok.")
        print(f"Finished {folder}.")


if __name__ == "__main__":
    run_migrations(ch_host=CH_HOST)
