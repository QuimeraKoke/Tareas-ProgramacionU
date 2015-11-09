class Pelota:
    def __init__(self, displaySurf):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.Surface((15, 15))
        self.image.fill(WHITE)
        self.rect = self.image.get_rect()
        self.vectorx = BALLSPEED
        self.vectory = BALLSPEED * -1
        self.score = 0