import pandas as pd
import mesa
from model import BassModel
import multiprocessing
from concurrent.futures import ProcessPoolExecutor
import os


"""
Simulation 1: Change p and keep other parameters constant
- N = 1000
- q = 0.3
- Influencer proportion = 0.1
- Innovator proportion = 0.01
- network_type = "small_world"
"""


if __name__ == '__main__':

    results_change_p = mesa.batch_run(
        BassModel,
        parameters={
            "N": 1000,
            "p": [0.01, 0.015, 0.02, 0.025, 0.03],
            "q": 0.3,
            "agent_proportion": [[0.001, 0.099, 0.009, 0.891]],
            "network_type": "small_world"
        },
        iterations=25,
        max_steps=100,
        number_processes=multiprocessing.cpu_count(),
        data_collection_period=1,
        display_progress=True,
    )

    results_df_results_change_p = pd.DataFrame(results_change_p)
    results_df_results_change_p.to_csv(
        './report/simulation1.csv', index=False)


# def run_batch(p_value):
#     batch_params = {
#         "N": 1000,
#         "p": p_value,
#         "q": 0.3,
#         "agent_proportion": [[0.001, 0.099, 0.009, 0.891]],
#         "network_type": "small_world"
#     }

#     results = mesa.batch_run(
#         BassModel,
#         parameters=batch_params,
#         iterations=25,
#         max_steps=100,
#         number_processes=1,  # use 1 process as we are parallelizing externally
#         data_collection_period=1,
#         display_progress=True,
#     )

#     df = pd.DataFrame(results)
#     filename = f'./report/simulation1_p_{p_value}.csv'
#     df.to_csv(filename, index=False)
#     return filename


# def merge_csv_files(file_list, output_file):
#     dfs = []
#     for file in file_list:
#         df = pd.read_csv(file)
#         dfs.append(df)

#     merged_df = pd.concat(dfs, ignore_index=True)
#     merged_df.to_csv(output_file, index=False)
#     print(f"Merged file saved as {output_file}")


# if __name__ == '__main__':
#     p_values = [0.01, 0.015, 0.02, 0.025, 0.03]

#     # make sure the output directory exists
#     os.makedirs('./report', exist_ok=True)

#     # parallel run batch
#     with ProcessPoolExecutor(max_workers=multiprocessing.cpu_count()) as executor:
#         csv_files = list(executor.map(run_batch, p_values))

#     # merge CSV files
#     merge_csv_files(csv_files, './report/simulation1.csv')

#     # delete intermediate files
#     for file in csv_files:
#         os.remove(file)
#     print("Intermediate files removed.")
