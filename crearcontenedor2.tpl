%include('header.tpl')
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <a href="index2.html" class="logo">
      <span class="logo-lg"><img src="/static/images/logo.png"></span>
    </a>
    <nav class="navbar navbar-static-top">
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

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
        	<li><a href="/inicio"><i class="fa fa-window-maximize"></i>Página principal</a><li>
        </li>
        <li class="active treeview">
          <a href="/contenedores">
            <i class="fa fa-cubes"></i> <span>Contenedores</span>
          </a>
        </li>
        <li class="treeview">
        	<li><a href="/graficas"><i class="fa fa fa-pie-chart"></i>Gráficas</a></li>
        </li>
        <li class="treeview">
        	<li><a href="/redes"><i class="fa fa-edit"></i>Redes</a></li>
        </li>
      </ul>
    </section>
  </aside>

  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Contenedores
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

              <h3 class="box-title">Ultimos detalles ...</h3>
            </div>
            <div class="box-body">
              <form action="/crearcontenedor3/{{ distro }}/{{ release }}" method="post">
                <input type="text" class="form-control" name="nombre" placeholder="Nombre del contenedor">
                </br>
                <p>Distribución del SO: {{ distro }}</p>
                <p>Versión de la distribución: {{ release }}</p>
                <div class="box-footer clearfix">
                  <input class="btn btn-primary btn-flat" display="inline-block" type="submit" value="Crear contenedor">
                </div>
              </form>
            </div>
      </div>
    </section>
  </div>
%include('foot.tpl')
