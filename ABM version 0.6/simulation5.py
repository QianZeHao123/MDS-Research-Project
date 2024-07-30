import numpy as np


def calculate_agent_prop(prop_inf, prop_inno):
    # Convert inputs to numpy float64 for high precision calculations
    prop_inf = np.float64(prop_inf)
    prop_inno = np.float64(prop_inno)

    inf_inno = prop_inf * prop_inno
    inf_imit = prop_inf * (1 - prop_inno)
    noninf_inno = (1 - prop_inf) * prop_inno
    noninf_imit = (1 - prop_inf) * (1 - prop_inno)

    # Round the results to three decimal places and convert to float
    inf_inno = float(round(inf_inno, 3))
    inf_imit = float(round(inf_imit, 3))
    noninf_inno = float(round(noninf_inno, 3))
    noninf_imit = float(round(noninf_imit, 3))

    return [inf_inno, inf_imit, noninf_inno, noninf_imit]


# Example usage
prop_inf_values = [0.01, 0.02, 0.03]
prop_inno_values = [0.1]

agent_prop = []
for prop_inf in prop_inf_values:
    for prop_inno in prop_inno_values:
        result = calculate_agent_prop(prop_inf, prop_inno)
        agent_prop.append(result)

print(agent_prop)
