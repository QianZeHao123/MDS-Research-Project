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


# --------------------------------------------
# Create report directory
pic_dir = './picture'
if os.path.exists(pic_dir):
    shutil.rmtree(pic_dir)
os.makedirs(pic_dir)


# --------------------------------------------
# Parameters Setting
params = {
    "N": [500, 1000],
    "p": [0.01, 0.02, 0.03],
    "q": [0.3, 0.35, 0.4, 0.45, 0.5],
    "proportion_innovators": [0.01, 0.02, 0.03],
    "proportion_influencers": [0.05, 0.1],
    "network_type": "small_world"
}

results = mesa.batch_run(
    BassModel,
    parameters=params,
    iterations=25,
    max_steps=100,
    number_processes=1,
    data_collection_period=1,
    display_progress=True,
)

results_df = pd.DataFrame(results)
results_df.to_csv('./report/results.csv', index=False)
