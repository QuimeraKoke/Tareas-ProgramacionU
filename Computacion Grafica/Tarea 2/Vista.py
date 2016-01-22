# -*- coding: iso-8859-1 -*-


from OpenGL.GL import *
from utils import *

class Vista:
    def dibujar(self,bloques,pelota,paddle,dt,a,w,h,Rmin,Rmax):
        # limpia la pantalla
        glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT)

        # itera los meteoritos
        # for b in bloques:
        #     # mueve el meteorito
        #     pelota.mover(dt/60.0,a)

        #     # chequea si estan afuera de la pantalla, los elimina de ser asi.
        #     fuera(pelota,w,h)

        #     # dibuja el bloque
        #     b.dibujar()

        #     # chequea impactos con el bloque y actua en concecuencia.
        #     impacto(tierra,m,Rmin,Rmax,w)

        # itera las balas
        # for b in bs:
        #     b.mover(dt/60.0,a)
        #     fuera(b,w,h)
        #     b.dibujar()

        #     # chequea colisiones con los meteoritos
        #     for m in ms:
        #         # de haber colision, destruye ambos.
        #         if estanChocando(m,b):
        #             m.vive = False
        #             b.vive = False


        #elimina las balas y meteoritos.
        # limpiar(bs)
        # limpiar(ms)

        # dibuja la nave
        paddle.dibujar()

        glLoadIdentity()

