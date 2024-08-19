import pandas as pd
import mesa
from model import BassModel
import multiprocessing

"""
Simulation 2: Change q and keep other parameters constant
- N = 1000
- p = 0.02
- Influencer proportion = 0.1
- Innovator proportion = 0.01
- network_type = "small_world"
"""

if __name__ == '__main__':
    results_change_q = mesa.batch_run(
        BassModel,
        parameters={
            "N": 1000,
            "p": 0.02,
            "q": [0.3, 0.35, 0.4, 0.45, 0.5],
            "agent_proportion": [[0.001, 0.099, 0.009, 0.891]],
            "network_type": "small_world"
        },
        iterations=25,
        max_steps=100,
        number_processes=multiprocessing.cpu_count(),
        data_collection_period=1,
        display_progress=True,
    )

    results_df_results_change_q = pd.DataFrame(results_change_q)
    results_df_results_change_q.to_csv(
        './report/simulation2.csv', index=False)