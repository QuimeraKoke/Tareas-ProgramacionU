import pygame
import sys
from pygame.locals import *
class Score(object):
    def __init__(self,h):
        self.score = 0
        self.font = pygame.font.SysFont('Helvetica', 25)
        self.render = self.font.render('Score: ' + str(self.score), True, (1,1,1),(0,0,0))
        self.rect = self.render.get_rect()
        self.rect.x = 0
        self.rect.bottom = h