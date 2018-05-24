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
	<li class="header">UPTIME</li>
	<li class="treeview">
	  <a href="/inicio">
	    <i class="fa fa-arrow-up"></i> <span>{{ uptime }}</span>
	  </a>
	</li>
      </ul>
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENÚ</li>
        <li class="active treeview">
          <a href="/">
	    <i class="fa fa-window-maximize"></i>Pagina Principal</a>
	  </a>
        </li>
	</a>
        <li class="treeview">
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
      <h1>
        Dashboard
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Principal</li>
      </ol>
    </section>
    <section class="content">
      <h1>
        Información de contenedores
      </h1>
      <div class="row">
        <div class="col-md-4">
          <div class="small-box bg-light-blue color-palette">
            <div class="inner">
              <h3>{{ total }}</h3>

              <p>Total de contenedores</p>
            </div>
            <div class="icon">
              <i class="ion ion-tux"></i>
            </div>
            <a href="/contenedores" class="small-box-footer">Ver todos los contenedores <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
	<div class="col-md-4">
          <div class="small-box bg-green">
            <div class="inner">
              <h3>{{ activos }}</h3>

              <p>Contenedores activos</p>
            </div>
            <div class="icon">
              <i class="ion ion-arrow-up-b"></i>
            </div>
	    <a href="/contenedores" class="small-box-footer">Ver todos los contenedores <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-md-4">
          <div class="small-box bg-red">
            <div class="inner">
              <h3>{{ apagados }}</h3>

              <p>Contenedores apagados</p>
            </div>
            <div class="icon">
              <i class="ion ion-arrow-down-b"></i>
            </div>
	    <a href="/contenedores" class="small-box-footer">Ver todos los contenedores <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
      </div>
      <h1>
        Información de los recursos del anfitrión
      </h1>
      <div class="callout callout-default">
        <h4>{{ modelprocessor }}</h4>

        <p>Modelo del procesador</p>
      </div>
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-light-blue color-palette">
            <div class="inner">
              <h3>{{ ramtotal }}M</h3>

              <p>Memoria RAM total del anfitrión</p>
            </div>
          </div>
        </div>
	% if ramused > limiteram:
          <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-red">
              <div class="inner">
                <h3>{{ ramused }}M</h3>

                <p>Memoria RAM usada</p>
              </div>
            </div>
          </div>
	% else:
	  <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-green">
              <div class="inner">
                <h3>{{ ramused }}M</h3>

                <p>Memoria RAM usada</p>
              </div>
            </div>
          </div>
	% end
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-light-blue color-palette">
            <div class="inner">
              <h3>{{ disktotal }}G</h3>

              <p>Espacio de disco total del anfitrión</p>
            </div>
          </div>
        </div>
        % if diskused > limitedisk:
          <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-red">
              <div class="inner">
                <h3>{{ diskused }}</h3>

                <p>Espacio de disco usado del anfitrión</p>
              </div>
            </div>
          </div>
        % else:
          <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-green">
              <div class="inner">
                <h3>{{ diskused }}</h3>

                <p>Espacio de disco usado del anfitrión</p>
              </div>
            </div>
          </div>
        % end
      </div>
    </section>
  </div>
</script>
%include('foot.tpl')
