import pandas as pd
import mesa
from model import BassModel


"""
Simulation 4: Keep the same proportion of influencers
- N = 1000
- p = 0.01
- q = 0.3
- Influencers proportion = 0.1
- network_type = "small_world"
"""


results_same_inf = mesa.batch_run(
    BassModel,
    parameters={
        "N": 1000,
        "p": 0.01,
        "q": 0.3,
        "agent_proportion": [[0, 0.1, 0.009, 0.891],
                             [0.003, 0.097, 0.009, 0.891],
                             [0.005, 0.095, 0.009, 0.891],
                             [0.007, 0.093, 0.009, 0.891],
                             [0.01, 0.09, 0.009, 0.891]],
        "network_type": "small_world"
    },
    iterations=25,
    max_steps=100,
    number_processes=1,
    data_collection_period=1,
    display_progress=True,
)

results_df_result_same_inf = pd.DataFrame(results_same_inf)
results_df_result_same_inf.to_csv(
    './report/simulation4.csv', index=False)
