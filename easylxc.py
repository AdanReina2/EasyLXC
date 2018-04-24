import commands
from bottle import *
from lxml import etree
import requests
import ws4py
from sys import argv
import datetime
import psycopg2, psycopg2.extras
import getpass
import os
from pylxd import Client
client = Client()

usuario = getpass.getuser()

@route('/')
def login():
	return template('login.tpl')

@route('/inicio')
def consulta():
	uptime = commands.getoutput("uptime -p")
	totalactivos = 0
	totalapagados = 0
	todos = client.containers.all()
	ramtotal = commands.getoutput("free -h | grep Mem: | cut -d' ' -f12")
	ramused = commands.getoutput("cat /proc/meminfo | grep MemAvailable")
	ramused = ramused.lstrip("MemAvailable:")
	ramused = ramused.rstrip("kB")
	ramused = int(ramused)/1024
	modelprocessor = commands.getoutput("cat /proc/cpuinfo | grep 'model name' | cut -f2")
	modelprocessor = modelprocessor.lstrip(":")
	for i in todos:
		if i.status == "Running":
			totalactivos = totalactivos + 1
		else:
			totalapagados = totalapagados + 1
	return template('resultado.tpl',user=usuario,apagados=totalapagados,activos=totalactivos,ramtotal=ramtotal,ramused=ramused,uptime=uptime,modelprocessor=modelprocessor)

@route('/contenedores')
def contenedores():
	todos = client.containers.all()
	imagenes = client.images.all()
	lista = []
	listaima = []
	img = {}
	contenedor = {}
	lenlista = 0
	lenlistaima = 0
	for a in imagenes:
		listaima.append({"nombre":a.properties["description"],"code":a.fingerprint})
		lenlistaima = lenlistaima + 1
	for i in todos:
		lista.append({"nombre":i.name,"tipo":i.ephemeral,"estado":i.status,"alive":i.created_at[0:19].replace("T"," "),"imagen":i.expanded_config["volatile.base_image"],"arch":i.architecture,"perfiles":i.profiles})
		lenlista = lenlista + 1
	return template('contenedores.tpl',user=usuario,lista=lista,lenlista=lenlista,tipo=type(lenlista),listaima=listaima,lenlistaima=lenlistaima)

@route('/conectar/<name>',method='get')
def conectar(name):
	cad = "lxc exec " + name + " bash"
	os.system("env -u SESSION_MANAGER xterm -e "+cad+" &")
	redirect ('/contenedores')

@route('/start/<name>',method='get')
def start(name):
	conttostart = client.containers.get(name)
	conttostart.start()
	redirect ('/contenedores')

@route('/stop/<name>',method='get')
def start(name):
        conttostop = client.containers.get(name)
        conttostop.stop()
        redirect ('/contenedores')

@route('/activar/<name>',method='get')
def start(name):
        conttoactivate = client.containers.get(name)
        conttostop.unfreeze()
        redirect ('/contenedores')

@route('/freeze/<name>',method='get')
def start(name):
        conttofreeze = client.containers.get(name)
        conttoactivate.freeze()
        redirect ('/contenedores')

@route('/rename/<name>',method='get')
def rename(name):
	return template('rename.tpl',user=usuario,nombre=name)

@route('/rename2/<name>',method='post')
def rename2(name):
	newname = request.forms.get('newname')
	print newname
	print name
	conttorename = client.containers.get(name)
	conttorename.rename(newname,wait=True)
	redirect ('/contenedores')

@route('/viewinfocontainer/<name>')
def viewinfocontainer(name):
	info = commands.getoutput('lxc info '+name+' > /usr/share/files/'+name+'.txt')
	file = open('/usr/share/files/'+name+'.txt')
	leer = file.readlines()
	lista = []
	for i in leer:
		lista.append(i)
	lenlista = len(lista)
	print lenlista
	return template('viewinfocontainer.tpl',user=usuario,info=info,lenlista=lenlista,lista=lista)

@route('/crearcontenedor')
def crearcontenedor():
	return template('crearcontenedor.tpl',user=usuario)

@route('/crearcontenedor2/<dist>/<rel>')
def crearcontenedor2(dist,rel):
	distro = dist
	release = rel
	return template('crearcontenedor2.tpl',user=usuario,distro=distro,release=release)

@route('/crearcontenedor3/<distro>/<release>',method='post')
def crearcontenedor3(distro,release):
	name = request.forms.get('nombre')
	container = 'lxc launch images:'+str(distro)+'/'+str(release)+'/amd64 '+str(name)
	os.system(container)
	redirect ('/contenedores')

@route('/eliminarcontenedor')
def crearcontenedor():
	return template('eliminarcontenedor.tpl',user=usuario)

@route('/graficas')
def graficas():
	return template('graficas.tpl',user=usuario)

@route('/redes')
def redes():
	return template('redes.tpl',user=usuario)

@route('/static/<filepath:path>')
def server_static(filepath):
   return static_file(filepath, root='static')

run(host='0.0.0.0',port='8081')
