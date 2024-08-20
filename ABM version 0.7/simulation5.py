"""
Simulation 5: Change the proportion of innovators and p
- N = 1000
- p = 0.01, 0.015, 0.02, 0.025, 0.03
- q = 0.3
- Influencers proportion = 0.01, 0.02, 0.03, 0.04, 0.05
- Influencers proportion = 0.1
- network_type = "small_world"
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


def run_simulation(p_value, agent_proportion):
    results = mesa.batch_run(
        BassModel,
        parameters={
            "N": 1000,
            "p": p_value,
            "q": 0.3,
            "agent_proportion": [agent_proportion],
            "network_type": "small_world"
        },
        iterations=5,
        max_steps=100,
        number_processes=multiprocessing.cpu_count(),
        data_collection_period=1,
        display_progress=True,
    )

    results_df = pd.DataFrame(results)
    proportion_str = '_'.join(map(str, agent_proportion))
    output_file = f'./report/simulation5_p_{p_value}_proportion_{proportion_str}.csv'
    results_df.to_csv(output_file, index=False)
    print(
        f"Simulation completed for p = {p_value}, agent proportion: {agent_proportion}")
    return output_file


def combine_csv_files(file_list):
    dfs = [pd.read_csv(file) for file in file_list]
    combined_df = pd.concat(dfs, ignore_index=True)
    combined_df.to_csv('./report/simulation5.csv', index=False)
    print("Combined CSV file created.")


def cleanup_files(file_list):
    for file in file_list:
        os.remove(file)
        print(f"Deleted intermediate file: {file}")


if __name__ == '__main__':
    p_values = [0.01, 0.015, 0.02, 0.025, 0.03, 0.035, 0.04]
    prop_inf_values = [0.1]
    prop_inno_values = [0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07]

    # Create the report directory if it doesn't exist
    os.makedirs('./report', exist_ok=True)

    # Generate all agent proportion combinations
    agent_proportions = [
        calculate_agent_prop(prop_inf, prop_inno)
        for prop_inf in prop_inf_values
        for prop_inno in prop_inno_values
    ]

    # Run simulations for each p value and agent proportion configuration
    output_files = []
    for p in p_values:
        for proportion in agent_proportions:
            output_file = run_simulation(p, proportion)
            output_files.append(output_file)

    # Combine all CSV files
    combine_csv_files(output_files)

    # Cleanup intermediate files
    cleanup_files(output_files)
