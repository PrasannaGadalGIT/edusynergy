from django.db import models

# Create your models here.
class UserRegister(models.Model):
    email = models.CharField(max_length=1000)
    password = models.CharField(max_length=1000)
    password = models.CharField(max_length=1000)
    role = models.CharField(max_length=1000)