"""
Simulation 12: Change the proportion of innovators and proportion of influencers
- N = 1000
- p = 0.01
- q = 0.3
- Influencers proportion = 0.01, 0.02, 0.03, 0.04, 0.05
- Influencers proportion = 0.1, 0.2, 0.3, 0.4, 0.5
- network_type = "random"
"""

import numpy as np
import pandas as pd
import mesa
from model import BassModel
import multiprocessing
import os


def calculate_agent_prop(prop_inf, prop_inno):
    prop_inf, prop_inno = np.float64(prop_inf), np.float64(prop_inno)
    inf_inno = prop_inf * prop_inno
    inf_imit = prop_inf * (1 - prop_inno)
    noninf_inno = (1 - prop_inf) * prop_inno
    noninf_imit = (1 - prop_inf) * (1 - prop_inno)
    return [float(round(x, 3)) for x in [inf_inno, inf_imit, noninf_inno, noninf_imit]]


def run_simulation(prop_inf, prop_inno):
    agent_proportion = calculate_agent_prop(prop_inf, prop_inno)
    results = mesa.batch_run(
        BassModel,
        parameters={
            "N": 1000,
            "p": 0.01,
            "q": 0.3,
            "agent_proportion": [agent_proportion],
            "network_type": "random"
        },
        iterations=5,
        max_steps=100,
        number_processes=multiprocessing.cpu_count(),
        # number_processes=1,
        data_collection_period=1,
        display_progress=True,
    )

    results_df = pd.DataFrame(results)
    output_file = f'./report/simulation12_inf_{prop_inf}_inno_{prop_inno}.csv'
    results_df.to_csv(output_file, index=False)
    print(
        f"Simulation completed for influencer proportion = {prop_inf}, innovator proportion = {prop_inno}")
    return output_file


def combine_csv_files(file_list):
    dfs = [pd.read_csv(file) for file in file_list]
    combined_df = pd.concat(dfs, ignore_index=True)
    combined_df.to_csv('./report/simulation12.csv', index=False)
    print("Combined CSV file created.")


def cleanup_files(file_list):
    for file in file_list:
        os.remove(file)
        print(f"Deleted intermediate file: {file}")


if __name__ == '__main__':
    prop_inf_values = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6]
    prop_inno_values = [0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07]

    # Create the report directory if it doesn't exist
    os.makedirs('./report', exist_ok=True)

    # Run simulations for each influencer and innovator proportion combination
    output_files = []
    for prop_inf in prop_inf_values:
        for prop_inno in prop_inno_values:
            output_file = run_simulation(prop_inf, prop_inno)
            output_files.append(output_file)

    # Combine all CSV files
    combine_csv_files(output_files)

    # Cleanup intermediate files
    cleanup_files(output_files)
