from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import action
from django.conf import settings
from rest_framework.views import APIView
from .models import User, Hall, Category, Food, Service, \
    User, Order, Comment, Customer, Regulation, Menu, Banner, \
    DateOfOrganization, Rating, ComboService
from rest_framework import viewsets, generics, status, permissions
from .serializers import CustomerSerializer, HallSerializer, CategorySerializer, \
    OrderSerializer, ServiceSerializer, FoodSerializer, \
    MenuSerializer, BannerSerializer, \
    TimeOrganSerializer, CommentSerializer, CreateCommentSerializer, RateSerializer, ComboServicesSerializer
from .paginators import BasePaginator

from .utils import price_hall_now

price_hall_now()


class CustomerViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = CustomerSerializer

    def get_permissions(self):
        if self.action == 'get_current_user':
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]

    @action(methods=['get'], detail=False, url_path='current-user')
    def get_current_user(self, request):
        return Response(self.serializer_class(request.user).data, status=status.HTTP_200_OK)

    # @action(methods=['post'], detail=True, url_path='add-add-cus')
    # def add_in_cus(self, request, pk):
    #     user = self.get_object()
    #     customer = Customer.objects.create(phone_number="13214", user=user)
    #     customer.save()


class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = Category.objects.filter(active=True)
    serializer_class = CategorySerializer
    # pagination_class = BasePaginator

    def get_queryset(self):
        query = self.queryset

        q = self.request.query_params.get('q')
        if q:
            query = query.filter(name__icontains=q)

        return query

    @action(methods=['get'], detail=True, url_path='foods')
    def get_foods(self, request, pk):
        category = Category.objects.get(pk=pk)
        foods = category.foods.filter(active=True)

        q = request.query_params.get('q')
        if q is not None:
            foods = foods.filter(name__icontains=q)

        price = request.query_params.get('price')
        if price is not None:
            foods = foods.filter(price=price)

        return Response(data=FoodSerializer(foods, many=True, context={'request': request}).data,
                        status=status.HTTP_200_OK)


class HallViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = Hall.objects.filter(active=True)
    serializer_class = HallSerializer
    # pagination_class = BasePaginator

    def get_permissions(self):
        if self.action in ['rating']:
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    def get_queryset(self):
        query = self.queryset

        q = self.request.query_params.get('q')
        if q:
            query = query.filter(name__icontains=q)
            return query

        qty = self.request.query_params.get('qty')
        if qty:
            query = query.filter(capacity=qty)
            return query

        return query

    @action(methods=['post'], url_path='rating', detail=True)
    def rating(self, request, pk):
        if 'rate' not in request.data:
            return Response(status=status.HTTP_400_BAD_REQUEST)

        hall = self.get_object()
        customer = request.user.customer

        r, _ = Rating.objects.get_or_create(hall=hall, customer=customer)
        r.rate = int(request.data.get('rate'))
        r.save()

        return Response(status=status.HTTP_201_CREATED)

    @action(methods=['get'], url_path='rates', detail=True)
    def get_rate(self, request, pk):
        hall = self.get_object()
        rates = hall.rates.select_related('customer')

        return Response(RateSerializer(rates, many=True).data, status=status.HTTP_200_OK)


# class FoodViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
#     queryset = Food.objects.filter(active=True)
#     serializer_class = FoodSerializer
#     pagination_class = BasePaginator
#
#     def get_queryset(self):
#         query = self.queryset
#
#         kw = self.request.query_params.get('kw')
#         if kw:
#             query = query.filter(name__icontains=kw)
#             return query
#
#         price = self.request.query_params.get('price')
#         if price:
#             query = query.filter(price=price)
#             return query
#
#         return query


class ComboServiceViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = ComboService.objects.filter(active=True)
    serializer_class = ComboServicesSerializer
    # pagination_class = BasePaginator


class ServiceViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = Service.objects.filter(active=True)
    serializer_class = ServiceSerializer
    # pagination_class = BasePaginator

    def get_permissions(self):
        if self.action in ['rating']:
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    def get_queryset(self):
        query = self.queryset

        q = self.request.query_params.get('q')
        if q:
            query = query.filter(name__icontains=q)
            return query

        price = self.request.query_params.get('price')
        if price:
            query = query.filter(price=price)
            return query

        return query

    @action(methods=['post'], url_path='rating', detail=True)
    def rating(self, request, pk):
        if 'rate' not in request.data:
            return Response(status=status.HTTP_400_BAD_REQUEST)

        service = self.get_object()
        customer = request.user.customer

        r, _ = Rating.objects.get_or_create(service=service, customer=customer)
        r.rate = int(request.data.get('rate'))
        r.save()

        return Response(status=status.HTTP_201_CREATED)

    @action(methods=['get'], url_path='rates', detail=True)
    def get_rate(self, request, pk):
        service = self.get_object()
        rates = service.rates.select_related('customer')

        return Response(RateSerializer(rates, many=True).data, status=status.HTTP_200_OK)


class MenuViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = Menu.objects.filter(active=True)
    serializer_class = MenuSerializer
    # pagination_class = BasePaginator

    def get_queryset(self):
        menus = Menu.objects.filter(active=True)

        q = self.request.query_params.get('q')
        if q:
            menus = Menu.objects.filter(name__icontains=q)

        menu_id = self.request.query_params.get('id')
        if menu_id is not None:
            menus = menus.filter(id=menu_id)

        return menus


class TimeOrganViewSet(viewsets.ViewSet, generics.ListAPIView, generics.CreateAPIView):
    queryset = DateOfOrganization.objects.all()
    serializer_class = TimeOrganSerializer


class OrderViewSet(viewsets.ViewSet, generics.RetrieveAPIView, generics.CreateAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    # permission_classes = [permissions.IsAuthenticated]

    @action(methods=['post'], detail=True, url_path='time-organize')
    def choose_time_organize(self, request, pk):
        order = Order.objects.get(pk=pk)
        date = request.data.get('date')
        shift = int(request.data.get('shift'))

        if date and shift is not None:
            time_organize, _ = DateOfOrganization.objects.get_or_create(date=date, shift=shift)
            order.time_organize = time_organize
            order.save()

        return Response(self.serializer_class(order).data, status=status.HTTP_200_OK)

    @action(methods=['post'], detail=True, url_path='choose-menu')
    def choose_menu(self, request, pk):
        order = Order.objects.get(pk=pk)
        m = request.data.get('menu')
        menu = Menu.objects.get(pk=m)

        if menu is not None:
            order.menu = menu
            order.save()
        return Response(self.serializer_class(order).data, status=status.HTTP_200_OK)


class CommentViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Comment.objects.filter(active=True)
    serializer_class = CommentSerializer
    # pagination_class = BasePaginator


class CreateCommentViewSet(viewsets.ViewSet, generics.UpdateAPIView, generics.DestroyAPIView):
    queryset = Comment.objects.all()
    serializer_class = CreateCommentSerializer
    # permission_classes = [permissions.IsAuthenticated]

    @action(methods=['post'], detail=False, url_path='add-comment')
    def add_comment(self, request):
        content = request.data.get('content')
        if content:
            comment = Comment.objects.create(content=content, customer=request.user.customer)

        return Response(self.serializer_class(comment).data, status=status.HTTP_201_CREATED)

    def destroy(self, request, *args, **kwargs):
        if request.user == self.get_object().customer.user:
            return super().destroy(request, *args, **kwargs)

        return Response(status=status.HTTP_403_FORBIDDEN)

    def partial_update(self, request, *args, **kwargs):
        if request.user == self.get_object().customer.user:
            return super().partial_update(request, *args, **kwargs)  # key: content

        return Response(status=status.HTTP_403_FORBIDDEN)


class AuthInfo(APIView):
    def get(self, request):
        return Response(settings.OAUTH2_INFO, status=status.HTTP_200_OK)


class BannerViewSet(viewsets.ViewSet, generics.ListAPIView, generics.DestroyAPIView):
    queryset = Banner.objects.all()
    serializer_class = BannerSerializer


