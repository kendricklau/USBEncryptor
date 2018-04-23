from pyDes import *

#############################################################################
# 				Examples				    #
#############################################################################
def _example_triple_des_():
	from time import time

	# Utility module
	from binascii import unhexlify as unhex
	from binascii import hexlify as hexe

	# example shows triple-des encryption using the des class
	print ("Example of triple DES encryption in default ECB mode (DES-EDE3)\n")

	print ("Triple des using the des class (3 times)")
	t = time()
	k1 = des(unhex("CA3A3E989AA7AE58"))
	k2 = des(unhex("EB806D4E20A6C744"))
	k3 = des(unhex("21735514632D155D"))
	d = b"9999999999999999"
	print ("Key1:      %r" % k1.getKey())
	print ("Key2:      %r" % k2.getKey())
	print ("Key3:      %r" % k3.getKey())
	print ("Data:      %r" % d)

	e1 = k1.encrypt(d)
	e2 = k2.decrypt(e1)
	e3 = k3.encrypt(e2)
	print ("Encrypted: %r" % e3)

	print(type(d))
	print(hex(15))

	d3 = k3.decrypt(e3)
	d2 = k2.encrypt(d3)
	d1 = k1.decrypt(d2)
	print ("Decrypted: %r" % d1)
	print((d1))
	print ("DES time taken: %f (%d crypt operations)" % (time() - t, 6 * (len(d) / 8)))
	print ("")

	