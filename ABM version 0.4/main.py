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
N = 1000  # total number of agents
p = 0.03  # probability of connection
q = 0.38  # probability of innovation
proportion_innovators = 0.02  # proportion of innovators
proportion_influencers = 0.1  # proportion of influencers
steps = 100  # number of steps


# create and run the model
model = BassModel(N, p, q, proportion_innovators,
                  proportion_influencers, network_type="small_world")


# create and run the model
model = BassModel(N, p, q, proportion_innovators,
                  proportion_influencers, network_type="small_world")
for step in range(steps):
    model.step()


# --------------------------------------------
# Output model simulation result
agent_record = model.datacollector.get_agent_vars_dataframe()
agent_record.to_csv('./report/agent_record.csv')

model_result = model.datacollector.get_model_vars_dataframe()
model_result.to_csv('./report/model_result.csv')
