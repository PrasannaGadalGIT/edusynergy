from django.urls import path
from . import views
urlpatterns = [
    path("registerUser/", views.registerUser, name="registration"),
    path('login/', views.login, name="login"),
    path('resetUser/', views.resetUser, name='resetUser')
  
]
