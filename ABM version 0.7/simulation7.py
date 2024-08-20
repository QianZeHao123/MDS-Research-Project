"""
Simulation 7: Change p and keep other parameters constant
- N = 1000
- q = 0.3
- Influencer proportion = 0.1
- Innovator proportion = 0.01
- network_type = "random"
"""


import pandas as pd
import mesa
from model import BassModel
import multiprocessing
import os


def run_simulation(p_value):
    results = mesa.batch_run(
        BassModel,
        parameters={
            "N": 1000,
            "p": p_value,
            "q": 0.3,
            "agent_proportion": [[0.001, 0.099, 0.009, 0.891]],
            "network_type": "random"
        },
        iterations=25,
        max_steps=100,
        number_processes=multiprocessing.cpu_count(),
        data_collection_period=1,
        display_progress=True,
    )

    results_df = pd.DataFrame(results)
    output_file = f'./report/simulation7_p_{p_value}.csv'
    results_df.to_csv(output_file, index=False)
    print(f"Simulation completed for p = {p_value}")
    return output_file


def combine_csv_files(file_list):
    dfs = [pd.read_csv(file) for file in file_list]
    combined_df = pd.concat(dfs, ignore_index=True)
    combined_df.to_csv('./report/simulation7.csv', index=False)
    print("Combined CSV file created.")


def cleanup_files(file_list):
    for file in file_list:
        os.remove(file)
        print(f"Deleted intermediate file: {file}")


if __name__ == '__main__':
    p_values = [0.01, 0.015, 0.02, 0.025, 0.03]

    # Create the report directory if it doesn't exist
    os.makedirs('./report', exist_ok=True)

    # Run simulations for each p value
    output_files = []
    for p in p_values:
        output_file = run_simulation(p)
        output_files.append(output_file)

    # Combine all CSV files
    combine_csv_files(output_files)
    # Cleanup intermediate files
    cleanup_files(output_files)
