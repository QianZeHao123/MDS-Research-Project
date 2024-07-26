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


results = mesa.batch_run(
    BassModel,
    parameters={
        "N": 1000,
        "p": 0.01,
        "q": 0.3,
        "agent_proportion": [[0.001, 0.009, 0.19, 0.8]],
        "network_type": "small_world"
    },
    iterations=1,
    max_steps=100,
    number_processes=1,
    data_collection_period=1,
    display_progress=True,
)

results_df = pd.DataFrame(results)
results_df.to_csv('./report/model5results.csv', index=False)
