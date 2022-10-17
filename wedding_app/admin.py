from django.contrib import admin
from django.db.models.functions import TruncMonth, TruncYear, TruncQuarter
from django.db.models import Count, Sum
from django.template.response import TemplateResponse
from django.urls import path
from django.utils.html import mark_safe

from .models import User, Hall, Category, Food, Service, \
    DateOfOrganization, Order, Customer, \
    Regulation, HallOrganize, Menu, Comment, ComboService, Banner


# from .utils import *


class OrderAdmin(admin.ModelAdmin):
    search_fields = ['hall__name', 'hall__id', 'date_of_organization__shift']
    exclude = ('date', 'shift')

    def get_urls(self):
        return [
                   path('order-stats/', self.stats_order),
                   path('income-stats/', self.stats_income)
               ] + super().get_urls()

    def stats_order(self, request):
        year = request.GET.get('year', 2022)
        stats_by = request.GET.get('stats_by', 1)
        if year is not None:
            orders_month = DateOfOrganization.objects.filter(date__year=year).annotate(month=TruncMonth('date')) \
                .values('month').annotate(order_count=Count('receipts')) \
                .values('month', 'order_count')

        if year is not None:
            orders_quarter = DateOfOrganization.objects.filter(date__year=year).annotate(quarter=TruncQuarter('date')) \
                .values('quarter').annotate(order_count=Count('receipts')) \
                .values('quarter', 'order_count')

        if year is not None:
            orders_year = DateOfOrganization.objects.annotate(year=TruncYear('date')) \
                .values('year').annotate(order_count=Count('receipts')) \
                .values('year', 'order_count')

        return TemplateResponse(request, 'admin/order_stats.html', {
            'orders_year': orders_year,
            'orders_month': orders_month,
            'orders_quarter': orders_quarter,
            'stats_by': stats_by,
            "year": year,
        })

    def stats_income(self, request):
        year = request.GET.get('year', 2022)
        stats_by = request.GET.get('stats_by', 1)
        type_stats = request.GET.get('types', 4)
        if year is not None:
            income_month = DateOfOrganization.objects.filter(date__year=year).annotate(month=TruncMonth('date')) \
                .values('month').annotate(service_price_sum=Sum('receipts__combo_services__price'),
                                          hall_price_sum=Sum('receipts__hall__price'),
                                          menu_price_sum=Sum('receipts__menu__price')) \
                .values('month', 'service_price_sum', 'hall_price_sum', 'menu_price_sum')

        if year is not None:
            income_quarter = DateOfOrganization.objects.filter(date__year=year).annotate(quarter=TruncQuarter('date')) \
                .values('quarter').annotate(service_price_sum=Sum('receipts__combo_services__price'),
                                            hall_price_sum=Sum('receipts__hall__price'),
                                            menu_price_sum=Sum('receipts__menu__price')) \
                .values('quarter', 'service_price_sum', 'hall_price_sum', 'menu_price_sum')

        if year is not None:
            income_year = DateOfOrganization.objects.annotate(year=TruncYear('date')) \
                .values('year').annotate(service_price_sum=Sum('receipts__combo_services__price'),
                                         hall_price_sum=Sum('receipts__hall__price'),
                                         menu_price_sum=Sum('receipts__menu__price')) \
                .values('year', 'service_price_sum', 'hall_price_sum', 'menu_price_sum')

        return TemplateResponse(request, 'admin/income_stats.html', {
            'stats_by': stats_by,
            'income_month': income_month,
            'income_quarter': income_quarter,
            'income_year': income_year,
            "year": year,
            'type_stats': type_stats
        })


class UserAdmin(admin.ModelAdmin):
    search_fields = ['username']


class MenuAdmin(admin.ModelAdmin):
    exclude = ('price',)


class ComboAdmin(admin.ModelAdmin):
    exclude = ('price',)


class HallAdmin(admin.ModelAdmin):
    exclude = ('morning_price', 'noon_price', 'night_price')


admin.site.register(User, UserAdmin)
admin.site.register(Customer)
admin.site.register(HallOrganize)
admin.site.register(Regulation)
admin.site.register(Hall, HallAdmin)
admin.site.register(Category)
admin.site.register(Food)
admin.site.register(Menu, MenuAdmin)
admin.site.register(Service)
admin.site.register(Order, OrderAdmin)
admin.site.register(DateOfOrganization)
admin.site.register(Comment)
admin.site.register(ComboService, ComboAdmin)
admin.site.register(Banner)
