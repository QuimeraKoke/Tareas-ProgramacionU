# -*- coding: iso-8859-1 -*-
import pygame
from pygame.locals import *
from OpenGL.GL import *
from OpenGL.GLU import *
from random import uniform
import math
from Vector2D import *
from Paddle import *
from Block import *
from Pelota import *
from Score import *
from utils import *
from Vista import *
#####################################################################
# Funciones de graficos
#####################################################################

def init_pygame((w,h), title=""):
   pygame.init()
   pygame.display.set_mode((w,h), OPENGL|DOUBLEBUF)
   pygame.display.set_caption(title)
	
def init():
   glClearColor(0.0, 0.0, 0.0, 0.0)
   glClearDepth(1.0)
   glDisable(GL_DEPTH_TEST)
   glShadeModel(GL_SMOOTH)
   glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST)
   glEnable (GL_BLEND)
   glBlendFunc (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
   glHint (GL_LINE_SMOOTH_HINT, GL_NICEST)

def reshape((width, height)):
   if height == 0:
      height = 1
   glMatrixMode(GL_PROJECTION)
   glLoadIdentity()
   gluOrtho2D(0.0, width, 0.0, height)
   glMatrixMode(GL_MODELVIEW)
   glLoadIdentity()
	
def init_opengl((w,h)):
   init()
   reshape((w,h))

#####################################################################
# Programa principal Controlador
#####################################################################

def main(argv):
   level1=[[1,2,3,4,5,5,4,3,2,1],[5,4,3,2,1,1,2,3,4,5],[1,2,3,4,5,5,4,3,2,1],[5,4,3,2,1,1,2,3,4,5],[1,2,3,4,5,5,4,3,2,1]]
   # imprime en consola
   print 'Earth Defender'


   ## LEVELS ##

	## COLORS ##

	#         R   G   B
   GRAY=(100, 100,100)
   NAVYBLUE = ( 60,  60, 100)
   WHITE   = (255, 255, 255)
   RED     = (255,   0,   0)
   GREEN   = (  0, 255,   0)
   BLUE    = (  0,   0, 255)
   YELLOW   = (255, 255,   0)
   ORANGE   = (255, 128,   0)
   PURPLE   = (255,   0, 255)
   CYAN    = (  0, 255, 255)
   BLACK   = (  0,   0,   0)
   COMBLUE  = (233, 232, 255)
   Colors=[RED,ORANGE,YELLOW,GREEN,NAVYBLUE]


	## PARAMETERS ##

   BGCOLOR = BLACK
   BLOCKWIDTH = 62
   BLOCKHEIGHT = 25
   BLOCKGAP = 2
   PADDLEWIDTH = 100
   PADDLEHEIGHT = 10
   BALLRADIUS = 20
   BALLCOLOR = WHITE


   w = 640
   h = 480 # alto
   t = 0   # tiempo de conteo para generar meteoritos
   # inicializando ...

   init_pygame((w,h),"Arkanoid")
   init_opengl((w,h))

   # sonidos
   # sound_shoot = pygame.mixer.Sound("laser.wav")
   # sound_shoot.set_volume(0.2)
	
   # # música de fondo
   # pygame.mixer.music.load("background.mp3")
   # pygame.mixer.music.play(-1,0.0)


   # medida de tiempo inicial
   t0=pygame.time.get_ticks()
   paddle=Paddle(WHITE,PADDLEHEIGHT,PADDLEWIDTH)
   glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT)
   run=True
   inity=h - 5*BLOCKHEIGHT
   initx=0
   score=Score(h)
   blockArray=[]
   
   for i in range(0,len(level1)):
   	temp=[]
   	print(inity)
   	for j in range(0,len(level1[i])):
   		try:
   			a=Block(Colors[level1[i][j]-1],Vector(initx,inity),BLOCKHEIGHT,BLOCKWIDTH)
   			a.dibujar()
   		except Exception, e:
   			raise
   		else:
   			pass
   		finally:
   			pass
   		temp.append(a)
   		initx= initx+BLOCKWIDTH+BLOCKGAP
   	inity = inity+BLOCKHEIGHT+BLOCKGAP
   	blockArray.append(temp)
   print(blockArray)


   while run:
     for i in blockArray:
        for a in i:
           a.dibujar()
      # 0: CONTROL DEL TIEMPO
     glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT)
     t1 = pygame.time.get_ticks()	# tiempo actual
     dt = (t1 - t0)					# diferencial de tiempo asociado a la iteración
     t0 = t1
     for event in pygame.event.get():
     			mouse_pos=pygame.mouse.get_pos()

     			paddle.p=Vector(mouse_pos[0],0)
     			if event.type == QUIT:
     				Block()
     				run=False
     paddle.dibujar()
     pygame.time.wait(1000/30)
     
     pygame.display.flip()
      # pone el dibujo en la pantalla
   # termina pygame (cerrar ventana)
   pygame.quit()

if __name__ == "__main__":
   import sys
   # sys.argv es una lista de strings con los argumentos que se le dan al interprete,
   # es decir, si llamamos a
   # python EarthDefender_s.py 3 2
   # entonces
   # sys.argv = ["EarthDefender_s.py","3","2"]
   # luego
   # sys.argv[0] = "EarthDefender_s.py"
   # sys.argv[1] = "3"
   # sys.argv[2] = "2"
   main(sys.argv)
   
#####################################################################
