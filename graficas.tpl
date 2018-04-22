%include('header.tpl')
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <a href="index2.html" class="logo">
      <span class="logo-mini"><b>S</b>MT</span>
      <span class="logo-lg"><b>Smother</b></span>
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
        	<li><a href="/"><i class="fa fa-window-maximize"></i>Página principal</a><li>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-cubes"></i> <span>Contenedores</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/privilegiados"><i class="fa fa-cube"></i>Privilegiados</a></li>
            <li><a href="/noprivilegiados"><i class="fa fa-cube"></i>No privilegiados</a></li>
          </ul>
        </li>
        <li class="active treeview">
          <a href="#">
            <i class="fa fa fa-pie-chart"></i> <span>Gráficas</span>
          </a>
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
        Gráficas
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-window-maximize"></i>Home</a></li>
        <li class="active">Gráficas</li>
      </ol>
    </section>
    <section class="content">
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>150</h3>

              <p>Contenedores creados</p>
            </div>
            <a href="#" class="small-box-footer">Más información <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>53</h3>

              <p>Contenedores activos</p>
            </div>
            <a href="#" class="small-box-footer">Más información <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>Nuevo contenedor<sup style="font-size: 20px"></sup></h3>

              <p>Crea un nuevo contenedor privilegiado</p>
            </div>
            <a href="#" class="small-box-footer">Crear <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
      </div>
    </section>
  </div>
%include('foot.tpl')
