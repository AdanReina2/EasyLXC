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
	  <a href="/">
	    <i class="fa fa-arrow-up"></i> <span>{{ uptime }}</span>
	  </a>
	</li>
      </ul>
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENÚ</li>
        <li class="treeview">
          <a href="/">
	    <i class="fa fa-window-maximize"></i>Página principal</a>
	  </a>
        </li>
	</a>
        <li class="treeview">
                <li><a href="/contenedores"><i class="fa fa-cubes"></i>Contenedores</a></li>
        </li>
	<li class="active treeview">
          <a href="/snapshots">
            <i class="fa fa-camera-retro"></i><span>Snapshots</span>
          </a>
        </li>
        <li class="treeview">
        	<li><a href="http://192.168.43.69/zabbix/hosts.php?ddreset=1"><img src="/static/images/zabbix-logo.png"></i>  Zabbix (Métricas)</a></li>
        </li>
      </ul>
    </section>
  </aside>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Snapshots del contenedor <strong>{{ name }}</strong>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="/snapshots"><i class="fa fa-dashboard"></i> Snapshots</a></li>
        <li class="active">Snapshots de {{ name }}</li>
      </ol>
    </section>
    <section class="content">
      <div>
	<table class="paleBlueRows">
	  <thead>
	    <tr>
	      <th>Nombre</th>
	      <th>Fecha de Creación</th>
	      <th>Estado</th>
	      <th>Acciones</th>
	    </tr>
	  </thead>
	  <tbody>
	    % for i in lista:
	      <tr>
	        <td>{{ i[0] }}</td>
		<td>{{ i[1] }}</td>
		<td>{{ i[2] }}</td>
		<td>
		  <a class="btn btn-default btn-flat"" href="/renamesnap/{{ i[0] }}/{{ name }}">
		    <i aria-hidden="true"></i>
		    Renombrar
                  </a>
		  <a class="btn btn-danger btn-flat"" href="/eliminarsnap/{{ i[0] }}/{{ name }}">
                    <i aria-hidden="true"></i>
                    Eliminar
                  </a>
		</td>
	      </tr>
	    % end
	  </tbody>
	</table>
      </br>
      <a class="btn btn-primary btn-flat pull-right" display="inline-block" href="/formcrearsnapshot/{{ name }}"><i aria-hidden="true"></i>
  Nueva Snapshot</a>
    </section>
  </div>
</script>
%include('foot.tpl')
