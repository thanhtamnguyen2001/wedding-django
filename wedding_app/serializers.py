from django.contrib.auth.hashers import make_password
from rest_framework import serializers
from .models import User, Hall, Service, Category, Food, \
    DateOfOrganization, User, Customer, \
    Order, Comment, Menu, Banner, HallOrganize, Regulation, Rating, ComboService
from django.contrib.auth.models import Group


class CustomerSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'email', 'username', 'password', 'avatar', 'is_customer']
        extra_kwargs = {
            'password': {
                'write_only': True
            }
        }

    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(user.password)
        user.is_customer = True
        group = Group.objects.get(pk=1)
        user.save()
        user.groups.add(group)
        customer = Customer(user=user)
        customer.save()
        return user


class HallSerializer(serializers.ModelSerializer):
    class Meta:
        model = Hall
        fields = ['id', 'name', 'capacity', 'price', 'free', 'image', 'created_date', 'morning_price', 'noon_price', 'night_price']
        extra_kwargs = {
            'free': {
                'read_only': True
            }
        }


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name', 'created_date']


class FoodSerializer(serializers.ModelSerializer):
    category = CategorySerializer()

    class Meta:
        model = Food
        fields = ['id', 'name', 'price', 'image', 'category']


class MenuSerializer(serializers.ModelSerializer):
    foods = FoodSerializer(many=True)

    class Meta:
        model = Menu
        fields = ['id', 'name', 'foods', 'image', 'price']


class ServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Service
        fields = ['id', 'name', 'content', 'price', 'image']


class TimeOrganSerializer(serializers.ModelSerializer):
    class Meta:
        model = DateOfOrganization
        fields = ['date', 'shift']

    def create(self, validated_data):
        time = TimeOrganSerializer(**validated_data)
        time.regulation = Regulation.objects.last()
        time.save()
        return time


class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = ['id', 'customer', 'combo_services', 'hall', 'menu', 'number_of_table', 'groom_name',
                  'bride_name', 'date', 'shift']

    def create(self, validated_data):
        order = Order(**validated_data)

        time_organize, _ = DateOfOrganization.objects.get_or_create(date=order.date, shift=order.shift)

        order.time_organize = time_organize
        order.save()

        return order


class CreatorSerializer(serializers.ModelSerializer):
    user = CustomerSerializer()

    class Meta:
        model = Customer
        fields = ['user']


class CommentSerializer(serializers.ModelSerializer):
    customer = CreatorSerializer()

    class Meta:
        model = Comment
        fields = ['id', 'content', 'customer', 'created_date', 'updated_date']


class RateSerializer(serializers.ModelSerializer):
    customer = CreatorSerializer()

    class Meta:
        model = Rating
        fields = ['id', 'rate', 'customer', 'service', 'hall']


class CreateCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ['id', 'content', 'created_date', 'updated_date']


class BannerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Banner
        fields = ['id', 'name', 'content', 'image']


class ComboServicesSerializer(serializers.ModelSerializer):
    class Meta:
        model = ComboService
        fields = ['id', 'name', 'image', 'price', 'services']

