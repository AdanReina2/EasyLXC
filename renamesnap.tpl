%include('header.tpl')
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <a class="logo">
      <span class="logo-lg"><b>EasyLXC</b></span>
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
      </ul>      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENÚ</li>
        <li class="treeview">
          <a href="/">
            <i class="fa fa-window-maximize"></i> <span>Página principal</span>
          </a>
        </li>
        <li class="treeview">
                <li><a href="/contenedores"><i class="fa fa-cubes"></i>Contenedores</a></li>
        </li>
	<li class="active treeview">
                <li><a href="/snapshots"><i class="fa fa-camera-retro"></i>Snapshots</a></li>
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
        Renombrar snapshot <strong>{{ nombresnap }}</strong>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/inicio"><i class="fa fa-window-maximize"></i> Home</a></li>
        <li><a href="/snapshots"><i class="fa fa-camera-retro"></i>Snapshots</a></li>
        <li class="active">Renombrar</li>
      </ol>
    </section>
    <section class="content">
      <div class="box-body">
        <p>Nombre actual de la snapshot: {{ nombresnap }}</p>
        <form action="/renamesnap2/{{ nombresnap }}/{{ nombrecont }}" method="post">
          <input type="text" class="form-control" name="newname" placeholder="Nuevo nombre de la snapshot">
          <div class="box-footer clearfix">
            <input class="btn btn-primary btn-flat pull-right" display="inline-block" type="submit" value="Renombrar contenedor">
          </div>
        </form>
      </div>
    </section>
  </div>
%include('foot.tpl')
