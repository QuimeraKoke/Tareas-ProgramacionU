import pygame
import sys
from pygame.locals import *

class Block(pygame.sprite.Sprite):
 
    def __init__(self,color):
        self.blockWidth = BLOCKWIDTH
        self.blockHeight = BLOCKHEIGHT
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.Surface((self.blockWidth, self.blockHeight))
        self.image.fill(color)
        self.rect = self.image.get_rect()
        self.name = BLOCK