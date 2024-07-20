from django.shortcuts import render
from .models import *
import json
import pymongo
from django.http import JsonResponse
from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt
# Connect to the database
my_client = pymongo.MongoClient('mongodb://localhost:27017/')
dbname = my_client['EduSynergy']
collection_name = dbname["demo_question"]
# Create your views here.
from django.http import HttpResponse
@csrf_exempt
def createUser(request):
    data = json.loads(request.body.decode('utf-8'))
    title = data.get('title')
    print(title)  # prints: Hello
    return JsonResponse({'message': 'Title received successfully!'}, status=201)


def getData(request):
    a = collection_name.find()
    
    return HttpResponse(a)