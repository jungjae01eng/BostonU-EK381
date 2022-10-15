# Jungjae Lee
# Boston University College of Engineering
# EK 381 Programming Assignment 2 (HW 5)


# Necessary libraries
import math
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
# import scipy.stats as stat
from scipy.stats import norm
from scipy.stats import expon


benign = np.genfromtxt("PA_5_2_Benigndata.csv", delimiter = ",")
malignant = np.genfromtxt("PA_5_3_Malignantdata.csv", delimiter = ",")
uniteddelays = np.genfromtxt("PA_5_4_Uniteddelays.csv", delimiter = ",")


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
# === <BENIGN 1> ===
# Plot normalized histogram
plt.figure(1)
plt.hist(benign[:, 0], bins = "auto", density = True)
xmin, xmax = plt.xlim()
xpoints = np.linspace(xmin, xmax, 200)

# PDF for Gaussian with mean and standard deviation
benign_pdf_1 = norm.pdf(xpoints, benign_mean[0], math.sqrt(benign_var[0]))

# Plot PDF
plt.plot(xpoints, benign_pdf_1, "r", linewidth = 2)


# === <BENIGN 2> ===
# Plot normalized histogram
plt.figure(2)
plt.hist(benign[:, 1], bins = "auto", density = True)
xmin, xmax = plt.xlim()
xpoints = np.linspace(xmin, xmax, 200)

# PDF for Gaussian with mean and standard deviation
benign_pdf_2 = norm.pdf(xpoints, benign_mean[1], math.sqrt(benign_var[1]))

# Plot PDF
plt.plot(xpoints, benign_pdf_2, "r", linewidth = 2)


# === <MALIGNANT 1> ===
# Plot normalized histogram
plt.figure(3)
plt.hist(malignant[:, 0], bins = "auto", density = True)
xmin, xmax = plt.xlim()
xpoints = np.linspace(xmin, xmax, 200)

# PDF for Gaussian with mean and standard deviation
malignant_pdf_1 = norm.pdf(xpoints, malignant_mean[0], math.sqrt(malignant_var[0]))

# Plot PDF
plt3 = plt.plot(xpoints, malignant_pdf_1, "r", linewidth = 2)


# === <MALIGNANT 2> ===
# Plot normalized histogram
plt.figure(4)
plt.hist(malignant[:, 1], bins = "auto", density = True)
xmin, xmax = plt.xlim()
xpoints = np.linspace(xmin, xmax, 200)

# PDF for Gaussian with mean and standard deviation
malignant_pdf_2 = norm.pdf(xpoints, malignant_mean[1], math.sqrt(malignant_var[1]))

# Plot PDF
plt.plot(xpoints, malignant_pdf_2, "r", linewidth = 2)


# ===== Part (d) =====
# Calculate mean
plt.figure (5)
uniteddelays_mean = np.mean(uniteddelays, axis = 0)

# Plot the histogram
plt.hist(uniteddelays, bins = "auto", density = True)
xmin, xmax = plt.xlim()
xpoints = np.linspace(xmin, xmax, 200)

# Evaluation of the exponential PDF
uniteddelays_p = expon.pdf(xpoints, scale = uniteddelays_mean)
plt.plot(xpoints, uniteddelays_p, "r", linewidth = 2)
plt.show()


# ===== Part (e) =====
print(uniteddelays_mean)