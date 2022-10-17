
from django.urls import path, include
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(prefix='customers', viewset=views.CustomerViewSet, basename='customer')
router.register(prefix='halls', viewset=views.HallViewSet, basename='hall')
router.register(prefix='categories', viewset=views.CategoryViewSet, basename='category')
router.register(prefix='services', viewset=views.ServiceViewSet, basename='service')
router.register(prefix='order', viewset=views.OrderViewSet, basename='order')
router.register(prefix='comments', viewset=views.CommentViewSet)
router.register(prefix='menus', viewset=views.MenuViewSet, basename='menu')
router.register(prefix='banners', viewset=views.BannerViewSet, basename='banner')
router.register(prefix='time-organ', viewset=views.TimeOrganViewSet, basename='time')
router.register(prefix='comment', viewset=views.CreateCommentViewSet, basename='create-comment')
router.register(prefix='combo-service', viewset=views.ComboServiceViewSet, basename='combo')

urlpatterns = [
    path('', include(router.urls))
]

