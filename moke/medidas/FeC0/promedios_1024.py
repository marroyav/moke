#!/usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt


data = np.genfromtxt('FeC0_theta102_01.log',
                     dtype=None,
                     comments='#',           
                     delimiter='\t')  


size = len(data)
datasize = 1024

campo = []
intensidad = []
Field = []
Intensity = []
index = []
 

for i in range(0,size):
    campo.append(data[i][1])
    intensidad.append(data[i][2])
    index.append(data[i][0])

newSize = int(len(campo)/datasize)


NField = np.reshape(campo,(newSize,datasize))
NInte = np.reshape(intensidad,(newSize,datasize))

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

mediaCampo = np.mean(NField, axis=0)
mediaInte = np.mean(normalize, axis=0)



mediaInte_normalized = []

for k in range(0,datasize):
	mediaInte_normalized.append(2*((mediaInte[k]-np.amin(mediaInte))/(np.amax(mediaInte)-np.amin(mediaInte)))-1)


plt.figure()
plt.style.use('ggplot')
plt.plot(mediaCampo, mediaInte_normalized,marker='.')#'r*-')
plt.gca().invert_xaxis()
plt.ylim(-1.1,1.1)
plt.axhline(0, color='dodgerblue')
plt.axvline(0, color='dodgerblue')
plt.savefig('FeC0_theta102_01.png')
plt.show()