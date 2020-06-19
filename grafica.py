#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri May 29 22:00:26 2020

@author: walberto

GRAFICA DE LAS CAMINATAS ALEATORIAS
"""

import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation, PillowWriter

"Esto lee los datos y los guarda en un array de numpy"
posiciones = np.loadtxt('Resultados.dat')

"Esto cambaia del array 3D a listas"
n,x,y = zip(*posiciones)

"Esta es la figura"
def grafica_final():
    fig1 = plt.figure()
    ax1 = fig1.add_subplot()
    ax1.set_xlim(-100,100)
    ax1.set_ylim(-100,100)
    # Esta parte plotea
    l1, = ax1.plot(x,y,'-')


    ax1.set(xlabel='x',ylabel='y')
    plt.savefig('posiciones.pdf')
    plt.show()

grafica_final()
