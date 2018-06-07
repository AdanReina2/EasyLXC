%include('header.tpl')
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <a href="index2.html" class="logo">
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
      </ul>      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENÚ</li>
        <li class="treeview">
        	<li><a href="/"><i class="fa fa-window-maximize"></i>Página principal</a><li>
        </li>
        <li class="treeview">
          <a href="/contenedores">
            <i class="fa fa-cubes"></i> <span>Contenedores</span>
          </a>
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
        Crear una nueva snapshot
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-window-maximize"></i>Home</a></li>
        <li><a href="#"><i class="fa fa-cubes"></i>Contenedores</a></li>
	<li class="active">Crear un nuevo contenedor</li>
      </ol>
    </section>
    <section class="content">
      <div class="box box-primary">
            <div class="box-header">
              <i class="fa fa-plus-square"></i>

              <h3 class="box-title">Parametros</h3>
            </div>
            <div class="box-body">
              <form action="/crearsnapshot/{{ name }}" method="post">

                <input type="text" class="form-control" name="nombre" placeholder="Nombre de la snapshot">
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="check"> Guardar estado de la memoria RAM
                  </label>
                </div>
                <input class="btn btn-primary btn-flat pull-right" display="inline-block" type="submit" value="Crear snapshot">
              </form>
            </div>
      </div>
    </section>
  </div>
%include('foot.tpl')
