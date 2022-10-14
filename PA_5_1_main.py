# Jungjae Lee
# Boston University College of Engineering
# EK 381 Programming Assignment 2 (HW 5)


# Necessary libraries
import math
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import scipy.stats as stat
from scipy.stats import norm


benign = np.genfromtxt("PA_5_2_Benigndata.csv", delimiter = ",")
malignant = np.genfromtxt("PA_5_3_Malignantdata.csv", delimiter = ",")


# ===== Part (a) =====
# Calculate sample means for the texture and perimeters
benign_mean = np.mean(benign, axis = 0)
malignant_mean = np.mean(malignant, axis = 0)

print("benign mean is ")
print(benign_mean)
print("malignant mean is ")
print(malignant_mean)


# ===== Part (b) =====
# Calculate sample variances for the texture and perimeters
benign_var = np.var(benign, axis = 0, ddof = 1)
malignant_var = np.var(malignant, axis = 0, ddof = 1)

print("benign variance is ")
print(benign_var)
print("malignant variance is ")
print(malignant_var)


# ===== Part (c) =====
# Plot normalized histogram <benign>
plt.hist(benign, bins = "auto", density = True)
xmin, xmax = plt.xlim()
xpoints = np.linspace(xmin, xmax, 200)

# PDF for Gaussian with mean and standard deviation
benign_pdf = norm.pdf(xpoints, benign_mean, math.sqrt(benign_var))

# Plot PDF
plt.plot(xpoints, benign_pdf, "r", linewidth = 2)


# Plot normalized histogram <malignant>
plt.hist(malignant, bins = "auto", density = True)
xmin, xmax = plt.xlim()
xpoints = np.linspace(xmin, xmax, 200)

# PDF for Gaussian with mean and standard deviation
malignant_pdf = norm.pdf(xpoints, malignant_mean, math.sqrt(malignant_var))

# Plot PDF
plt.plot(xpoints, malignant_pdf, "r", linewidth = 2)


# ===== Part (d) =====
