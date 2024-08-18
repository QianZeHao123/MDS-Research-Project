import pandas as pd
import mesa
from model import BassModel
import os
import shutil


# --------------------------------------------
# Create report directory
report_dir = './report'
if os.path.exists(report_dir):
    shutil.rmtree(report_dir)
os.makedirs(report_dir)


"""
Simulation 0: Test if the agents have the same number of conntections of two kinds of networks.
- N = 1000
- p = 0.01
- q = 0.3
- Influencer proportion = 0.1
- Innovator proportion = 0.01
- network_type = "small_world", "random"
"""


results_neighbor_count = mesa.batch_run(
    BassModel,
    parameters={
        "N": 1000,
        "p": 0.01,
        "q": 0.3,
        "agent_proportion": [[0.001, 0.099, 0.009, 0.891]],
        "network_type": ["small_world", "random"],
    },
    iterations=10,
    max_steps=100,
    number_processes=1,
    data_collection_period=1,
    display_progress=True,
)

results_df_results_neighbor_count = pd.DataFrame(results_neighbor_count)
results_df_results_neighbor_count.to_csv(
    './report/simulation0.csv', index=False)
