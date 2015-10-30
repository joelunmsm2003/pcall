from django.shortcuts import *
from django.template import RequestContext
from django.contrib.auth import *
from django.contrib.auth.models import Group, User
from django.core import serializers
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.core import serializers
from django.core.urlresolvers import reverse
from django.db.models import Max,Count
from django.core.mail import send_mail
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from PeruCall.models import *
from django.db import transaction
from django.contrib.auth.hashers import *
from django.core.mail import send_mail
from django.db import connection
from django.utils.six.moves import range
from django.http import StreamingHttpResponse
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import permission_required
from django.views.decorators.csrf import csrf_exempt
from ws4redis.redis_store import RedisMessage
from ws4redis.publisher import RedisPublisher

import xlrd
import json 
import csv
import simplejson
import xlwt
import requests
import os

from datetime import datetime
from django.contrib.auth import authenticate

def ingresar(request):

	if request.user.is_authenticated():

		return HttpResponseRedirect("/empresa")

	else:

		if request.method == 'POST':

			print request.POST

			user = request.POST['user']
			
			psw = request.POST['password']

			user = authenticate(username=user, password=psw)

		
			if user is not None:

				if user.is_active:

					login(request, user)

					return HttpResponseRedirect("/empresa")

			else:
				return HttpResponseRedirect("/ingresar")
		
		else:

			return render(request, 'logear.html',{})



def menu(request):

	return render(request, 'menu.html',{})

def empresa(request):

	return render(request, 'empresa.html',{})

def usuario(request):


	return render(request, 'usuario.html',{})




def agentes(request):

		return render(request, 'agentes.html',{})

def user(request):


	datax = User.objects.all().values('author','text')

	data = json.dumps(ValuesQuerySetToDict(datax))

	return HttpResponse(data, content_type="application/json")




def usuarios(request,id):


	usuarios = AuthUser.objects.filter(empresa=id).values('id','username','email','empresa','nivel').order_by('-id')

	data = json.dumps(ValuesQuerySetToDict(usuarios))

	return HttpResponse(data, content_type="application/json")


def empresas(request):

	id = request.user.id

	nivel = AuthUser.objects.get(id=id).nivel.id

	if nivel == 4:

		empresas = Empresa.objects.all().values('id','nombre','licencias','mascaras','telefono','contacto','mail').order_by('-id')

	else:

		empresa = AuthUser.objects.get(id=id).empresa.id

		empresas = Empresa.objects.filter(id=empresa).values('id','nombre','licencias','mascaras','telefono','contacto','mail').order_by('-id')

	data = json.dumps(ValuesQuerySetToDict(empresas))

	if request.method == 'POST':

		tipo = json.loads(request.body)['add']

		data = json.loads(request.body)['dato']

		print 'data',json.loads(request.body)

		if tipo == "New":

			nombre = data['nombre']
			contacto = data['contacto']
			mail = data['mail']
			licencias = data['licencias']
			mascaras = data['mascaras']
			telefono = data['telefono']

			Empresa(nombre=nombre,contacto=contacto,mail=mail,licencias=licencias,mascaras=mascaras,telefono=telefono).save()

			return HttpResponse(nombre, content_type="application/json")


		if tipo=="Edit":

			id= data['id']

			print data

			empresa = Empresa.objects.get(id=id)
			empresa.nombre =data['nombre']
			empresa.contacto =data['contacto']
			empresa.mail =data['mail']
			empresa.licencias =data['licencias']
			empresa.mascaras =data['mascaras']
			empresa.telefono =data['telefono']
			empresa.save()


		if tipo=="Eliminar":

			id= data['id']

			print Empresa.objects.get(id=id).delete()


		return HttpResponse(data['nombre'], content_type="application/json")


	return HttpResponse(data, content_type="application/json")




def salir(request):

	logout(request)
	
	return HttpResponseRedirect("/ingresar")


def ValuesQuerySetToDict(vqs):
    return [item for item in vqs]