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
        <li class="active treeview">
                <li><a href="/contenedores"><i class="fa fa-cubes"></i>Contenedores</a></li>
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
      <h1>
        Renombrar contenedor {{ nombre }}
      </h1>
      <ol class="breadcrumb">
        <li><a href="/inicio"><i class="fa fa-window-maximize"></i> Home</a></li>
        <li><a href="/contenedores"><i class="fa fa-cubes"></i>Contenedores</a></li>
        <li class="active">Renombrar</li>
      </ol>
    </section>
    <section class="content">
      <div class="box-body">
        <p>Nombre actual del contenedor: {{ nombre }}</p>
        <form action="/rename2/{{ nombre }}" method="post">
          <input type="text" class="form-control" name="newname" placeholder="Nuevo nombre del contenedor">
          <div class="box-footer clearfix">
            <input class="btn btn-primary btn-flat" display="inline-block" type="submit" value="Renombrar contenedor">
          </div>
        </form>
      </div>
    </section>
  </div>
%include('foot.tpl')
