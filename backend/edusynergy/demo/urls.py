from django.urls import path
from . import views
urlpatterns = [
    path("", views.createUser, name="Testing"),
    path("datas/", views.getData, name="Datas")
]
