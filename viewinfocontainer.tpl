%include('header.tpl')
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <a class="logo">
      <span class="logo-lg"><b>EasyLXC</b></span>
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
                <img src="/static/dist/img/user.png" class="img-circle" alt="User Image">
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
        	<li><a href="/graficas"><i class="fa fa-pie-chart"></i>Gráficas</a></li>
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
        Información del contenedor
      </h1>
      <ol class="breadcrumb">
	<li><a href="/"><i class="fa fa-window-maximize"></i>Home</a></li>
        <li><a href="#"><i class="fa fa-cubes"></i>Contenedores</a></li>
        <li class="active">Información del contenedor<li>
      </ol>
    </section>
    <section class="content">
      {{ file }}
    </section>
  </div>
%include('foot.tpl')
