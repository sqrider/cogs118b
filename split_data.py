import numpy as np
import csv

train_data = np.genfromtxt('train_data.txt', delimiter=',')

# 26 different samples
# 40 test subjects
samples = 26
subjects = 40
for i in range(samples):
	path = 'split_data/f' + str(i+1) + '.csv'
	with open(path, 'w') as f:
		writer = csv.writer(f, lineterminator='\n')
		for j in range(subjects):
			writer.writerow(train_data[samples * j + i])