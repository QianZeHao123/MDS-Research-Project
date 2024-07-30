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
Simulation 1: Change p and keep other parameters constant
- N = 1000
- q = 0.3
- Influencer proportion = 0.1
- Innovator proportion = 0.01
- network_type = "small_world"
"""


results_change_p = mesa.batch_run(
    BassModel,
    parameters={
        "N": 1000,
        "p": [0.01, 0.02, 0.03],
        "q": 0.3,
        "agent_proportion": [[0.001, 0.099, 0.009, 0.891]],
        "network_type": "small_world"
    },
    iterations=25,
    max_steps=100,
    number_processes=1,
    data_collection_period=1,
    display_progress=True,
)

results_df_results_change_p = pd.DataFrame(results_change_p)
results_df_results_change_p.to_csv(
    './report/simulation1.csv', index=False)
