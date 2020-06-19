#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri May 29 22:00:26 2020

@author: walberto

ANIMACION DE LAS CAMINATAS ALEATOREAS
"""

import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation, PillowWriter

"Esto lee los datos y los guarda en un array de numpy"
posiciones = np.loadtxt('Resultados.dat')

"Esto cambaia del array 3D a listas"
n,x,y = zip(*posiciones)

"Esta parte hace el gif"
def animacion():
    fig2, ax2 = plt.subplots(figsize=(6,6))
    ax2.set_xlim(-100,100)
    ax2.set_ylim(-100,100)

    l2, = ax2.plot([],[],'-')

    "Esta función Escoge la posición para cada paso"
    def update(i):
        l2.set_data(x[0:i],y[0:i])
        return l2,


    ani = FuncAnimation(fig2, update,np.arange(0,2000))
    writer = PillowWriter(fps=60)
    ani.save('walker_nolim_1.gif',writer=writer,dpi=200)

animacion()
