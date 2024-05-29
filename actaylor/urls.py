from django.urls import path
from .views import home_view, contact_success_view

urlpatterns = [
    path("", home_view, name="home"),
    path("contact_success/", contact_success_view, name="contact_success"),
]
