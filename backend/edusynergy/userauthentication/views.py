from django.shortcuts import render
from .models import UserRegister
import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import bcrypt
from dbconnection import dbname
import jwt
import datetime
import os
from dotenv import load_dotenv

load_dotenv()
SECRET_KEY = os.getenv('SECRET_KEY')
# Create your views here.
userRegistration = dbname['user-registered']
@csrf_exempt
def registerUser(request):
    if request.method == "POST":
        data = json.loads(request.body.decode('utf-8'))
        email = data.get('email')
        password = data.get('password')
        confirm_password = data.get('c')
        role = data.get('role')
        
        if password != confirm_password:
            return JsonResponse({'error': 'Passwords do not match'}, status=400)

        salt = bcrypt.gensalt()
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)

        user = UserRegister(
            email=email,
            password=hashed_password.decode('utf-8'),
            role=role
        )

        userData = {
            'email': email,
            "password" : hashed_password.decode('utf-8'),
            "role" : role
        }
        userRegistration.insert_one(userData)

        return JsonResponse({'message': 'User registered successfully'}, status=201)

    return JsonResponse({'error': 'Invalid request method'}, status=405)
    



@csrf_exempt
def login(request):
    if request.method == "POST":
        data = json.loads(request.body.decode('utf-8'))
        email = data.get('email')
        password = data.get('password')

        usercredentials = userRegistration.find_one({"email" : email})

        if not usercredentials:
            return JsonResponse({'message' : f'{email} does not exist'}, status = 400)
        if bcrypt.checkpw(password.encode('utf-8'), usercredentials['password'].encode('utf-8')):
                 # Generate JWT token
                payload = {
                    'email': email,
                    'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=1)  # Token expiration time
                }
                token = jwt.encode(payload, SECRET_KEY, algorithm='HS256')
                return JsonResponse({'message': 'Login successful', 'token': token, 'loggedIN' : True}, status=200)
       
    return JsonResponse({'message': 'User logged successfully'}, status=201)
@csrf_exempt
def resetUser(request):
     if request.method == "PATCH":
        try:
            data = json.loads(request.body.decode('utf-8'))
            email = data.get('email')
            password = data.get('current_password')
            new_password = data.get('new_password')
            confirm_password = data.get('confirm_password')
        
            if password == new_password:
                return JsonResponse({'error' : 'Old password'})
            if new_password != confirm_password:
                return JsonResponse({'error': 'New passwords do not match'}, status=400)

            user = userRegistration.find_one({"email": email})
            if not user:
                return JsonResponse({'error': 'User not found'}, status=404)

            if bcrypt.checkpw(password.encode('utf-8'), user['password'].encode('utf-8')):
                salt = bcrypt.gensalt()
                hashed_new_password = bcrypt.hashpw(new_password.encode('utf-8'), salt)
                
                result = userRegistration.update_one(
                    {'_id': user['_id']},
                    {'$set': {'password': hashed_new_password.decode('utf-8')}}
                )
               
            else:
                return JsonResponse({'error': 'Incorrect current password'}, status=400)
        

        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)


    