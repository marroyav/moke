#!/usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt


data = np.genfromtxt('Fe_20ciclos_130gauss_26_04_18.log',
                     dtype=None,
                     comments='#',           
                     delimiter='\t')  


size = len(data)
datasize = 4000

campo = []
intensidad = []
Field = []
Intensity = []
index = []

 

for i in range(0,size):
    campo.append(data[i][0])
    intensidad.append(data[i][1])
    #index.append(data[i][0])

newSize = int(len(campo)/datasize)


NField = np.reshape(campo,(newSize,datasize))
NInte = np.reshape(intensidad,(newSize,datasize))

for i in xrange(0,0):
    index.append(NInte[i][3999])


mina = np.amin(NInte,axis=1)

maxa = np.amax(NInte,axis=1)

minimos = []
maximos = []

for k in range (0,newSize):
	minimos.append(mina[k])
	maximos.append(maxa[k]) 


normalize = []

for k in range(0,newSize):
	for i in range(0,datasize):
		normalize.append(2*((NInte[k][i]-minimos[k])/(maximos[k]-minimos[k]))-1)

normalize = np.reshape(normalize,(newSize,datasize))

mediaCampo = np.mean((NField-2.6045)*1300, axis=0)
mediaInte = np.mean(normalize, axis=0)



mediaInte_normalized = []

for k in range(0,datasize):
	mediaInte_normalized.append(2*((mediaInte[k]-np.amin(mediaInte))/(np.amax(mediaInte)-np.amin(mediaInte)))-1)


np.savetxt('Fe_unciclo_10ms_130gauss_26_04_18_un.log', np.c_[mediaCampo,mediaInte_normalized])
'''
plt.figure()
plt.style.use('seaborn-deep')
plt.plot(mediaCampo, mediaInte_normalized,marker='.')#'r*-')
plt.axhline(0, color='black')
plt.axvline(0, color='black')
plt.gca().invert_xaxis()
plt.ylim(-1.2,1.2)
plt.savefig('Fe0_10ciclos_130gauss_25_04_18_un.png')

#plt.figure()
#plt.style.use('ggplot')
#plt.plot(index,marker='.')

#plt.ylim(-1.1,1.1)
#plt.savefig('Fe0_10ciclos_130gauss_25_04_18.png')
plt.show()'''