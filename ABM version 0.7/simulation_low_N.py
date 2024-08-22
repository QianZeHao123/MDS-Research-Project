import pandas as pd
import mesa
from model import BassModel
import os
import shutil


"""
Simulation Low N
- N = 100
- p = 0.01
- q = 0.3
- Influencer proportion = 0.1
- Innovator proportion = 0.01
- network_type = "small_world", "random"
"""


results_low_n = mesa.batch_run(
    BassModel,
    parameters={
        "N": 50,
        "p": 0.03,
        "q": 0.5,
        "agent_proportion": [[0.02, 0.08, 0.1, 0.8]],
        "network_type": ["small_world", "random"],
    },
    iterations=1,
    max_steps=100,
    number_processes=1,
    data_collection_period=1,
    display_progress=True,
)

results_df_results_low_n = pd.DataFrame(results_low_n)
results_df_results_low_n.to_csv(
    './report/simulation_low_n.csv', index=False)
