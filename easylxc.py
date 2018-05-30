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
conn = psycopg2.connect(database='easylxc',user='userlxc',password='easylxc',host='172.16.101.170')
cur = conn.cursor()

@route('/')
def inicio():
	uptime = commands.getoutput("uptime -p")
	totalactivos = 0
	totalapagados = 0
	total = 0
	todos = client.containers.all()
	ramtotal = commands.getoutput("free -m | grep Mem: | cut -d' ' -f12")
	lenramtotal = len(ramtotal)
	ramused = commands.getoutput("cat /proc/meminfo | grep MemAvailable")
	ramused = ramused.lstrip("MemAvailable:")
	lenramused = len(ramused)
	ramused = ramused[:lenramused - 3]
	ramused = int(ramused)/1024
	ramused = int(ramtotal)-ramused
	limiteram = int(ramtotal)*70
	limiteram = int(limiteram)/100
	disktotal = commands.getoutput("df -h /dev/sda1 | tr -s ' ' | cut -d ' ' -f2 | tail -1")
	diskused = commands.getoutput("df -h /dev/sda1 | tr -s ' ' | cut -d ' ' -f3 | tail -1")
	lendisktotal = len(disktotal)
	disktotal = disktotal[:lendisktotal - 1]
	limitedisk = int(disktotal)*70
	limitedisk = int(limitedisk)/100
	modelprocessor = commands.getoutput("cat /proc/cpuinfo | grep 'model name' | cut -f2")
	modelprocessor = modelprocessor.lstrip(":")
	for i in todos:
		total = total + 1
		if i.status == "Running":
			totalactivos = totalactivos + 1
		else:
			totalapagados = totalapagados + 1
	return template('resultado.tpl',user=usuario,apagados=totalapagados,activos=totalactivos,ramtotal=ramtotal,ramused=ramused,uptime=uptime,modelprocessor=modelprocessor,limiteram=limiteram,disktotal=disktotal,diskused=diskused,limitedisk=limitedisk,total=total)

@route('/contenedores')
def contenedores():
	uptime = commands.getoutput("uptime -p")
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
		cur.execute("select * from contenedores")
		rows = cur.fetchall()
		for z in rows:
			if i.name == z[0]:
				imagencont = str(z[1]) + " " + str(z[2])
			else:
				imagencont = "None"
		ip = commands.getoutput("lxc list " + i.name + " -c '4' | tail -2 | head -1")
		ip = ip.lstrip("| ")
		ip = ip.rstrip(" |")
		lista.append({"nombre":i.name,"estado":i.status,"alive":i.created_at[0:19].replace("T"," "),"imagen":imagencont,"arch":i.architecture,"ip":ip})
		lenlista = lenlista + 1
	return template('contenedores.tpl',user=usuario,lista=lista,lenlista=lenlista,tipo=type(lenlista),listaima=listaima,lenlistaima=lenlistaima,uptime=uptime)

@route('/snapshots')
def snapshots():
	uptime = commands.getoutput("uptime -p")
	return template('snapshots.tpl',user=usuario,uptime=uptime)

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

@route('/restart/<name>',method='get')
def restart(name):
	conttorestart = client.containers.get(name)
	conttorestart.restart()
	redirect ('/contenedores')

@route('/rename/<name>',method='get')
def rename(name):
	uptime = commands.getoutput("uptime -p")
	return template('rename.tpl',user=usuario,nombre=name,uptime=uptime)

@route('/rename2/<name>',method='post')
def rename2(name):
	newname = request.forms.get('newname')
	conttorename = client.containers.get(name)
	conttorename.rename(newname,wait=True)
	redirect ('/contenedores')

@route('/formcrearsnapshot/<name>')
def formcrearsnapshot(name):
	uptime = commands.getoutput("uptime -p")
	return template('formcrearsnapshot.tpl',user=usuario,name=name,uptime=uptime)

@route('/crearsnapshot/<name>',method='post')
def crearsnapshot(name):
	checkvalue = request.forms.get('check')
	snapname = request.forms.get('nombre')
	container = client.containers.get(name)
	if checkvalue == "on":
		snap = container.snapshots.create(snapname, stateful=True, wait=True)
	else:
		snap = container.snapshots.create(snapname, stateful=False, wait=True)
	redirect ('/listsnapshots/' + str(name))

@route('/listsnapshots/<name>',method='get')
def listsnapshots(name):
	uptime = commands.getoutput("uptime -p")
	numsnap = commands.getoutput('lxc list | grep '+name+' | cut -d"|" -f7')
	snapshots = commands.getoutput('lxc info '+name+' | tail -2')
	listasnap = []
	lista = []
	linea = snapshots.split("\n")
	for i in linea:
		listasnap = []
		campos = i.split("(")
		nombre = campos[0]
		creacion = campos[1]
		estado = campos[2]
		listasnap.append(nombre.strip())
		listasnap.append(creacion.rstrip("( "))
		listasnap.append(estado.rstrip("( "))
		lista.append(listasnap)
		print lista
	return template('snapshots.tpl',user=usuario,lista=lista,uptime=uptime,name=name)

@route('/viewinfocontainer/<name>')
def viewinfocontainer(name):
	uptime = commands.getoutput("uptime -p")
	info = commands.getoutput('lxc info '+name+' > /usr/share/files/'+name+'.txt')
	file = open('/usr/share/files/'+name+'.txt')
	leer = file.readlines()
	lista = []
	for i in leer:
		lista.append(i)
	lenlista = len(lista)
	return template('viewinfocontainer.tpl',user=usuario,info=info,lenlista=lenlista,lista=lista,name=name,uptime=uptime)

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
	cur.execute("insert into contenedores values (\'" + str(name) + "\',\'" + str(distro) + "\',\'" + str(release) + "\')")
	cur.execute("select * from contenedores")
	rows = cur.fetchall()
	for i in rows:
		print i
	conn.commit()
	redirect ('/contenedores')

@route('/eliminarcontenedor/<nombre>',method='get')
def eliminarcontenedor(nombre):
	container = 'lxc delete ' + str(nombre) + ' --force'
	os.system(container)
	redirect ('/contenedores')

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
