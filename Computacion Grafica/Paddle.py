class Paddle(pygame.sprite.Sprite):

    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.Surface((PADDLEWIDTH, PADDLEHEIGHT))
        self.image.fill(WHITE)
        self.rect = self.image.get_rect()
        self.name = PADDLE
