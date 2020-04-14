# -*- encoding: utf-8 -*-
from django.db import models
# 2. Переписать SQL запрос на Django Query API

# Модель

class Test(models.Model):

    a = models.IntegerField(verbose_name='a', default=0, blank=True)

    b = models.IntegerField(verbose_name='b', default=0, blank=True)

#
#
#     def __str__(self):
#
#         return '{}, {}'.format(self.a, self.b)
#
#
#
# ## tzt_test - имя таблицы
#
# ## SQL - sql-запрос
#
#
#
# select distinct a, b from tzt_test where a > b;


test_objs = Test.objects.filter(a__gt=models.F("b")).distinct('a', 'b')
