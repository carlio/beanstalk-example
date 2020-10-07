from django.urls import path

from landing.views import LandingPage

urlpatterns = [
    path('', LandingPage.as_view()),
]
