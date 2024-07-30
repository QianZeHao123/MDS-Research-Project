import pandas as pd
import mesa
from model import BassModel


"""
Simulation 3: Keep the same proportion of innovators
- N = 1000
- p = 0.01
- Innovator proportion = 0.01
- network_type = "small_world"
"""


results_same_inno = mesa.batch_run(
    BassModel,
    parameters={
        "N": 1000,
        "p": 0.01,
        "q": 0.3,
        "agent_proportion": [[0, 0.099, 0.01, 0.891],
                             [0.003, 0.099, 0.007, 0.891],
                             [0.005, 0.099, 0.005, 0.891],
                             [0.007, 0.099, 0.003, 0.891],
                             [0.01, 0.099, 0, 0.891]],
        "network_type": "small_world"
    },
    iterations=25,
    max_steps=100,
    number_processes=1,
    data_collection_period=1,
    display_progress=True,
)

results_df_result_same_inno = pd.DataFrame(results_same_inno)
results_df_result_same_inno.to_csv(
    './report/simulation3.csv', index=False)
