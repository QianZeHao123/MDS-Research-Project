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
"""
# proportion_influential_innovators = agent_proportion[0]
# proportion_influential_imitators = agent_proportion[1]
# proportion_non_influential_innovators = agent_proportion[2]
# proportion_non_influential_imitators = agent_proportion[3]
"""
# --------------------------------------------

results_change_p = mesa.batch_run(
    BassModel,
    parameters={
        "N": 1000,
        "p": [0.01, 0.02, 0.03],
        "q": 0.3,
        "agent_proportion": [[0.001, 0.099, 0.09, 0.9]],
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
    './report/model6_results_change_p.csv', index=False)


# --------------------------------------------
results_change_q = mesa.batch_run(
    BassModel,
    parameters={
        "N": 1000,
        "p": 0.02,
        "q": [0.3, 0.4, 0.5],
        "agent_proportion": [[0.001, 0.099, 0.09, 0.9]],
        "network_type": "small_world"
    },
    iterations=25,
    max_steps=100,
    number_processes=1,
    data_collection_period=1,
    display_progress=True,
)

results_df_results_change_q = pd.DataFrame(results_change_q)
results_df_results_change_q.to_csv(
    './report/model6_results_change_q.csv', index=False)


# --------------------------------------------
# proportion of influential agents = 0.01
# but the proportion of influential innovators and influential imitators are changed
results_change_agent_prop = mesa.batch_run(
    BassModel,
    parameters={
        "N": 1000,
        "p": 0.02,
        "q": 0.3,
        "agent_proportion": [[0, 0.01, 0.09, 0.9],
                             [0.001, 0.009, 0.09, 0.9],
                             [0.003, 0.007, 0.09, 0.9],
                             [0.005, 0.05, 0.09, 0.9],
                             [0.007, 0.003, 0.09, 0.9],
                             [0.009, 0.001, 0.09, 0.9],
                             [0.01, 0, 0.09, 0.9]],
        "network_type": "small_world"
    },
    iterations=25,
    max_steps=100,
    number_processes=1,
    data_collection_period=1,
    display_progress=True,
)

results_df_results_change_agent_prop = pd.DataFrame(results_change_agent_prop)
results_df_results_change_agent_prop.to_csv(
    './report/model6_results_change_agent_prop.csv', index=False)
