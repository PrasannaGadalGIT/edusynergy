from django.shortcuts import render
from .models import *

# Create your views here.
from django.http import HttpResponse

def createUser(request):
    return HttpResponse("Hello")