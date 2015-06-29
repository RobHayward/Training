from sys import argv

script, filename = argv

txt = open(filename, 'rb')

print "Here's your file %r:" % filename
print txt.read()
