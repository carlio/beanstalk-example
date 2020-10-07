from django.db import models

class PageView(models.Model):

    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.timestamp)
