"""
Simulation 4: Keep the same proportion of influencers
- N = 1000
- p = 0.01
- q = 0.3
- Influencers proportion = 0.1
- network_type = "small_world"
"""

import pandas as pd
import mesa
from model import BassModel
import multiprocessing
import os


def run_simulation(agent_proportion):
    results = mesa.batch_run(
        BassModel,
        parameters={
            "N": 1000,
            "p": 0.01,
            "q": 0.3,
            "agent_proportion": [agent_proportion],
            "network_type": "small_world"
        },
        iterations=25,
        max_steps=100,
        number_processes=multiprocessing.cpu_count(),
        data_collection_period=1,
        display_progress=True,
    )

    results_df = pd.DataFrame(results)
    proportion_str = '_'.join(map(str, agent_proportion))
    output_file = f'./report/simulation4_proportion_{proportion_str}.csv'
    results_df.to_csv(output_file, index=False)
    print(f"Simulation completed for agent proportion: {agent_proportion}")
    return output_file


def combine_csv_files(file_list):
    dfs = [pd.read_csv(file) for file in file_list]
    combined_df = pd.concat(dfs, ignore_index=True)
    combined_df.to_csv('./report/simulation4.csv', index=False)
    print("Combined CSV file created.")


def cleanup_files(file_list):
    for file in file_list:
        os.remove(file)
        print(f"Deleted intermediate file: {file}")


if __name__ == '__main__':
    agent_proportions = [
        [0, 0.1, 0.009, 0.891],
        [0.003, 0.097, 0.009, 0.891],
        [0.005, 0.095, 0.009, 0.891],
        [0.007, 0.093, 0.009, 0.891],
        [0.01, 0.09, 0.009, 0.891]
    ]

    # Create the report directory if it doesn't exist
    os.makedirs('./report', exist_ok=True)

    # Run simulations for each agent proportion configuration
    output_files = []
    for proportion in agent_proportions:
        output_file = run_simulation(proportion)
        output_files.append(output_file)

    # Combine all CSV files
    combine_csv_files(output_files)

    # Cleanup intermediate files
    cleanup_files(output_files)
