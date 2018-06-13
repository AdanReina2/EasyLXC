%include('header.tpl')
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <a href="/inicio" class="logo">
      <span class="logo-lg"><img src="/static/images/logo.png"></span>
    </a>
  </header>
  <aside class="main-sidebar">
    <section class="sidebar">
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">UPTIME</li>
        <li class="treeview">
          <a href="/inicio">
            <i class="fa fa-arrow-up"></i> <span>{{ uptime }}</span>
          </a>
        </li>
      </ul>
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
	  <li><a href="/monitor"><i class="fa fa-dashboard"></i>Monitorización de Ping</a></li>
	</li>
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
                      <li><a href="/viewinfocontainer/{{lista[i]["nombre"]}}">Ver información</a></li>
		      <li><a href="/listsnapshots/{{lista[i]["nombre"]}}">Administrar snapshots</a></li>
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
	<a class="btn btn-primary btn-flat pull-right" display="inline-block" href="/crearcontenedor"><i aria-hidden="true"></i>
  Nuevo contenedor</a>
      </div>
    </section>
  </div>
%include('foot.tpl')
