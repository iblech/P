import sys

with open(sys.argv[1], 'r') as f:
	with open('dirs.txt', 'w') as g:
		for line in f:
			if line.startswith('//'):
				continue
			else:
				line = line[:line.rfind('\\')]
				print >>g, line
