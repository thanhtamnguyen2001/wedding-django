from django.contrib.auth.models import AbstractUser
from django.db import models
import time
from datetime import date

year, month, day, hour, minute = map(int, time.strftime("%Y %m %d %H %M").split())
day = date.today()


class User(AbstractUser):
    is_customer = models.BooleanField(default=False)
    is_employee = models.BooleanField(default=False)
    avatar = models.ImageField(upload_to="static/users/%Y/%m")


class ModelBase(models.Model):
    active = models.BooleanField(default=True)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class Customer(ModelBase):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)

    def __str__(self):
        return self.user.username


class Hall(ModelBase):  # Sanh Cuoi
    name = models.CharField(max_length=255, unique=True)
    capacity = models.IntegerField()
    price = models.FloatField(null=True, default=0)
    image = models.ImageField(null=True, blank=True, upload_to="static/halls/%Y/%m")
    morning_price = models.FloatField(null=True, default=0)
    noon_price = models.FloatField(null=True, default=0)
    night_price = models.FloatField(null=True, default=0)
    free = models.BooleanField(default=True)
    time_organize = models.ManyToManyField('DateOfOrganization', through='HallOrganize')

    def save(self, *args, **kwargs):
        super().save()
        regulation = Regulation.objects.last()

        if day.weekday() in (5, 6):
            weekday = regulation.weekend_price

        self.morning_price = self.price * float(regulation.morning_price) * weekday
        self.noon_price = self.price * float(regulation.noon_price) * weekday
        self.night_price = self.price * float(regulation.night_price) * weekday

        super().save(*args, **kwargs)

    def __str__(self):
        return self.name


class DateOfOrganization(models.Model):  # Ngay to chuc
    date = models.DateField(null=True)
    morning, noon, night = range(3)
    shift_choices = [
        (morning, 'Buổi sáng'),
        (noon, 'Buổi trưa'),
        (night, 'Buổi tối'),
    ]
    shift = models.PositiveSmallIntegerField(choices=shift_choices, default=morning)
    regulation = models.ForeignKey('Regulation', on_delete=models.SET_NULL, null=True)

    class Meta:
        unique_together = ('date', 'shift')

    def __str__(self):
        return f'{self.date} Shift: {self.shift}'


class HallOrganize(models.Model):
    hall = models.ForeignKey(Hall, on_delete=models.CASCADE)
    time_organize = models.ForeignKey(DateOfOrganization, on_delete=models.CASCADE)
    price = models.FloatField(null=True)

    class Meta:
        unique_together = ('hall', 'time_organize')

    def save(self, *args, **kwargs):
        super().save()
        regulation = Regulation.objects.last()
        weekday = 0
        if self.time_organize.date.weekday() in (5, 6):
            weekday = regulation.weekend_price
        self.hall.morning_price = self.price * float(regulation.morning_price) * weekday
        self.hall.noon_price = self.price * float(regulation.noon_price) * weekday
        self.hall.night_price = self.price * float(regulation.night_price) * weekday
        if self.time_organize.shift == 0:
            self.price = self.hall.noon_price
        if self.time_organize.shift == 1:
            self.price = self.hall.morning_price
        if self.time_organize.shift == 2:
            self.price = self.hall.night_price

        super().save(*args, **kwargs)

    def __str__(self):
        return f'{self.hall} - {self.time_organize} -{self.price}'


class Category(ModelBase):  # Loai mon an
    name = models.CharField(max_length=255, unique=True)

    def __str__(self):
        return self.name


class Food(ModelBase):  # Mon An
    name = models.CharField(max_length=255, unique=True)
    price = models.FloatField()
    category = models.ForeignKey(Category, related_name="foods", null=True, on_delete=models.SET_NULL)
    image = models.ImageField(null=True, blank=True, upload_to="static/foods/%Y/%m")

    def __str__(self):
        return self.name


class Menu(ModelBase):
    name = models.CharField(max_length=50, unique=True)
    image = models.ImageField(null=True, blank=True, upload_to="static/menu/%Y/%m")
    foods = models.ManyToManyField(Food)
    price = models.FloatField(null=True, blank=True, default=0)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        super().save()
        for food in self.foods.all():
            self.price = self.price + food.price
        super().save(*args, **kwargs)


class Service(ModelBase):  # Dich vu
    name = models.CharField(max_length=255, unique=True)
    price = models.FloatField()
    content = models.TextField(null=True)
    image = models.ImageField(null=True, blank=True, upload_to="static/services/%Y/%m")

    def __str__(self):
        return self.name


class ComboService(ModelBase):
    name = models.CharField(max_length=50, unique=True)
    image = models.ImageField(null=True, blank=True, upload_to="static/combo-service/%Y/%m")
    services = models.ManyToManyField(Service)
    price = models.FloatField(null=True, blank=True, default=0)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        super().save()
        for service in self.services.all():
            self.price = self.price + service.price
        super().save(*args, **kwargs)


class Regulation(ModelBase):
    name = models.CharField(max_length=20, null=True)
    morning_price = models.FloatField(null=True)
    noon_price = models.FloatField(null=True)
    night_price = models.FloatField(null=True)
    weekend_price = models.FloatField(null=True)

    def __str__(self):
        return self.name


class Order(ModelBase):  # Phieu dat tiec
    customer = models.ForeignKey(Customer, related_name="receipts", on_delete=models.CASCADE, null=True)
    employee = models.ForeignKey(User, related_name="receipts", on_delete=models.CASCADE, null=True)
    hall = models.ForeignKey(Hall, related_name="receipts", null=True, on_delete=models.SET_NULL)
    combo_services = models.ForeignKey(ComboService, related_name="receipts", on_delete=models.CASCADE, null=True)
    menu = models.ForeignKey(Menu, on_delete=models.CASCADE, null=True)
    time_organize = models.ForeignKey(DateOfOrganization, related_name="receipts", null=True,
                                      on_delete=models.CASCADE)  # Ngày tổ chức
    number_of_table = models.IntegerField(null=True)  # Số lượng bàn
    groom_name = models.CharField(max_length=100, null=True)  # Tên chú rể
    bride_name = models.CharField(max_length=100, null=True)  # Tên cô dâu
    date = models.CharField(max_length=20, null=True)
    shift = models.PositiveSmallIntegerField(null=True)

    # regulation = models.ForeignKey('Regulation', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return f'{self.time_organize}-{self.customer}-{self.hall}'


class Comment(ModelBase):
    content = models.TextField()
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, null=True)

    class Meta:
        ordering = ['-id']

    def __str__(self):
        return self.content


class Rating(ModelBase):
    rate = models.SmallIntegerField(default=0)
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, null=True)
    service = models.ForeignKey(Service, related_name='rates', on_delete=models.CASCADE, null=True)
    hall = models.ForeignKey(Hall, related_name='rates', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return f'{self.customer}-{self.rate}'


class Banner(ModelBase):
    name = models.CharField(max_length=20, null=True)
    content = models.TextField()
    image = models.ImageField(null=True, blank=True, upload_to="static/banners/%Y/%m")

    def __str__(self):
        return self.name

