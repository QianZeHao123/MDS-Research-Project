import math


def bass_model(t, p, q):
    return (1 - math.exp(-(p + q) * t)) / (1 + (q / p) * math.exp(-(p + q) * t))


def find_time_for_adoption_rate(target_rate, p, q, tolerance=1e-6):
    left, right = 0, 1000  # Assuming it won't take more than 1000 time units
    while right - left > tolerance:
        mid = (left + right) / 2
        if bass_model(mid, p, q) < target_rate:
            left = mid
        else:
            right = mid
    return (left + right) / 2


# Parameters
p = 0.01
q = 0.3
N = 1000

# Calculate times for different adoption rates
adoption_rates = [0.25, 0.50, 0.75]

print(f"Bass Model Parameters: p = {p}, q = {q}, N = {N}")
print("\nTime to reach adoption rates:")

for rate in adoption_rates:
    time = find_time_for_adoption_rate(rate, p, q)
    adopters = rate * N
    print(f"{rate*100}% ({adopters:.0f} adopters): {time:.2f} time units")
