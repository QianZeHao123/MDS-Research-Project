import pandas as pd
import mesa
from model import BassModel
import os
import shutil

# import parameters from params.py
from params import params

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
results_df.to_csv('./report/model5results.csv', index=False)
