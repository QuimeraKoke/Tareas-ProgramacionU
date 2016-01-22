from Vector2D import *
from OpenGL.GL import *

class Paddle:
    def __init__(self,color, h, w):
        self.p = Vector(0.0,0.0)  # posicion de la nave
        self.color = color
        self.h = h
        self.w = w

    def dibujar(self):
        glPushMatrix()

        glTranslatef(self.p.x(),self.p.y(),0.0)
        glColor4f(self.color[0],self.color[1],self.color[2],1.0)

        glBegin(GL_POLYGON)

        glVertex2f(0,0)
        glVertex2f(0,self.h)
        glVertex2f(self.w,self.h)
        glVertex2f(self.w,0)

        glEnd()
        glPopMatrix()
    