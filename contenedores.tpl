%include('header.tpl')
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <a href="/inicio" class="logo">
      <span class="logo-lg"><img src="/static/images/logo.png"></span>
    </a>
    <nav class="navbar navbar-static-top">
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="/static/dist/img/user.png" class="user-image" alt="User Image">
              <span class="hidden-xs">{{user}}</span>
            </a>
            <ul class="dropdown-menu">
              <li class="user-header">
                <img src="static/dist/img/user.png" class="img-circle" alt="User Image">
                <p>
                  Bienvenido, {{user}}
                </p>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <aside class="main-sidebar">
    <section class="sidebar">
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENÚ</li>
        <li class="treeview">
		<li><a href="/"><i class="fa fa-window-maximize"></i>Página principal</a></li>
        </li>
	<li class="active treeview">
          <a href="/contenedores">
            <i class="fa fa fa-cubes"></i><span>Contenedores</span>
          </a>
        </li>
        <li class="treeview">
                <li><a href="/snapshots"><i class="fa fa-camera-retro"></i>Snapshots</a></li>
        </li>
        <li class="treeview">
        	<li><a href="http://172.16.101.170/zabbix/hosts.php?ddreset=1"><img src="/static/images/zabbix.jpg"></i>Zabbix (Métricas)</a></li>
        </li>
        <li class="treeview">
        	<li><a href="/redes"><i class="fa fa-edit"></i>Redes</a></li>
        </li>
        <li class="header">ALERTAS</li>
        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Criticas</span>
          <span class="pull-right-container">
            <small class="label pull-right bg-red">1</small>
          </span>
        </a></li>
        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Importantes</span>
          <span class="pull-right-container">
            <small class="label pull-right bg-yellow">1</small>
          </span>
        </a></li>
        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Informativas</span>
          <span class="pull-right-container">
            <small class="label pull-right bg-blue">1</small>
          </span>
        </a></li>
      </ul>
    </section>
  </aside>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>Contenedores</h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Contenedores</li>
      </ol>
    </section>
    <section class="content">
      <div>
	<table class="paleBlueRows">
	  <thead>
	    <tr>
              <th>Nombre</th>
	      <th>IP</th>
	      <th>Arquitectura</th>
	      <th>Imagen</th>
	      <th>Estado</th>
	      <th>Fecha de Creación</th>
	      <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
	  % for i in xrange(lenlista):
	    <tr>
	      <td>{{ lista[i]["nombre"] }}</td>
	      <td>{{ lista[i]["ip"] }}</td>
	      <td>{{ lista[i]["arch"] }}</td>
	      <td>{{ lista[i]["imagen"] }}</td>
	      % if lista[i]["estado"] == 'Running':
	        <td><small class="label pull-right bg-green">{{ lista[i]["estado"] }}</small></td>
	      % else:
		<td><small class="label pull-right bg-red">{{ lista[i]["estado"] }}</small></td>
	      % end
              <td>{{ lista[i]["alive"] }}</td>
	      % if lista[i]["estado"] == 'Stopped':
	        <td>
		  <div class="btn-group">
		    <a class="btn btn-success btn-flat" href="/start/{{lista[i]["nombre"]}}" title="Encender"><i class="fa fa-play"></i></a>
                    <button type="button" class="btn btn-primary btn-flat disabled" title="Reiniciar"><i class="fa fa-refresh"></i></button>
		    <button type="button" class="btn btn-warning btn-flat disabled" title="Apagar"><i class="fa fa-pause"></i></button>
                    <button type="button" class="btn btn-danger btn-flat" data-toggle="modal" data-target="#eliminar-{{lista[i]["nombre"]}}" title="Eliminar">
                        <i class="fa fa-times" aria-hidden="true"></i>
                    </button>
		    <div class="modal modal-danger fade" id="eliminar-{{lista[i]["nombre"]}}">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Eliminar contenedor <strong>{{lista[i]["nombre"]}}</strong></h4>
                          </div>
                          <div class="modal-body">
                            <p>Al continuar con esta acción, se eliminará el contenedor <strong>{{lista[i]["nombre"]}}</strong></p>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-danger btn-flat pull-left" data-dismiss="modal">Cancelar</button>
                            <a class="btn btn-danger btn-flat" href="/eliminarcontenedor/{{lista[i]["nombre"]}}">Eliminar</a>
                          </div>
                        </div>
                        <!-- /.modal-content -->
                      </div>
                      <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
		    <button type="button" class="btn btn-default btn-flatdropdown-toggle"
          		  data-toggle="dropdown">
    		      <span class="caret"></span>
                      <span class="sr-only">Desplegar menú</span>
                    </button>

  		    <ul class="dropdown-menu" role="menu">
		      <li><a href="/rename/{{lista[i]["nombre"]}}">Renombrar</a></li>
    		      <li><a href="/viewinfocontainer/{{lista[i]["nombre"]}}">Ver información</a></li>
    		      <li><a href="/listsnapshots/{{lista[i]["nombre"]}}">Administrar snapshots</a></li>
  		    </ul>
		  </div>
	        </td>
	      % elif lista[i]["estado"] == 'Running':
		<td>
                  <div class="btn-group">
		    <button type="button" class="btn btn-success btn-flat disabled" title="Encender"><i class="fa fa-play"></i></button>
		    <a class="btn btn-primary btn-flat" href="/restart/{{lista[i]["nombre"]}}" title="Reiniciar"><i class="fa fa-refresh"></i></a>
		    <a class="btn btn-warning btn-flat" href="/stop/{{lista[i]["nombre"]}}" title="Apagar"><i class="fa fa-pause"></i></a>
		    <button type="button" class="btn btn-danger btn-flat" data-toggle="modal" data-target="#eliminar-{{lista[i]["nombre"]}}" title="Eliminar">
                	<i class="fa fa-times" aria-hidden="true"></i>
        	    </button>
                    <button type="button" class="btn btn-default btn-flatdropdown-toggle"
                          data-toggle="dropdown">
                      <span class="caret"></span>
                      <span class="sr-only">Desplegar menú</span>
                    </button>
		    <div class="modal modal-danger fade" id="eliminar-{{lista[i]["nombre"]}}">
          	      <div class="modal-dialog">
            		<div class="modal-content">
              		  <div class="modal-header">
                	    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  	      <span aria-hidden="true">&times;</span></button>
                	    <h4 class="modal-title">Eliminar contenedor <strong>{{lista[i]["nombre"]}}</strong></h4>
              		  </div>
              		  <div class="modal-body">
                	    <p>Al continuar con esta acción, se eliminará el contenedor <strong>{{lista[i]["nombre"]}}</strong></p>
              		  </div>
              		  <div class="modal-footer">
                	    <button type="button" class="btn btn-danger btn-flat pull-left" data-dismiss="modal">Cancelar</button>
                	    <a class="btn btn-danger btn-flat" href="/eliminarcontenedor/{{lista[i]["nombre"]}}">Eliminar</a>
              		  </div>
            		</div>
            		<!-- /.modal-content -->
          	      </div>
          	      <!-- /.modal-dialog -->
        	    </div>
        	    <!-- /.modal -->
                    <ul class="dropdown-menu" role="menu">
		      <li><a href="/conectar/{{lista[i]["nombre"]}}">Conectar</a></li>
                      <li><a href="/viewinfocontainer/{{lista[i]["nombre"]}}">Ver información</a></li>
		      <li><a href="/listsnapshots/{{lista[i]["nombre"]}}">Administrar snapshots</a></li>
		      <li><a href="/suspend">Suspender</a></li>
                    </ul>
                  </div>
                </td>
	      % else:
		<td>
                  <div class="btn-group">
		    <a class="btn btn-default btn-flat" href="/activar/{{lista[i]["nombre"]}}">Activar</a>
                    <button type="button" class="btn btn-default btn-flatdropdown-toggle"
                          data-toggle="dropdown">
                      <span class="caret"></span>
                      <span class="sr-only">Desplegar menú</span>
                    </button>

                    <ul class="dropdown-menu" role="menu">
                      <li><a href="/rename/{{lista[i]["nombre"]}}">Renombrar</a></li>
                      <li><a href="/viewinfocontainer/{{lista[i]["nombre"]}}">Ver información</a></li>
		      <li><a class="btn btn-danger btn-flat" data-target="#eliminar-combinador" href="/eliminarcontenedor/{{lista[i]["nombre"]}}">Eliminar contenedor</a></li>
                    </ul>
                  </div>
                </td>
	      % end
	    </tr>
	  % end
          </tbody>
        </table>
      <div>
	</br>
	<a class="btn btn-primary btn-flat pull-right" display="inline-block" href="/crearcontenedor"><i class="fa fa-plus-square" aria-hidden="true"></i>
  Nuevo contenedor</a>
      </div>
    </section>
  </div>
%include('foot.tpl')
